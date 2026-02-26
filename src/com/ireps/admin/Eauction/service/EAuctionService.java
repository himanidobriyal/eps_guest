package com.ireps.admin.Eauction.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ireps.admin.Eauction.dao.EAuctionDAO;
import com.ireps.admin.Eauction.model.AuctionSchedule;

/**
 * Service Layer for E-Auction Management
 * Handles business logic for auction operations
 * UPDATED: Added catalog details and lot viewing methods for 3rd action button
 * VERSION: 2.2
 */
@Service
@Transactional
public class EAuctionService {

    @Autowired
    private EAuctionDAO eAuctionDAO;

    /**
     * Get all accounts for initial dropdown load
     */
    public List<Map<String, Object>> getAccounts() {
    	
    	
        try {
            System.out.println("Service: getAccounts() called");
            List<Map<String, Object>> accounts = eAuctionDAO.getAllAccounts();
            System.out.println("Service: Returned " + accounts.size() + " accounts");
            return accounts;
        } catch (Exception e) {
            System.err.println("Error in getAccounts: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<AuctionSchedule> getLiveAuctions(
            String accountId,
            String depotId,
            String catalogStatus,
            Date fromDate,
            Date toDate) {

        try {
            System.out.println("Service: getLiveAuctions() called");

            List<AuctionSchedule> auctions =
                    eAuctionDAO.getLiveAuctions(
                            accountId,
                            depotId,
                            catalogStatus,
                            fromDate,
                            toDate);

            System.out.println("Service: Returned " + auctions.size() + " auctions");

            return auctions;

        } catch (Exception e) {
            System.err.println("Error in getLiveAuctions: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    
    
  

    /**
     * Get accounts filtered by organization type
     */
    public List<Map<String, Object>> getAccountsByType(String orgType) {
        try {
            System.out.println("\n========== GET ACCOUNTS BY TYPE ==========");
            System.out.println("Service: getAccountsByType() called with orgType: '" + orgType + "'");

            if (orgType == null || orgType.trim().isEmpty()) {
                System.out.println("Service: orgType is null/empty, returning ALL accounts");
                List<Map<String, Object>> accounts = eAuctionDAO.getAllAccounts();
                System.out.println("Service: Returned " + accounts.size() + " accounts");
                System.out.println("==========================================\n");
                return accounts;
            }

            List<Map<String, Object>> accounts = new ArrayList<>();
            String orgTypeUpper = orgType.trim().toUpperCase();
            System.out.println("Service: Processing orgType = '" + orgTypeUpper + "'");

            switch (orgTypeUpper) {
                case "RAILWAY":
                    System.out.println("Service: Fetching INDIAN RAILWAY accounts");
                    accounts = eAuctionDAO.getIndianRailwayAccounts();
                    break;
                case "DMRC":
                    System.out.println("Service: Fetching DMRC accounts");
                    accounts = eAuctionDAO.getDMRCAccounts();
                    break;
                case "OTHERS":
                    System.out.println("Service: Fetching OTHER accounts");
                    accounts = eAuctionDAO.getOtherAccounts();
                    break;
                default:
                    System.out.println("Service: Unknown orgType, returning all accounts");
                    accounts = eAuctionDAO.getAllAccounts();
            }

            System.out.println("Service: Final result - " + accounts.size() + " accounts");
            System.out.println("==========================================\n");
            return accounts;

        } catch (Exception e) {
            System.err.println("ERROR in getAccountsByType: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get depots for a specific account
     */
    public List<Map<String, Object>> getDepotsByAccount(String accountId) {
        try {
            System.out.println("Service: getDepotsByAccount() called with accountId: " + accountId);
            
            if (accountId == null || accountId.trim().isEmpty()) {
                System.out.println("Service: accountId is empty, returning empty list");
                return new ArrayList<>();
            }
            
            List<Map<String, Object>> depots = eAuctionDAO.getDepotsByAccountId(accountId.trim());
            System.out.println("Service: Returned " + depots.size() + " depots");
            return depots;

        } catch (Exception e) {
            System.err.println("ERROR in getDepotsByAccount: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Search auction schedule with multiple filters and pagination
     * UPDATED: Now includes PDF path (catFilePath) in response
     */
    public Map<String, Object> searchAuctionSchedule(String accountId, String depotId, 
                                                     String catalogStatus, String fromDate, 
                                                     String toDate, int page, int pageSize) {
        Map<String, Object> result = new HashMap<>();

        try {
            System.out.println("\n========== AUCTION SEARCH SERVICE ==========");
            System.out.println("Search Parameters:");
            System.out.println("  Account ID: " + (accountId != null ? accountId : "N/A"));
            System.out.println("  Depot ID: " + (depotId != null ? depotId : "N/A"));
            System.out.println("  Catalog Status: " + (catalogStatus != null ? catalogStatus : "N/A"));
            System.out.println("  From Date: " + (fromDate != null ? fromDate : "N/A"));
            System.out.println("  To Date: " + (toDate != null ? toDate : "N/A"));

            // Parse dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fromDateObj = null;
            Date toDateObj = null;

            if (fromDate != null && !fromDate.trim().isEmpty()) {
                try {
                    fromDateObj = dateFormat.parse(fromDate.trim());
                    System.out.println("  Parsed From Date: " + fromDateObj);
                } catch (Exception e) {
                    System.err.println("Error parsing from date: " + e.getMessage());
                }
            }

            if (toDate != null && !toDate.trim().isEmpty()) {
                try {
                    toDateObj = dateFormat.parse(toDate.trim());
                    System.out.println("  Parsed To Date: " + toDateObj);
                } catch (Exception e) {
                    System.err.println("Error parsing to date: " + e.getMessage());
                }
            }

            // Fetch live auctions
            List<AuctionSchedule> liveAuctions = eAuctionDAO.getLiveAuctions(
                    accountId, depotId, catalogStatus, fromDateObj, toDateObj);
            System.out.println("Live auctions found: " + liveAuctions.size());

            // Fetch upcoming auctions
            List<AuctionSchedule> upcomingAuctions = eAuctionDAO.getUpcomingAuctions(
                    accountId, depotId, fromDateObj, toDateObj);
            System.out.println("Upcoming auctions found: " + upcomingAuctions.size());

            // Combine results
            List<AuctionSchedule> allAuctions = new ArrayList<>();
            allAuctions.addAll(liveAuctions);
            allAuctions.addAll(upcomingAuctions);

            // Apply pagination
            int totalCount = allAuctions.size();
            int offset = (page - 1) * pageSize;
            int endIndex = Math.min(offset + pageSize, totalCount);
            
            List<AuctionSchedule> paginatedResults = new ArrayList<>();
            if (totalCount > 0 && offset < totalCount) {
                paginatedResults = allAuctions.subList(offset, endIndex);
            }

            int totalPages = totalCount > 0 ? (totalCount + pageSize - 1) / pageSize : 1;

            // Convert to Map for JSON response - INCLUDES PDF PATH
            List<Map<String, Object>> resultMaps = new ArrayList<>();
            for (AuctionSchedule auction : paginatedResults) {
                Map<String, Object> auctionMap = new HashMap<>();
                auctionMap.put("scheduleNo", auction.getScheduleNo());
                auctionMap.put("scheduleId", auction.getScheduleId());
                auctionMap.put("accountId", auction.getAccountId());
                auctionMap.put("accountName", auction.getAccountName());
                auctionMap.put("depotId", auction.getDepotId());
                auctionMap.put("depotName", auction.getDepotName());
                auctionMap.put("catalogId", auction.getCatalogId());
                auctionMap.put("catalogNo", auction.getCatalogNo());
                auctionMap.put("catalogStatus", auction.getCatalogStatus());
                auctionMap.put("catalogStatusLabel", auction.getCatalogStatusLabel());
                auctionMap.put("auctionStartDatetime", auction.getAuctionStartDatetime());
                auctionMap.put("auctionEndDatetime", auction.getAuctionEndDatetime());
                
                // ⭐ CRITICAL: Include PDF path in response for download button
                auctionMap.put("catFilePath", auction.getCatFilePath());
                
                resultMaps.add(auctionMap);
            }

            // Prepare response
            result.put("success", true);
            result.put("results", resultMaps);
            result.put("totalCount", totalCount);
            result.put("totalPages", totalPages);
            result.put("currentPage", page);
            result.put("pageSize", pageSize);

            System.out.println("\n=== SEARCH RESULTS ===");
            System.out.println("Total Count: " + totalCount);
            System.out.println("Total Pages: " + totalPages);
            System.out.println("Items in this page: " + paginatedResults.size());
            
            // Log if PDF paths are present
            if (!paginatedResults.isEmpty()) {
                long pdfCount = paginatedResults.stream()
                    .filter(a -> a.getCatFilePath() != null && !a.getCatFilePath().trim().isEmpty())
                    .count();
                System.out.println("Auctions with PDF: " + pdfCount + "/" + paginatedResults.size());
            }
            System.out.println("==========================================\n");

        } catch (Exception e) {
            System.err.println("ERROR in searchAuctionSchedule: " + e.getMessage());
            e.printStackTrace();
            
            result.put("success", false);
            result.put("error", "Search failed: " + e.getMessage());
            result.put("results", new ArrayList<>());
            result.put("totalCount", 0);
            result.put("totalPages", 0);
        }

        return result;
    }

    /**
     * ⭐⭐⭐ NEW METHOD: Get catalog header details - For 3rd Action Button ⭐⭐⭐
     * Returns catalog information including depot, account, dates, status, PDF path
     */
    public Map<String, Object> getCatalogHeaderDetails(Long catalogId) throws Exception {
        try {
            System.out.println("\n========== GET CATALOG HEADER DETAILS ==========");
            System.out.println("Service: getCatalogHeaderDetails() called");
            System.out.println("Catalog ID: " + catalogId);
            
            if (catalogId == null || catalogId <= 0) {
                System.out.println("✗ Invalid catalog ID");
                return null;
            }
            
            Map<String, Object> header = eAuctionDAO.getCatalogHeaderDetails(catalogId);
            
            if (header != null && !header.isEmpty()) {
                System.out.println("✓ Catalog header found:");
                System.out.println("  - Catalog No: " + header.get("CATALOG_NO"));
                System.out.println("  - Depot: " + header.get("DEPOT_NAME"));
                System.out.println("  - Account: " + header.get("ACCOUNT_NAME"));
                System.out.println("  - Status: " + header.get("STATUS_LABEL"));
                System.out.println("  - PDF Path: " + header.get("CAT_FILE_PATH"));
            } else {
                System.out.println("⚠ No catalog header found for ID: " + catalogId);
            }
            
            System.out.println("===============================================\n");
            return header;
            
        } catch (Exception e) {
            System.err.println("✗ Error getting catalog header: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Failed to get catalog header: " + e.getMessage());
        }
    }

    /**
     * ⭐⭐⭐ NEW METHOD: Get all lots for a catalog - For 3rd Action Button ⭐⭐⭐
     * Returns complete lot details including material description, quantity, dates, status
     */
    public List<Map<String, Object>> getLotsByCatalogId(Long catalogId) throws Exception {
        try {
            System.out.println("\n========== GET LOTS BY CATALOG ID ==========");
            System.out.println("Service: getLotsByCatalogId() called");
            System.out.println("Catalog ID: " + catalogId);
            
            if (catalogId == null || catalogId <= 0) {
                System.out.println("✗ Invalid catalog ID");
                return new ArrayList<>();
            }
            
            List<Map<String, Object>> lots = eAuctionDAO.getLotsByCatalogId(catalogId);
            
            if (lots != null && !lots.isEmpty()) {
                System.out.println("✓ Found " + lots.size() + " lots");
                
                // Log first few lot numbers for verification
                int displayCount = Math.min(5, lots.size());
                System.out.println("  Sample lot numbers:");
                for (int i = 0; i < displayCount; i++) {
                    Map<String, Object> lot = lots.get(i);
                    System.out.println("    - " + lot.get("LOT_NO") + ": " + lot.get("LOT_MATERIAL_DESC"));
                }
                if (lots.size() > displayCount) {
                    System.out.println("    ... and " + (lots.size() - displayCount) + " more");
                }
            } else {
                System.out.println("⚠ No lots found for catalog ID: " + catalogId);
            }
            
            System.out.println("==========================================\n");
            return lots != null ? lots : new ArrayList<>();
            
        } catch (Exception e) {
            System.err.println("✗ Error getting lots: " + e.getMessage());
            e.printStackTrace();
            throw new Exception("Failed to get lots: " + e.getMessage());
        }
    }

    /**
     * Get catalog PDF path by catalog ID - For 4th Action Button (Download)
     */
    public String getCatalogPDFPath(Long catalogId) {
        try {
            System.out.println("\n>>> Service: getCatalogPDFPath() called");
            System.out.println("Catalog ID: " + catalogId);
            
            if (catalogId == null || catalogId <= 0) {
                System.out.println("✗ Invalid catalog ID");
                return null;
            }
            
            String pdfPath = eAuctionDAO.getCatalogPDFPath(catalogId);
            
            if (pdfPath != null && !pdfPath.trim().isEmpty()) {
                System.out.println("✓ PDF Path found: " + pdfPath);
            } else {
                System.out.println("⚠ No PDF path found for catalog ID: " + catalogId);
            }
            
            return pdfPath;
            
        } catch (Exception e) {
            System.err.println("✗ Error getting PDF path: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get catalog details including PDF info
     */
    public Map<String, Object> getCatalogDetails(Long catalogId) {
        try {
            System.out.println("Service: getCatalogDetails() called for ID: " + catalogId);
            Map<String, Object> details = eAuctionDAO.getCatalogDetails(catalogId);
            
            if (details != null) {
                System.out.println("✓ Catalog details found");
            } else {
                System.out.println("⚠ No catalog details found");
            }
            
            return details;
            
        } catch (Exception e) {
            System.err.println("✗ Error getting catalog details: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get all auctions (combined live + upcoming)
     */
    public List<AuctionSchedule> getAllAuctions() {
        try {
            List<AuctionSchedule> liveAuctions = eAuctionDAO.getLiveAuctions(null, null, null, null, null);
            List<AuctionSchedule> upcomingAuctions = eAuctionDAO.getUpcomingAuctions(null, null, null, null);
            
            List<AuctionSchedule> allAuctions = new ArrayList<>();
            allAuctions.addAll(liveAuctions);
            allAuctions.addAll(upcomingAuctions);
            
            System.out.println("getAllAuctions: Total " + allAuctions.size() + " auctions");
            return allAuctions;
            
        } catch (Exception e) {
            System.err.println("Error in getAllAuctions: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    /**
     * Count live auctions
     */
    public int countLiveAuctions() {
        try {
            List<AuctionSchedule> liveAuctions = eAuctionDAO.getLiveAuctions(null, null, null, null, null);
            int count = liveAuctions != null ? liveAuctions.size() : 0;
            System.out.println("Live auctions count: " + count);
            return count;
        } catch (Exception e) {
            System.err.println("Error counting live auctions: " + e.getMessage());
            return 0;
        }
    }

    /**
     * Count upcoming auctions
     */
    public int countUpcomingAuctions() {
        try {
            List<AuctionSchedule> upcomingAuctions = eAuctionDAO.getUpcomingAuctions(null, null, null, null);
            int count = upcomingAuctions != null ? upcomingAuctions.size() : 0;
            System.out.println("Upcoming auctions count: " + count);
            return count;
        } catch (Exception e) {
            System.err.println("Error counting upcoming auctions: " + e.getMessage());
            return 0;
        }
    }
}