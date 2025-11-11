package com.ireps.admin.goods.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ireps.admin.goods.model.Zone;
import com.ireps.admin.goods.model.Org;
import com.ireps.admin.goods.model.AdminUnit;
import com.ireps.admin.goods.model.Department;
import com.ireps.admin.goods.service.OrgService;
import com.ireps.admin.goods.service.ZoneRService;
import com.ireps.admin.goods.service.AdminUService;
import com.ireps.admin.goods.service.DepService;
import com.ireps.admin.goods.service.IrepsDocService;

@Controller
@RequestMapping("/eps/goods") // base path like ItemMasterController
public class IrDocumentController {

    @Autowired
    private OrgService organisationService;

    @Autowired
    private ZoneRService zoneService;

    @Autowired
    private DepService departmentService;

    @Autowired
    private AdminUService adminunitService;

    @Autowired
    private IrepsDocService irepsDocumentService;

    // GET → Show goods page
    @GetMapping("/manage.do")
    public String showGoodsPage(Model model) {
        List<Org> organisations = organisationService.getOrganisations();
        model.addAttribute("organisations", organisations);
        return "goods"; // Tiles definition
    }

    // GET → Fetch zones dynamically
    @GetMapping("/getZones/{orgCode}")
    @ResponseBody
    public List<Zone> getZones(@PathVariable("orgCode") String orgCode) {
        return zoneService.getZones(orgCode);
    }

    // GET → Fetch departments dynamically
    @GetMapping("/getDepartments/{orgCode}/{orgZone}")
    @ResponseBody
    public List<Department> getDepartments(@PathVariable("orgCode") String orgCode,
                                           @PathVariable("orgZone") String orgZone) {
        return departmentService.getDepartments(orgCode, orgZone);
    }

    // GET → Fetch admin units dynamically
    @GetMapping("/getAdminUnits/{orgCode}/{orgZone}/{subDept}")
    @ResponseBody
    public List<AdminUnit> getAdminUnits(@PathVariable("orgCode") String orgCode,
                                         @PathVariable("orgZone") String orgZone,
                                         @PathVariable("subDept") String subDept) {
        return adminunitService.getAdminUnits(orgCode, orgZone, subDept);
    }

    // POST → Filter documents
    @PostMapping("/filterDocuments.do")
    @ResponseBody
    public List<Map<String, Object>> filterDocuments(@RequestParam String organisation,
                                                     @RequestParam String zone,
                                                     @RequestParam String department,
                                                     @RequestParam(required = false) String adminUnit) {
        return irepsDocumentService.getFilteredDocuments(organisation, zone, department, adminUnit);
    }
}
