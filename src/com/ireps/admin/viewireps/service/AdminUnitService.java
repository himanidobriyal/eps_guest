package com.ireps.admin.viewireps.service;

import com.ireps.admin.viewireps.dao.AdminUnitDao;
import com.ireps.admin.viewireps.model.AdminUnit;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUnitService {

    private final AdminUnitDao adminunitdao;

    public AdminUnitService(AdminUnitDao adminunitdao) {
        this.adminunitdao = adminunitdao;
    }

    public List<AdminUnit> getAdminUnits(String orgCode, String orgZone, String subDept) {
        return adminunitdao.findAdminUnits(orgCode, orgZone, subDept);
    }
}
