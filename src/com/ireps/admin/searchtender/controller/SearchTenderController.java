package com.ireps.admin.searchtender.controller;

import com.ireps.admin.searchtender.model.Organization;
import com.ireps.admin.searchtender.model.PU;
import com.ireps.admin.searchtender.model.Department;
import com.ireps.admin.searchtender.model.Unit;
import com.ireps.admin.searchtender.model.Tender;
import com.ireps.admin.searchtender.service.OrganizationService;
import com.ireps.admin.searchtender.service.PUService;
import com.ireps.admin.searchtender.service.DepartmentService;
import com.ireps.admin.searchtender.service.UnitService;
import com.ireps.admin.searchtender.service.TenderService;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/eps/searchtender")
public class SearchTenderController {

    private final OrganizationService organizationService;
    private final PUService puService;
    private final DepartmentService departmentService;
    private final UnitService unitService;
    private final TenderService tenderService;

    public SearchTenderController(OrganizationService organizationService,
                                  PUService puService,
                                  DepartmentService departmentService,
                                  UnitService unitService,
                                  TenderService tenderService) {
        this.organizationService = organizationService;
        this.puService = puService;
        this.departmentService = departmentService;
        this.unitService = unitService;
        this.tenderService = tenderService;
    }

    // --------- Load Search Tender Page ----------
    @GetMapping("/searchtender.do")
    public String loadSearchTender(@RequestParam(name = "tab", required = false, defaultValue = "allActive") String tab,
                                   Model model) {

        // Organization dropdown
        List<Organization> organizations = organizationService.getAllOrganizations();
        model.addAttribute("organizations", organizations);

        if (!organizations.isEmpty()) {
            String defaultOrgCode = organizations.get(0).getIntCode();
            model.addAttribute("pus", puService.getPUsByOrg(defaultOrgCode));
            model.addAttribute("departments", departmentService.getDepartmentsByOrg(defaultOrgCode));
            model.addAttribute("units", unitService.getUnitsForAllWorkAreas(defaultOrgCode));
            model.addAttribute("selectedOrg", defaultOrgCode);
        }
        // ✅ FIX: Agar CUSTOM TAB select hua hai → koi tender list load nahi karni
     // 🔑 Key change: for 'custom' tab, DO NOT call service; keep list empty.
        if ("custom".equalsIgnoreCase(tab)) {
            model.addAttribute("tenders", java.util.Collections.emptyList());
        } else {
            List<Tender> tenderList = tenderService.getTenders(tab);
            model.addAttribute("tenders", tenderList);
        }

        model.addAttribute("activeTab", tab);
        return "searchtender";
        }


       

    // --------- AJAX APIs ----------
    @GetMapping("/getPUs")
    @ResponseBody
    public List<PU> getPUs(@RequestParam("orgCode") String orgCode) {
        return puService.getPUsByOrg(orgCode);
    }

    @GetMapping("/getDepartments")
    @ResponseBody
    public List<Department> getDepartments(@RequestParam("orgCode") String orgCode) {
        return departmentService.getDepartmentsByOrg(orgCode);
    }

    @GetMapping("/getUnits")
    @ResponseBody
    public List<Unit> getUnits(@RequestParam("workArea") String workArea,
                               @RequestParam("orgCode") String orgCode) {
        if (workArea.equals("-1")) {
            return unitService.getUnitsForAllWorkAreas(orgCode);
        } else {
            return unitService.getUnitsByWorkArea(workArea, orgCode);
        }
    }
    
    @PostMapping("/customSearch")
    public String customSearch(@RequestParam Map<String, String> params, Model model) {
    	  // ✅ PRINT EVERYTHING COMING FROM JSP — ADD HERE
        System.out.println("===== FRONTEND → CONTROLLER PARAMS =====");
        params.forEach((k, v) -> System.out.println(k + " = " + v));
        System.out.println("========================================");

        // ✅ Load all dropdown values again
        List<Organization> organizations = organizationService.getAllOrganizations();
        model.addAttribute("organizations", organizations);

        if (!organizations.isEmpty()) {
        	String orgCode = params.getOrDefault("orgCode", organizations.get(0).getIntCode());
        	model.addAttribute("selectedOrg", orgCode);

        	model.addAttribute("pus", puService.getPUsByOrg(orgCode));
        	model.addAttribute("departments", departmentService.getDepartmentsByOrg(orgCode));
        	model.addAttribute("units", unitService.getUnitsForAllWorkAreas(orgCode));

        }

        // ✅ Execute search
        List<Tender> tenderList = tenderService.getCustomTenders(params);
        model.addAttribute("tenders", tenderList);

        // ✅ Activate custom tab
        model.addAttribute("activeTab", "custom");

        return "searchtender";
    }


}
