package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentOrgUnitTypeDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentOrgUnitType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentOrgUnitTypeService {

    @Autowired
    private DepartmentOrgUnitTypeDao orgUnitTypeDao;

    public List<DepartmentOrgUnitType> getOrgUnitTypesByOrg(String orgCode) {
        return orgUnitTypeDao.getOrgUnitTypesByOrg(orgCode);
    }
}
