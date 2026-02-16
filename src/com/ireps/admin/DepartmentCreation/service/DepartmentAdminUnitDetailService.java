package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentAdminUnitDetailDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentAdminUnitDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentAdminUnitDetailService {

    @Autowired
    private DepartmentAdminUnitDetailDao adminUnitDetailDao;

    public List<DepartmentAdminUnitDetail> getAdminUnits(String orgCode, String zoneId, String orgUnitTypeId, String subUnitTypeId) {
        return adminUnitDetailDao.getAdminUnits(orgCode, zoneId, orgUnitTypeId, subUnitTypeId);
    }
}
