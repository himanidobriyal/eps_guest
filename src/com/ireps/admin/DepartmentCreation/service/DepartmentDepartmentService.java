package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentDepartmentDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentDepartment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class DepartmentDepartmentService {

    @Autowired
    private DepartmentDepartmentDao departmentDao;

    public List<DepartmentDepartment> getDepartmentsByOrg(String orgCode) {
        return departmentDao.getDepartmentsByOrg(orgCode);
    }
}
