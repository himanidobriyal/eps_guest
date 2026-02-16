package com.ireps.admin.DepartmentCreation.controller;

import com.ireps.admin.DepartmentCreation.model.*;
import com.ireps.admin.DepartmentCreation.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/eps/departmentcreation")   // SAME STYLE AS hightender
public class DepartmentCreationController {

    @Autowired
    private DepartmentOrganizationService organizationService;

    @Autowired
    private DepartmentZoneService zoneService;

    @Autowired
    private DepartmentOrgUnitTypeService orgUnitTypeService;

    @Autowired
    private DepartmentAdminUnitService adminUnitService;

    @Autowired
    private DepartmentSubUnitTypeService subUnitTypeService;

    @Autowired
    private DepartmentAdminUnitDetailService adminUnitDetailService;

    @Autowired
    private DepartmentDepartmentService departmentService;

    @Autowired
    private DepartmentGradeService gradeService;

    @Autowired
    private DepartmentDesignationService designationService;


    @GetMapping("/load.do")
    public String loadDepartmentPage(Model model) {

        model.addAttribute("organizations", organizationService.getAllOrganizations());

        return "departmentCreation";   // EXACT same name as tiles definition
    }



    /* ----------------------- AJAX ENDPOINTS -------------------------- */

    @GetMapping("/getZones")
    @ResponseBody
    public List<DepartmentZone> getZonesByOrg(@RequestParam("orgCode") String orgCode) {
        return zoneService.getZonesByOrg(orgCode);
    }

    @GetMapping("/getOrgUnitTypes")
    @ResponseBody
    public List<DepartmentOrgUnitType> getOrgUnitTypesByOrg(@RequestParam("orgCode") String orgCode) {
        return orgUnitTypeService.getOrgUnitTypesByOrg(orgCode);
    }

    @GetMapping("/getAdminUnits")
    @ResponseBody
    public List<DepartmentAdminUnit> getAdminUnitsByOrg(@RequestParam("orgCode") String orgCode) {
        return adminUnitService.getAdminUnitsByOrg(orgCode);
    }

    @GetMapping("/getSubUnitTypes")
    @ResponseBody
    public List<DepartmentSubUnitType> getSubUnitTypes(
            @RequestParam("orgCode") String orgCode,
            @RequestParam("orgUnitType") String orgUnitType,
            @RequestParam("adminUnitDept") String adminUnitDept) {

        return subUnitTypeService.getSubUnitTypes(orgCode, orgUnitType, adminUnitDept);
    }

    @GetMapping("/getAdminUnitsDetails")
    @ResponseBody
    public List<DepartmentAdminUnitDetail> getAdminUnitsDetails(
            @RequestParam("orgCode") String orgCode,
            @RequestParam("zoneId") String zoneId,
            @RequestParam("orgUnitTypeId") String orgUnitTypeId,
            @RequestParam("subUnitTypeId") String subUnitTypeId) {

        return adminUnitDetailService.getAdminUnits(orgCode, zoneId, orgUnitTypeId, subUnitTypeId);
    }

    @GetMapping("/getDepartments")
    @ResponseBody
    public List<DepartmentDepartment> getDepartmentsByOrg(@RequestParam("orgCode") String orgCode) {
        return departmentService.getDepartmentsByOrg(orgCode);
    }

    @GetMapping("/getGrades")
    @ResponseBody
    public List<DepartmentGrade> getGrades(
            @RequestParam("orgCode") String orgCode,
            @RequestParam("zoneId") String zoneId,
            @RequestParam("adminUnitDept") String adminUnitDept) {

        return gradeService.getGrades(orgCode, zoneId, adminUnitDept);
    }

    @GetMapping("/getDesignations")
    @ResponseBody
    public List<DepartmentDesignation> getDesignations(
            @RequestParam("orgCode") String orgCode,
            @RequestParam("zoneId") String zoneId,
            @RequestParam("deptId") String deptId,
            @RequestParam("gradeId") String gradeId) {

        return designationService.getDesignations(orgCode, zoneId, deptId, gradeId);
    }
}
