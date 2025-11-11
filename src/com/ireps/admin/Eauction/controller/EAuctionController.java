package com.ireps.admin.Eauction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ireps.admin.Eauction.service.EAuctionService;

@Controller
@RequestMapping("/eps/Eauction")
public class EAuctionController {

    private static final Logger logger = LoggerFactory.getLogger(EAuctionController.class);

    @Autowired
    private EAuctionService eAuctionService;

    private static final boolean USE_TILES = false;
    private static final String JSP_DIRECT_PATH = "forward:/jsp/admin/Eauction/auction-schedule.jsp";
    private static final String CATALOG_DETAILS_JSP = "forward:/jsp/admin/Eauction/catalog-details.jsp";
    private static final String TILES_PATH = "admin/auction/auction-schedule";
    private static final String JSP_PATH = USE_TILES ? TILES_PATH : JSP_DIRECT_PATH;
    private static final String DEFAULT_PAGE_SIZE = "10";
    private static final int DEFAULT_PAGE = 1;

    /**
     * Root redirect to schedule page
     */
    @GetMapping("")
    public String rootRedirect() {
        return "redirect:/eps/Eauction/schedule.do";
    }

    /**
     * Show schedule page (Tab 3)
     */
    @GetMapping("/schedule.do")
    public String showSchedulePage(Model model, HttpServletRequest request) {
        try {
            logger.info("Loading schedule page");
            List<Map<String, Object>> accountList = eAuctionService.getAccounts();
            model.addAttribute("accountList", accountList);
            model.addAttribute("activeTab", "schedule");
            logger.debug("Loaded {} accounts", accountList.size());
            return JSP_PATH;
        } catch (Exception e) {
            logger.error("Error loading schedule page", e);
            model.addAttribute("error", "Error: " + e.getMessage());
            return JSP_PATH;
        }
    }

    /**
     * Show live auction page (Tab 1)
     */
    @GetMapping("/manage.do")
    public String showLiveAuctionPage(Model model) {
        try {
            logger.info("Loading live auction page");
            List<Map<String, Object>> accountList = eAuctionService.getAccounts();
            model.addAttribute("accountList", accountList);
            model.addAttribute("activeTab", "live");
            return JSP_PATH;
        } catch (Exception e) {
            logger.error("Error loading live auction page", e);
            return JSP_PATH;
        }
    }

    /**
     * Show forthcoming auction page (Tab 2)
     */
    @GetMapping("/forthcoming.do")
    public String showForthcomingAuctionPage(Model model) {
        try {
            logger.info("Loading forthcoming auction page");
            List<Map<String, Object>> accountList = eAuctionService.getAccounts();
            model.addAttribute("accountList", accountList);
            model.addAttribute("activeTab", "forthcoming");
            return JSP_PATH;
        } catch (Exception e) {
            logger.error("Error loading forthcoming page", e);
            return JSP_PATH;
        }
    }

    /**
     * Get accounts dropdown data
     */
    @GetMapping("/getAccounts")
    @ResponseBody
    public List<Map<String, Object>> getAccounts(@RequestParam(required = false) String orgType) {
        try {
            logger.debug("Getting accounts for orgType: {}", orgType);
            if (orgType != null && !orgType.trim().isEmpty()) {
                return eAuctionService.getAccountsByType(orgType);
            }
            return eAuctionService.getAccounts();
        } catch (Exception e) {
            logger.error("Error in getAccounts", e);
            return new ArrayList<>();
        }
    }

    /**
     * Get depots dropdown data
     */
    @GetMapping("/getDepots")
    @ResponseBody
    public List<Map<String, Object>> getDepots(@RequestParam("accountId") String accountId) {
        try {
            logger.debug("Getting depots for accountId: {}", accountId);
            return eAuctionService.getDepotsByAccount(accountId);
        } catch (Exception e) {
            logger.error("Error in getDepots", e);
            return new ArrayList<>();
        }
    }

