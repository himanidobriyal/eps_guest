package com.ireps.admin.auction.service;

import com.ireps.admin.auction.dao.AuctionDao;
import com.ireps.admin.auction.model.Auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao auctionDao;

	public List<Auction> getLiveAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId) {
		return auctionDao.getLiveAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
	}

	public List<Auction> getUpcomingAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId) {
		return auctionDao.getUpcomingAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
	}

	public List<Auction> getClosedAuctions(int page, int pageSize, String orgCode, String zoneCode, String unitCode,
			String categoryId) {
		return auctionDao.getClosedAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
	}

	public Map<String, Object> getScheduleDetails(int scheduleId) {
		return auctionDao.getScheduleById(scheduleId);
	}

	public List<Map<String, Object>> getCorrigendumDetails(int scheduleId) {
		return auctionDao.getCorrigendumByScheduleId(scheduleId);
	}

	public Map<String, Object> getAuctionCatalogueHeader(String catalogId) {
		Map<String, Object> header = auctionDao.getAuctionCatalogueHeader(catalogId);

		// Dynamic mapping for JSP variables
		Map<String, Object> auctionHeader = new HashMap<>();
		auctionHeader.put("adminUnitZone", header.get("DEPARTMENT_NAME") + " / " + header.get("ACCOUNT_NAME"));
		auctionHeader.put("auctioningAuthority", header.get("AUCTIONING_AUTHORITY"));
		auctionHeader.put("auctionCatalogueNo", header.get("CATALOG_NO"));
		auctionHeader.put("auctionType", header.get("AUCTION_TYPE"));
		// Bidding System (decoded like DWR/Struts)
		String biddingSystem = "Two stage forward e-auction"; // default
		if ("1".equals(String.valueOf(header.get("BIDDING_SYSTEM")))) {
			biddingSystem = "Normal Auction (Single Stage)";
		}
		auctionHeader.put("biddingSystem", biddingSystem);
		auctionHeader.put("auctionStart", header.get("AUCTION_START"));
		auctionHeader.put("auctionCloseDateTime", header.get("AUCTION_END"));
		auctionHeader.put("initialCoolingOffPeriod", header.get("INITIAL_COOL_OFF_PERIOD"));
		auctionHeader.put("successiveLotsClosingInterval", header.get("TIME_DIFF_BTN_LOTS"));
		auctionHeader.put("autoExtensionsZone", header.get("AUTO_EXTENSION_ZONE"));
		auctionHeader.put("maximumAutoExtensions", header.get("MAX_AUTO_EXTN"));
		auctionHeader.put("autoExtensionDuration", header.get("AUTO_EXTENSION_DURATION"));
		auctionHeader.put("cataloguePublishedOn", header.get("CAT_PUB_ON"));
		auctionHeader.put("rofrApplicable", "Y".equals(header.get("RTFR_FLAG")) ? "Yes" : "No");

		return auctionHeader;
	}

	public List<Map<String, Object>> getProcessedLotList(String catalogId) {
		List<Map<String, Object>> lotList = auctionDao.getLotDetails(catalogId);

		for (Map<String, Object> lot : lotList) {

			// Combine Lot No. / Category
			String lotNo = String.valueOf(lot.get("LOT_NO"));
			String subCat = String.valueOf(lot.get("SUBCATEGORY_NAME"));
			lot.put("lotNoCategory", lotNo + " / " + subCat);

			// Shorten Description if too long
			String desc = String.valueOf(lot.get("LOT_MATERIAL_DESC"));
			if (desc.length() > 40) {
				desc = desc.substring(0, 40) + "...";
			}
			lot.put("lotDesc", desc);
			// Trips / Days
			lot.put("noOfTrips", lot.get("NUMBER_OF_TRIPS"));

			// Trips / Close Date/Time
			lot.put("closeDateTime", lot.get("LOT_END_DATETIME"));

			// Min Increment %
			lot.put("minIncrement", lot.get("MIN_INCR_AMT"));

			// EMD display (Percentage or ₹)
			if (lot.get("EMD_PERCENTAGE") != null) {
				lot.put("emd", lot.get("EMD_PERCENTAGE") + "%");
			} else if (lot.get("EMD_RS") != null) {
				lot.put("emd", "₹" + lot.get("EMD_RS"));
			} else {
				lot.put("emd", "-");
			}

			// Turnover Required
			lot.put("turnoverRequired", lot.get("TQ") != null ? "₹" + lot.get("TQ") : "-");

			// ROFR display
			String rtfrFlag = String.valueOf(lot.get("RTFR_FLAG"));
			String rtfrFirm = String.valueOf(lot.get("RTFR_FIRM_NAME"));
			if ("Y".equals(rtfrFlag)) {
				lot.put("rofrApplicable", "Yes (" + rtfrFirm + ")");
			} else {
				lot.put("rofrApplicable", "No");
			}

			// Lot Status: Override with Live/YetToStart/Closed if applicable
			String lotRunFlag = String.valueOf(lot.get("LOT_RUN_FLAG"));
			String lotStatusDesc = String.valueOf(lot.get("LOT_STATUS_DESC"));
			if ("LIVE".equals(lotRunFlag)) {
				lot.put("lotStatus", "Live");
			} else if ("YETTOSTART".equals(lotRunFlag)) {
				lot.put("lotStatus", "Yet To Start");
			} else {
				lot.put("lotStatus", lotStatusDesc != null ? lotStatusDesc : "Closed");
			}
		}

		return lotList;
	}

	public LinkedHashMap<String, String> getCategoryMap(String categoryId) {
		LinkedHashMap<String, String> categoryMap = new LinkedHashMap<>();
		try {
			List<Map<String, Object>> categoryList = auctionDao.getCategoryList(categoryId);
			for (Map<String, Object> map : categoryList) {
				String catId = (String) map.get("CATEGORY_ID");
				String categoryName = (String) map.get("CATEGORY_NAME");
				categoryMap.put(catId, categoryName);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error fetching category map: " + e.getMessage());
		}
		return categoryMap;
	}

	public List<Map<String, Object>> getZoneList() {
		return auctionDao.getZoneList();
	}

	public List<Map<String, Object>> getUnitList(String orgZone) {
		return auctionDao.getUnitList(orgZone);
	}
	
	public List<Map<String, Object>> getTaxDuties(String orgZone, String departmentId) {
	    return auctionDao.getTaxDuties(orgZone, departmentId);
	}
	public List<Map<String, Object>> getSupportingDocuments(String orgZone, String departmentId) {
	    return auctionDao.getSupportingDocuments(orgZone, departmentId);
	}


	

}
