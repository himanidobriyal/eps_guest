package com.ireps.admin.viewireps.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ireps.admin.viewireps.model.Zone;
import com.ireps.admin.viewireps.model.Organisation;
import com.ireps.admin.viewireps.model.AdminUnit;
import com.ireps.admin.viewireps.model.ViewDepartment;
import com.ireps.admin.viewireps.model.Document;
import com.ireps.admin.viewireps.service.OrganisationService;
import com.ireps.admin.viewireps.service.ZoneService;
import com.ireps.admin.viewireps.service.AdminUnitService;
import com.ireps.admin.viewireps.service.ViewDepartmentService;
import com.ireps.admin.viewireps.service.DocumentService;
import com.ireps.admin.viewireps.service.IrepsDocumentService;



@Controller
@RequestMapping("/eps/viewireps")
public class IrepsDocumentController {

	// FOR ORGANISATION
	@Autowired
	private OrganisationService organisationService;

	@GetMapping("/view.do")
	public String showDocumentPage(Model model) {
		List<Organisation> organisations = organisationService.getOrganisations();
		model.addAttribute("organisations", organisations);
		return "viewireps.definition"; // JSP page
	}

	// FOR ZONE
	@Autowired
	private ZoneService zoneService;

	@GetMapping("/getZones/{orgCode}")
	@ResponseBody
	public List<Zone> getZones(@PathVariable("orgCode") String orgCode) {
		return zoneService.getZones(orgCode);
	}

	// FOR DEPARTMENT
	@Autowired
	private ViewDepartmentService departmentService;

	@GetMapping("/getDepartments/{orgCode}/{orgZone}")
	@ResponseBody
	public List<ViewDepartment> getDepartments(@PathVariable("orgCode") String orgCode,
			@PathVariable("orgZone") String orgZone) {
		return departmentService.getDepartments(orgCode, orgZone);
	}

	// FOR ADMIN UNIT
	@Autowired
	private AdminUnitService adminunitService;

	@GetMapping("/getAdminUnits/{orgCode}/{orgZone}/{subDept}")
	@ResponseBody
	public List<AdminUnit> getAdminUnits(@PathVariable("orgCode") String orgCode,
			@PathVariable("orgZone") String orgZone, @PathVariable("subDept") String subDept) {
		return adminunitService.getAdminUnits(orgCode, orgZone, subDept);
	}
	


    
    //filter documents controller here
    @Autowired
    private IrepsDocumentService irepsDocumentService;

    @PostMapping("/filterDocuments")
    @ResponseBody
    public List<Map<String, Object>> filterDocuments(@RequestParam String organisation,
                                                     @RequestParam String zone,
                                                     @RequestParam String department,
                                                     @RequestParam(required = false) String adminUnit) {
        return irepsDocumentService.getFilteredDocuments(organisation, zone, department, adminUnit);
    }
    
    //pagination for prev and next 

    @Autowired
    private DocumentService documentService;

    @GetMapping("/list")
    public Map<String, Object> getDocuments(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int size) {

        int offset = (page - 1) * size;
        List<Document> documents = documentService.getDocuments(offset, size);
        int totalRecords = documentService.getDocumentCount();
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        Map<String, Object> response = new HashMap<>();
        response.put("documents", documents);
        response.put("totalPages", totalPages);
        response.put("currentPage", page);
        response.put("totalRecords", totalRecords);

        return response;
    }
    
    
	

}

