package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentOrganizationDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentOrganization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentOrganizationService {

    @Autowired
    private DepartmentOrganizationDao organizationDao;
    // Constructor for XML injection
    public DepartmentOrganizationService(DepartmentOrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }


    public List<DepartmentOrganization> getAllOrganizations() {
        return organizationDao.getAllOrganizations();
    }
}
