package com.ireps.admin.SPO.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ireps.admin.SPO.model.PurchaseOrder;
import com.ireps.admin.SPO.service.PurchaseOrderService;

@Controller
@RequestMapping("/eps/spo")
public class PurchaseOrderController {

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    // GET → Show purchase order search page
    @GetMapping("/manage.do")
    public String showPurchaseOrderPage(Model model, HttpSession session) {
        // Generate verification code and store in session
        String verificationCode = purchaseOrderService.generateVerificationCode();
        session.setAttribute("verificationCode", verificationCode);
        
        // Get railway list
        List<Map<String, Object>> railwayList = purchaseOrderService.getRailwayList();
        model.addAttribute("railwayList", railwayList);
        model.addAttribute("verificationCode", verificationCode);
        
        return "purchase.order.search.defination";
    }

    // GET → Refresh verification code dynamically
    @GetMapping("/refreshCode.do")
    @ResponseBody
    public Map<String, String> refreshVerificationCode(HttpSession session) {
        String newCode = purchaseOrderService.generateVerificationCode();
        session.setAttribute("verificationCode", newCode);
        
        Map<String, String> response = new HashMap<>();
        response.put("code", newCode);
        return response;
    }

    // GET → Fetch railway list dynamically
    @GetMapping("/getRailways.do")
    @ResponseBody
    public List<Map<String, Object>> getRailwayList() {
        return purchaseOrderService.getRailwayList();
    }

    // GET → Fetch account details dynamically
    @GetMapping("/getAccounts/{accountName}")
    @ResponseBody
    public List<Map<String, Object>> getAccounts(@PathVariable("accountName") String accountName) {
        return purchaseOrderService.getAccountDetails(accountName);
    }

    // POST → Search purchase orders
    @PostMapping("/searchPurchaseOrders.do")
    @ResponseBody
    public Map<String, Object> searchPurchaseOrders(@RequestParam String railway,
                                                   @RequestParam(required = false) String supplierName,
                                                   @RequestParam(required = false) String plNumber,
                                                   @RequestParam(required = false) String fromDate,
                                                   @RequestParam(required = false) String toDate,
                                                   @RequestParam(required = false) String valueFrom,
                                                   @RequestParam(required = false) String valueTo,
                                                   @RequestParam String verificationCode,
                                                   HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        // Validate verification code
        String sessionCode = (String) session.getAttribute("verificationCode");
        
        if (!purchaseOrderService.validateVerificationCode(verificationCode, sessionCode)) {
            response.put("error", "Invalid verification code");
            return response;
        }
        
        try {
            // Convert String dates to java.util.Date (not java.sql.Date)
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fromDateUtil = null;
            Date toDateUtil = null;
            
            if (fromDate != null && !fromDate.isEmpty()) {
                fromDateUtil = dateFormat.parse(fromDate);
            }
            
            if (toDate != null && !toDate.isEmpty()) {
                toDateUtil = dateFormat.parse(toDate);
            }

            // Convert value strings to BigDecimal
            BigDecimal valueFromDec = null;
            BigDecimal valueToDec = null;
            
            if (valueFrom != null && !valueFrom.isEmpty()) {
                valueFromDec = new BigDecimal(valueFrom);
            }
            
            if (valueTo != null && !valueTo.isEmpty()) {
                valueToDec = new BigDecimal(valueTo);
            }

            // Debug logging
            System.out.println("=== Search Parameters ===");
            System.out.println("Railway: " + railway);
            System.out.println("Supplier: " + supplierName);
            System.out.println("PL Number: " + plNumber);
            System.out.println("From Date: " + fromDateUtil);
            System.out.println("To Date: " + toDateUtil);
            System.out.println("Value From: " + valueFromDec);
            System.out.println("Value To: " + valueToDec);

            // Perform search
            List<PurchaseOrder> results = purchaseOrderService.searchPurchaseOrders(
                railway, supplierName, plNumber, fromDateUtil, toDateUtil, valueFromDec, valueToDec);
            
            System.out.println("=== Search Results ===");
            System.out.println("Total results found: " + results.size());
            
            // Debug: Print first few results to see structure
            if (!results.isEmpty()) {
                System.out.println("Sample result:");
                PurchaseOrder first = results.get(0);
                System.out.println("PO No: " + first.getPoNo());
                System.out.println("PO SR: " + first.getPoSr());
                System.out.println("PL No: " + first.getPlNo());
                System.out.println("Supplier: " + first.getVaddr());
            }
            
            response.put("success", true);
            response.put("results", results);
            response.put("totalCount", results.size());
            
        } catch (Exception e) {
            System.err.println("Search Error: " + e.getMessage());
            e.printStackTrace();
            response.put("error", "Search failed: " + e.getMessage());
        }
        
        return response;
    }
}