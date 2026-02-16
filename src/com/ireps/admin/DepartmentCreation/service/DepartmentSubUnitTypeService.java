package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentSubUnitTypeDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentSubUnitType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentSubUnitTypeService {

    @Autowired
    private DepartmentSubUnitTypeDao subUnitTypeDao;

    public List<DepartmentSubUnitType> getSubUnitTypes(String orgCode, String orgUnitType, String adminUnitDept) {
        return subUnitTypeDao.getSubUnitTypes(orgCode, orgUnitType, adminUnitDept);
    }
}
