package com.ireps.admin.viewireps.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.viewireps.model.ViewDepartment;
import com.ireps.admin.viewireps.dao.ViewDepartmentDao;  // Correct import for DAO

@Service
public class ViewDepartmentService {

    @Autowired
    private ViewDepartmentDao departmentDao;

    public List<ViewDepartment> getDepartments(String orgCode, String orgZone) {
        return departmentDao.findDepartments(orgCode, orgZone);
    }
}
