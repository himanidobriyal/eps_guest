package com.ireps.admin.goods.service;

import com.ireps.admin.goods.dao.AdminDao;
import com.ireps.admin.goods.model.AdminUnit;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUService {

    private final AdminDao adminunitdao;

    public AdminUService(AdminDao adminunitdao) {
        this.adminunitdao = adminunitdao;
    }

    public List<AdminUnit> getAdminUnits(String orgCode, String orgZone, String subDept) {
        return adminunitdao.findAdminUnits(orgCode, orgZone, subDept);
    }
}
