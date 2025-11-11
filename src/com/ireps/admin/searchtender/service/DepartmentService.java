package com.ireps.admin.searchtender.service;

import com.ireps.admin.searchtender.dao.DepartmentDao;
import com.ireps.admin.searchtender.model.Department;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {

    private final DepartmentDao departmentDao;

    public DepartmentService(DepartmentDao departmentDao) {
        this.departmentDao = departmentDao;
    }

    public List<Department> getDepartmentsByOrg(String orgCode) {
        return departmentDao.getDepartmentsByOrg(orgCode);
    }
}
