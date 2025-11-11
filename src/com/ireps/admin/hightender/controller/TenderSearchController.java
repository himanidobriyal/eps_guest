package com.ireps.admin.hightender.controller;

import com.ireps.admin.hightender.model.*;
import com.ireps.admin.hightender.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;
@Controller
@RequestMapping("/eps/hightender")
public class TenderSearchController {

    private final HightenderOrganisationService organizationService;
    private final HightenderZoneService zoneService;
    private final HightenderDepartmentService departmentService;
    private final HightenderUnitService unitService;

    @Autowired
    public TenderSearchController(HightenderOrganisationService organizationService,
                                   HightenderZoneService zoneService,
                                   HightenderDepartmentService departmentService,
                                   HightenderUnitService unitService) {
        this.organizationService = organizationService;
        this.zoneService = zoneService;
        this.departmentService = departmentService;
        this.unitService = unitService;
    }

    /** Page Load for High Value Tender */
    @GetMapping("/hello.do")
    public String showTenderSearchPage(Model model) {
        model.addAttribute("orgList", organizationService.fetchOrganisations());
        model.addAttribute("searchCriteria", new HightenderSearchCriteria()); // your model object
        return "high.definition"; // Tiles definition name
    }

    @GetMapping("/getOrganizations")
    @ResponseBody
    public List<HightenderOrganization> getOrganizations() {
        return organizationService.fetchOrganisations();
    }

    @GetMapping("/getZones")
    @ResponseBody
    public List<HightenderZone> getZones(@RequestParam("orgCode") int orgCode) {
        return zoneService.fetchZones(orgCode);
    }

    @GetMapping("/getDepartments")
    @ResponseBody
    public List<HightenderDepartment> getDepartments(@RequestParam("orgCode") String orgCode,
                                                     @RequestParam("zoneCode") String zoneCode) {
        return departmentService.getDepartmentsByOrgAndZone(orgCode, zoneCode);
    }

    @GetMapping("/getUnits")
    @ResponseBody
    public List<HightenderUnit> getUnits(@RequestParam("zoneCode") String zoneCode,
                                         @RequestParam("deptCode") String deptCode) {
        System.out.println("=== DEBUG TenderSearchController ===");
        System.out.println("Fetching units for zoneCode: " + zoneCode + ", deptCode: " + deptCode);
        List<HightenderUnit> units = unitService.getUnitsByDeptAndZone(zoneCode, deptCode);
        System.out.println("Units fetched: " + units.size());
        return units;
    }

    @Autowired
    private TenderSearchService tenderSearchService;
    @PostMapping("/searchTenders")
    public String searchTenders(@ModelAttribute("searchCriteria") HightenderSearchCriteria criteria,
                                RedirectAttributes redirectAttributes) {
        List<TenderResult> results = tenderSearchService.searchTenders(criteria);

        // Pass results as flash attributes (temporary)
        redirectAttributes.addFlashAttribute("tenderResults", results);
        redirectAttributes.addFlashAttribute("resultCount", results.size());
        redirectAttributes.addFlashAttribute("searched", true);

        // ✅ Pass search criteria as URL parameters to preserve them
        redirectAttributes.addAttribute("organization", criteria.getOrganization());
        redirectAttributes.addAttribute("zone", criteria.getZone());
        redirectAttributes.addAttribute("department", criteria.getDepartment());
        redirectAttributes.addAttribute("unit", criteria.getUnit());
        redirectAttributes.addAttribute("workArea", criteria.getWorkArea());
        redirectAttributes.addAttribute("fromDate", criteria.getFromDate());
        redirectAttributes.addAttribute("toDate", criteria.getToDate());

        // Redirect to GET page (avoids POST refresh warning)
        return "redirect:/eps/hightender/hello.do";
    }

}
