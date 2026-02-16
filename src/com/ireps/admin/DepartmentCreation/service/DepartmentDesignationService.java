package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentDesignationDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentDesignation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentDesignationService {

    private final DepartmentDesignationDao designationDao;

    public DepartmentDesignationService(DepartmentDesignationDao designationDao) {
        this.designationDao = designationDao;
    }

    public List<DepartmentDesignation> getDesignations(String orgCode, String zoneId, String deptId, String gradeId) {
        return designationDao.getDesignations(orgCode, zoneId, deptId, gradeId);
    }
}