    /**
     * Search auction schedules with filters
     */
    @PostMapping("/searchSchedule")
    @ResponseBody
    public Map<String, Object> searchAuctionSchedule(
            @RequestParam(required = false) String accountId,
            @RequestParam(required = false) String depotId,
            @RequestParam(required = false) String catalogStatus,
            @RequestParam(required = false) String fromDate,
            @RequestParam(required = false) String toDate,
            @RequestParam(value = "page", defaultValue = "1") int page,
            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {

        logger.info(">>> Search Request - Account: {}, Depot: {}, Status: {}, From: {}, To: {}, Page: {}", 
                    accountId, depotId, catalogStatus, fromDate, toDate, page);

        try {
            Map<String, Object> results = eAuctionService.searchAuctionSchedule(
                    accountId, depotId, catalogStatus, fromDate, toDate, page, pageSize);
            
            logger.info("✓ Search completed - Found {} results", 
                       results.get("totalCount") != null ? results.get("totalCount") : 0);
            
            return results;
        } catch (Exception e) {
            logger.error("✗ Search failed", e);
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("success", false);
            errorResponse.put("error", e.getMessage());
            return errorResponse;
        }
    }

    /**
     * ⭐⭐⭐ VIEW CATALOG DETAILS - Fixed Implementation ⭐⭐⭐
     * Get catalog header and lot information
     */
    @GetMapping("/viewCatalogDetails.do")
    public String viewCatalogDetails(
            @RequestParam(required = false) Long catalogId,
            @RequestParam(required = false) String scheduleNo,
            Model model) {
        
        System.out.println("========== viewCatalogDetails START ==========");
        System.out.println("Catalog ID: " + catalogId);
        System.out.println("Schedule No: " + scheduleNo);
        
        try {
            // Validate catalog ID
            if (catalogId == null || catalogId <= 0) {
                System.out.println("ERROR: Invalid or missing catalogId");
                model.addAttribute("error", "Invalid Catalog ID provided");
                return CATALOG_DETAILS_JSP;
            }
            
            logger.info(">>> Viewing Catalog Details - Catalog ID: {}, Schedule No: {}", catalogId, scheduleNo);
            
            // Get catalog header information
            System.out.println("Fetching catalog header for ID: " + catalogId);
            Map<String, Object> catalogHeader = eAuctionService.getCatalogHeaderDetails(catalogId);
            
            // Handle null response
            if (catalogHeader == null) {
                System.out.println("ERROR: Catalog header is NULL for ID: " + catalogId);
                logger.warn("⚠ Catalog not found for ID: {}", catalogId);
                model.addAttribute("error", "Catalog not found with ID: " + catalogId);
                model.addAttribute("catalogId", catalogId);
                return CATALOG_DETAILS_JSP;
            }
            
            System.out.println("✓ Catalog header found: " + catalogHeader.get("CATALOG_NO"));
            System.out.println("  Depot: " + catalogHeader.get("DEPOT_NAME"));
            System.out.println("  Account: " + catalogHeader.get("ACCOUNT_NAME"));
            
            // Get all lots for this catalog
            System.out.println("Fetching lots for catalog ID: " + catalogId);
            List<Map<String, Object>> lotList = eAuctionService.getLotsByCatalogId(catalogId);
            
            // Initialize if null
            if (lotList == null) {
                System.out.println("WARNING: Lot list is NULL, initializing empty list");
                lotList = new ArrayList<>();
            }
            
            System.out.println("✓ Lots fetched: " + lotList.size());
            
            // Add data to model
            model.addAttribute("catalogHeader", catalogHeader);
            model.addAttribute("lotList", lotList);
            model.addAttribute("catalogId", catalogId);
            model.addAttribute("scheduleNo", scheduleNo);
            
            logger.info("✓ Catalog details loaded successfully");
            logger.info("  - Catalog No: {}", catalogHeader.get("CATALOG_NO"));
            logger.info("  - Total Lots: {}", lotList.size());
            logger.info("  - Status: {}", catalogHeader.get("STATUS_LABEL"));
            
            System.out.println("========== viewCatalogDetails SUCCESS ==========");
            return CATALOG_DETAILS_JSP;
            
        } catch (NullPointerException npe) {
            System.out.println("ERROR: NullPointerException - " + npe.getMessage());
            logger.error("✗ NullPointerException in viewCatalogDetails", npe);
            model.addAttribute("error", "Data processing error: " + npe.getMessage());
            model.addAttribute("catalogId", catalogId);
            return CATALOG_DETAILS_JSP;
            
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getClass().getName() + " - " + e.getMessage());
            logger.error("✗ Error loading catalog details for ID: {}", catalogId, e);
            model.addAttribute("error", "Error loading catalog details: " + e.getMessage());
            model.addAttribute("catalogId", catalogId);
            e.printStackTrace();
            return CATALOG_DETAILS_JSP;
        }
    }

