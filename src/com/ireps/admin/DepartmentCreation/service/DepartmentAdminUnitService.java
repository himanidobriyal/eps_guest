package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentAdminUnitDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentAdminUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentAdminUnitService {

    @Autowired
    private DepartmentAdminUnitDao adminUnitDao;

    public List<DepartmentAdminUnit> getAdminUnitsByOrg(String orgCode) {
        return adminUnitDao.getAdminUnitsByOrg(orgCode);
    }
}
