package com.ireps.admin.goods.service;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

@Service
public class CaptchaService {
    
    private static final String CAPTCHA_SESSION_KEY = "CAPTCHA_CODE";
    private static final String CAPTCHA_TIMESTAMP_KEY = "CAPTCHA_TIMESTAMP";
    private static final int CAPTCHA_WIDTH = 120;
    private static final int CAPTCHA_HEIGHT = 40;
    private static final int CAPTCHA_LENGTH = 5;
    private static final long CAPTCHA_VALIDITY_TIME = 5 * 60 * 1000; // 5 minutes
    
    // Using SecureRandom for better security
    private final SecureRandom random = new SecureRandom();
    
    // Characters excluding confusing ones
    private static final String CAPTCHA_CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
    
    public String generateCaptchaCode(HttpSession session) {
        String captchaCode = generateRandomString();
        long timestamp = System.currentTimeMillis();
        
        session.setAttribute(CAPTCHA_SESSION_KEY, captchaCode);
        session.setAttribute(CAPTCHA_TIMESTAMP_KEY, timestamp);
        
        return captchaCode;
    }
    
    public BufferedImage createCaptchaImage(String captchaCode) {
        BufferedImage image = new BufferedImage(CAPTCHA_WIDTH, CAPTCHA_HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = image.createGraphics();
        
        // Enable anti-aliasing for better quality
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
        
        // Create gradient background
        createGradientBackground(g2d);
        
        // Add noise lines
        addNoiseLines(g2d);
        
        // Draw captcha characters
        drawCaptchaText(g2d, captchaCode);
        
        // Add noise dots
        addNoiseDots(g2d);
        
        g2d.dispose();
        return image;
    }
    
    public Map<String, Object> validateCaptcha(String userCaptcha, HttpSession session, boolean removeAfterValidation) {
        Map<String, Object> result = new HashMap<>();
        
        String sessionCaptcha = (String) session.getAttribute(CAPTCHA_SESSION_KEY);
        Long timestamp = (Long) session.getAttribute(CAPTCHA_TIMESTAMP_KEY);
        
        // Check if captcha exists in session
        if (sessionCaptcha == null || timestamp == null) {
            result.put("valid", false);
            result.put("message", "Captcha expired or not found");
            result.put("errorCode", "CAPTCHA_NOT_FOUND");
            return result;
        }
        
        // Check if captcha has expired
        if (System.currentTimeMillis() - timestamp > CAPTCHA_VALIDITY_TIME) {
            session.removeAttribute(CAPTCHA_SESSION_KEY);
            session.removeAttribute(CAPTCHA_TIMESTAMP_KEY);
            result.put("valid", false);
            result.put("message", "Captcha has expired");
            result.put("errorCode", "CAPTCHA_EXPIRED");
            return result;
        }
        
        // Validate captcha (case insensitive)
        if (sessionCaptcha.equalsIgnoreCase(userCaptcha.trim())) {
            result.put("valid", true);
            result.put("message", "Captcha is valid");
            
            // Remove captcha from session if requested
            if (removeAfterValidation) {
                session.removeAttribute(CAPTCHA_SESSION_KEY);
                session.removeAttribute(CAPTCHA_TIMESTAMP_KEY);
            }
        } else {
            result.put("valid", false);
            result.put("message", "Invalid captcha code");
            result.put("errorCode", "CAPTCHA_INVALID");
        }
        
        return result;
    }
    
    public void clearCaptcha(HttpSession session) {
        session.removeAttribute(CAPTCHA_SESSION_KEY);
        session.removeAttribute(CAPTCHA_TIMESTAMP_KEY);
    }
    
    private String generateRandomString() {
        StringBuilder captcha = new StringBuilder();
        for (int i = 0; i < CAPTCHA_LENGTH; i++) {
            captcha.append(CAPTCHA_CHARS.charAt(random.nextInt(CAPTCHA_CHARS.length())));
        }
        return captcha.toString();
    }
    
    private void createGradientBackground(Graphics2D g2d) {
        // Create a light gradient background
        Color color1 = new Color(240, 248, 255); // Alice blue
        Color color2 = new Color(248, 248, 255); // Ghost white
        
        for (int y = 0; y < CAPTCHA_HEIGHT; y++) {
            float ratio = (float) y / CAPTCHA_HEIGHT;
            int red = (int) (color1.getRed() * (1 - ratio) + color2.getRed() * ratio);
            int green = (int) (color1.getGreen() * (1 - ratio) + color2.getGreen() * ratio);
            int blue = (int) (color1.getBlue() * (1 - ratio) + color2.getBlue() * ratio);
            
            g2d.setColor(new Color(red, green, blue));
            g2d.drawLine(0, y, CAPTCHA_WIDTH, y);
        }
    }
    
    private void addNoiseLines(Graphics2D g2d) {
        g2d.setColor(new Color(200, 200, 200, 100)); // Semi-transparent gray
        for (int i = 0; i < 8; i++) {
            int x1 = random.nextInt(CAPTCHA_WIDTH);
            int y1 = random.nextInt(CAPTCHA_HEIGHT);
            int x2 = random.nextInt(CAPTCHA_WIDTH);
            int y2 = random.nextInt(CAPTCHA_HEIGHT);
            g2d.drawLine(x1, y1, x2, y2);
        }
    }
    
    private void drawCaptchaText(Graphics2D g2d, String captchaCode) {
        Font[] fonts = {
            new Font("Arial", Font.BOLD, 18),
            new Font("Times New Roman", Font.BOLD, 18),
            new Font("Courier New", Font.BOLD, 18)
        };
        
        Color[] colors = {
            new Color(0, 100, 200),    // Dark blue
            new Color(200, 0, 0),      // Dark red  
            new Color(0, 150, 0),      // Dark green
            new Color(150, 0, 150),    // Purple
            new Color(200, 100, 0)     // Orange
        };
        
        for (int i = 0; i < captchaCode.length(); i++) {
            // Random font and color for each character
            g2d.setFont(fonts[random.nextInt(fonts.length)]);
            g2d.setColor(colors[random.nextInt(colors.length)]);
            
            // Calculate position
            int x = 8 + (i * 20);
            int y = 25 + random.nextInt(8) - 4; // Add vertical variation
            
            // Apply random rotation
            AffineTransform originalTransform = g2d.getTransform();
            double angle = (random.nextDouble() - 0.5) * 0.4; // -0.2 to 0.2 radians
            g2d.rotate(angle, x + 5, y);
            
            // Draw character
            g2d.drawString(String.valueOf(captchaCode.charAt(i)), x, y);
            
            // Reset transform
            g2d.setTransform(originalTransform);
        }
    }
    
    private void addNoiseDots(Graphics2D g2d) {
        for (int i = 0; i < 30; i++) {
            g2d.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255), 50));
            int x = random.nextInt(CAPTCHA_WIDTH);
            int y = random.nextInt(CAPTCHA_HEIGHT);
            g2d.fillOval(x, y, 2, 2);
        }
    }
}