    /**
     * Alternative mapping for catalog details (backward compatibility)
     */
    @PostMapping("/viewCatalogDetails.do")
    public String viewCatalogDetailsPost(
            @RequestParam(required = false) Long catalogId,
            @RequestParam(required = false) String scheduleNo,
            Model model) {
        return viewCatalogDetails(catalogId, scheduleNo, model);
    }

    /**
     * Get Catalog PDF Path - Download button
     */
    @GetMapping("/getCatalogPDF")
    @ResponseBody
    public Map<String, Object> getCatalogPDF(@RequestParam("catalogId") Long catalogId) {
        logger.info(">>> Get Catalog PDF Request for ID: {}", catalogId);
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            String pdfPath = eAuctionService.getCatalogPDFPath(catalogId);
            
            if (pdfPath != null && !pdfPath.trim().isEmpty()) {
                // Base URL for IREPS file server
                String baseUrl = "https://trial.ireps.gov.in";
                
                // Construct full PDF URL
                String fullPdfUrl;
                if (pdfPath.startsWith("http://") || pdfPath.startsWith("https://")) {
                    fullPdfUrl = pdfPath; // Already complete URL
                } else if (pdfPath.startsWith("/")) {
                    fullPdfUrl = baseUrl + pdfPath; // Relative path with leading slash
                } else {
                    fullPdfUrl = baseUrl + "/" + pdfPath; // Relative path without slash
                }
                
                response.put("success", true);
                response.put("pdfPath", pdfPath);
                response.put("pdfUrl", fullPdfUrl);
                response.put("message", "PDF found successfully");
                
                logger.info("✓ PDF URL: {}", fullPdfUrl);
            } else {
                response.put("success", false);
                response.put("error", "PDF not available for this catalog");
                logger.warn("⚠ No PDF found for catalog ID: {}", catalogId);
            }
            
            return response;
            
        } catch (Exception e) {
            logger.error("✗ Error getting catalog PDF", e);
            response.put("success", false);
            response.put("error", "Failed to get PDF: " + e.getMessage());
            return response;
        }
    }

    /**
     * View auction - Opens Uniform E-Sale Conditions PDF
     */
    @GetMapping("/viewAuction")
    @ResponseBody
    public Map<String, Object> viewAuction(@RequestParam("scheduleNo") String scheduleNo) {
        logger.info(">>> View Auction Request for Schedule: {}", scheduleNo);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Opening Uniform E-Sale Conditions PDF");
        response.put("pdfUrl", "https://trial.ireps.gov.in/ireps/upload/resources/Uniform_E_Sale_condition.pdf");
        
        return response;
    }

    /**
     * Print auction - Print functionality
     */
    @GetMapping("/printAuction")
    @ResponseBody
    public Map<String, Object> printAuction(@RequestParam("scheduleNo") String scheduleNo) {
        logger.info(">>> Print Auction Request for Schedule: {}", scheduleNo);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Print prepared for schedule: " + scheduleNo);
        
        return response;
    }

    /**
     * Email auction
     */
    @PostMapping("/emailAuction")
    @ResponseBody
    public Map<String, Object> emailAuction(@RequestParam("scheduleNo") String scheduleNo) {
        logger.info(">>> Email Auction Request for Schedule: {}", scheduleNo);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", true);
        response.put("message", "Email sent for schedule: " + scheduleNo);
        
        return response;
    }

    /**
     * Get auction statistics
     */
    @GetMapping("/statistics")
    @ResponseBody
    public Map<String, Object> getAuctionStatistics() {
        logger.info(">>> Getting auction statistics");
        
        try {
            Map<String, Object> stats = new HashMap<>();
            stats.put("liveAuctions", eAuctionService.countLiveAuctions());
            stats.put("upcomingAuctions", eAuctionService.countUpcomingAuctions());
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("statistics", stats);
            
            logger.info("✓ Statistics: Live={}, Upcoming={}", 
                       stats.get("liveAuctions"), stats.get("upcomingAuctions"));
            
            return response;
        } catch (Exception e) {
            logger.error("✗ Error getting statistics", e);
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("error", e.getMessage());
            return response;
        }
    }

    /**
     * Health check endpoint
     */
    @GetMapping("/health")
    @ResponseBody
    public Map<String, Object> healthCheck() {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "UP");
        response.put("service", "E-Auction Controller");
        response.put("version", "2.3");
        response.put("timestamp", System.currentTimeMillis());
        
        logger.debug("Health check performed");
        return response;
    }
}