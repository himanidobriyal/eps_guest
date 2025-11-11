package com.ireps.admin.goods.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ireps.admin.goods.service.CaptchaService;

@Controller
public class CaptchaController {
    
    @Autowired
    private CaptchaService captchaService;
    
    /**
     * Generate and display captcha image
     */
    @RequestMapping(value = "/captcha", method = RequestMethod.GET)
    public void generateCaptcha(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        HttpSession session = request.getSession();
        
        // Generate new captcha code and store in session
        String captchaCode = captchaService.generateCaptchaCode(session);
        
        // Create captcha image
        BufferedImage captchaImage = captchaService.createCaptchaImage(captchaCode);
        
        // Set response headers to prevent caching
        response.setContentType("image/png");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setHeader("X-Frame-Options", "DENY"); // Security header
        
        // Write image to response
        ImageIO.write(captchaImage, "png", response.getOutputStream());
        response.getOutputStream().flush();
    }
    
    /**
     * Validate captcha for real-time feedback (doesn't remove from session)
     */
    @RequestMapping(value = "/validateCaptcha", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> validateCaptcha(@RequestParam("captcha") String userCaptcha, 
                                               HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        
        // Validate without removing from session (for real-time validation)
        Map<String, Object> result = captchaService.validateCaptcha(userCaptcha, session, false);
        
        return result;
    }
    
    /**
     * Final captcha verification for form submission (removes from session)
     */
    @RequestMapping(value = "/verifyCaptchaForSubmit", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> verifyCaptchaForSubmit(@RequestParam("captcha") String userCaptcha,
                                                      @RequestParam(value = "organisation", required = false) String organisation,
                                                      @RequestParam(value = "zone", required = false) String zone,
                                                      @RequestParam(value = "department", required = false) String department,
                                                      @RequestParam(value = "adminUnit", required = false) String adminUnit,
                                                      HttpServletRequest request) {
        
        Map<String, Object> response = new HashMap<>();
        HttpSession session = request.getSession();
        
        // Validate all required fields first
        if (isEmptyOrNull(organisation) || isEmptyOrNull(zone) || 
            isEmptyOrNull(department) || isEmptyOrNull(adminUnit)) {
            response.put("valid", false);
            response.put("message", "Please fill all required fields");
            response.put("errorCode", "MISSING_REQUIRED_FIELDS");
            return response;
        }
        
        // Validate captcha and remove from session if valid
        Map<String, Object> captchaResult = captchaService.validateCaptcha(userCaptcha, session, true);
        
        if ((Boolean) captchaResult.get("valid")) {
            response.put("valid", true);
            response.put("message", "Form validation successful");
            response.put("canProceed", true);
            
            // Log successful validation (optional)
            System.out.println("Form validation successful for session: " + session.getId());
            
        } else {
            response.putAll(captchaResult);
        }
        
        return response;
    }
    
    /**
     * Clear captcha from session (useful for reset operations)
     */
    @RequestMapping(value = "/clearCaptcha", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> clearCaptcha(HttpServletRequest request) {
        
        Map<String, Object> response = new HashMap<>();
        HttpSession session = request.getSession();
        
        captchaService.clearCaptcha(session);
        
        response.put("success", true);
        response.put("message", "Captcha cleared successfully");
        
        return response;
    }
    
    /**
     * Get captcha status (useful for debugging)
     */
    @RequestMapping(value = "/captchaStatus", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCaptchaStatus(HttpServletRequest request) {
        
        Map<String, Object> response = new HashMap<>();
        HttpSession session = request.getSession();
        
        String captchaCode = (String) session.getAttribute("CAPTCHA_CODE");
        Long timestamp = (Long) session.getAttribute("CAPTCHA_TIMESTAMP");
        
        response.put("hasCaptcha", captchaCode != null);
        response.put("timestamp", timestamp);
        response.put("sessionId", session.getId());
        
        if (timestamp != null) {
            long timeElapsed = System.currentTimeMillis() - timestamp;
            response.put("timeElapsed", timeElapsed);
            response.put("isExpired", timeElapsed > (5 * 60 * 1000)); // 5 minutes
        }
        
        return response;
    }
    
    // Utility method to check if string is empty or null
    private boolean isEmptyOrNull(String str) {
        return str == null || str.trim().isEmpty();
    }
}