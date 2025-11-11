package com.ireps.admin.auction.controller;

import com.ireps.admin.auction.model.AuctionUnit;
import com.ireps.admin.auction.model.AuctionZone;
import com.ireps.admin.auction.model.Auction;
import com.ireps.admin.auction.model.AuctionCategory;

import com.ireps.admin.auction.model.AuctionOrganisation;
import com.ireps.admin.auction.service.AuctionUnitService;
import com.ireps.admin.auction.service.AuctionZoneService;
import com.ireps.admin.auction.service.AuctionService;
import com.ireps.admin.auction.service.AuctionCategoryService;
import com.ireps.admin.auction.service.AuctionOrganisationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/eps/auction")
public class AuctionLeasingController {

	@Autowired
	private AuctionOrganisationService organisationService;

	@Autowired
	private AuctionZoneService zoneService;

	@Autowired
	private AuctionUnitService unitService;

	@Autowired
	private AuctionCategoryService categoryService;

	@Autowired
	private AuctionService auctionService;

	// Main page
	@GetMapping("/show.do")
	public String showAuctionsPage(@RequestParam(defaultValue = "live") String type,
			@RequestParam(defaultValue = "1") int page, @RequestParam(required = false) String orgCode,
			@RequestParam(required = false) String zoneCode, @RequestParam(required = false) String unitCode,
			@RequestParam(required = false) String categoryId, Model model) {

		List<AuctionOrganisation> organisations = organisationService.getAllOrganisations();
		model.addAttribute("organisations", organisations);

		List<AuctionCategory> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);

		if (orgCode != null) {
			model.addAttribute("zones", zoneService.getZonesByOrgCode(orgCode));
		}
		if (orgCode != null && zoneCode != null) {
			model.addAttribute("units", unitService.getUnitsByOrgAndZone(orgCode, zoneCode));
		}

		List<Auction> auctions;
		int pageSize = 10;

		switch (type.toLowerCase()) {
		case "upcoming":
			auctions = auctionService.getUpcomingAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
			model.addAttribute("auctionType", "Upcoming");
			break;

		case "closed":
			auctions = auctionService.getClosedAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
			model.addAttribute("auctionType", "Closed");
			break;

		default:
			auctions = auctionService.getLiveAuctions(page, pageSize, orgCode, zoneCode, unitCode, categoryId);
			model.addAttribute("auctionType", "Live");
			break;
		}

		model.addAttribute("auctions", auctions);
		model.addAttribute("currentPage", page);
		model.addAttribute("selectedOrgCode", orgCode);
		model.addAttribute("selectedZoneCode", zoneCode);
		model.addAttribute("selectedUnitCode", unitCode);
		model.addAttribute("selectedCategoryId", categoryId);

		return "auction.definition";
	}

	// Zones for selected Organisation
	@GetMapping("/zones/{orgCode}")
	@ResponseBody
	public List<AuctionZone> getZones(@PathVariable("orgCode") String orgCode) {
		return zoneService.getZonesByOrgCode(orgCode);
	}

	// Units for selected Organisation + Zone
	@GetMapping("/units/{orgCode}/{zoneCode}")
	@ResponseBody
	public List<AuctionUnit> getUnits(@PathVariable("orgCode") String orgCode,
			@PathVariable("zoneCode") String zoneCode) {
		return unitService.getUnitsByOrgAndZone(orgCode, zoneCode);
	}

	// Corrigendum modal
	@GetMapping("/corrigendum")
	public String viewCorrigendum(@RequestParam("scheduleId") int scheduleId, Model model) {
		// Fetch schedule info
		Map<String, Object> schedule = auctionService.getScheduleDetails(scheduleId);
		model.addAttribute("schedule", schedule);

		// Fetch corrigendum info
		List<Map<String, Object>> corrigendumList = auctionService.getCorrigendumDetails(scheduleId);
		model.addAttribute("corrigendumList", corrigendumList);

		return "auctioncorrigendum"; // Tiles definition name
	}

	// Catalogue modal
	@GetMapping("/details")
	public String viewCatalogue(@RequestParam("catalogId") String catalogId, Model model) {

		// Fetch auction header dynamically
		Map<String, Object> auctionHeader = auctionService.getAuctionCatalogueHeader(catalogId);
		model.addAttribute("auctionHeader", auctionHeader);
		List<Map<String, Object>> lotList = auctionService.getProcessedLotList(catalogId);
		model.addAttribute("lotList", lotList);
		LinkedHashMap<String, String> categoryMap = auctionService.getCategoryMap("999999");
		model.addAttribute("categoryMap", categoryMap);

		return "auctioncatalogue"; // Tiles name
	}

	// Taxes modal
	   @GetMapping("/taxes")
	    public String viewTaxes(@RequestParam("catalogId") String catalogId, Model model) {
	        model.addAttribute("catalogId", catalogId);
	        List<Map<String, Object>> zoneList = auctionService.getZoneList();
	        model.addAttribute("zoneList", zoneList);
	        model.addAttribute("selectedZone", "Northern Railway"); // optional
	        return "auctiontax";
	    }

	    // 🔹 AJAX endpoint to get Units by Zone
	    @GetMapping(value = "/getUnitsByZone", produces = "application/json")
	    @ResponseBody
	    public List<Map<String, Object>> getUnitsByZone(@RequestParam("orgZone") String orgZone) {
	        return auctionService.getUnitList(orgZone);
	    }
	 // Inside your existing @Controller class

	    @RequestMapping(value = "/getTaxDuties", method = RequestMethod.GET)
	    @ResponseBody
	    public List<Map<String, Object>> getTaxDuties(
	            @RequestParam("orgZone") String orgZone,
	            @RequestParam("departmentId") String departmentId) {

	        return auctionService.getTaxDuties(orgZone, departmentId);
	    }
	    
	    @RequestMapping(value = "/getSupportingDocuments", method = RequestMethod.GET)
	    @ResponseBody
	    public List<Map<String, Object>> getSupportingDocuments(
	            @RequestParam("orgZone") String orgZone,
	            @RequestParam("departmentId") String departmentId) {
	        return auctionService.getSupportingDocuments(orgZone, departmentId);
	    }



	


}
