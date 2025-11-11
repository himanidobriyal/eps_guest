package com.ireps.admin.goods.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.goods.model.Department;
import com.ireps.admin.goods.dao.DepDao;  // Correct import for DAO

@Service
public class DepService {

    @Autowired
    private DepDao departmentDao;

    public List<Department> getDepartments(String orgCode, String orgZone) {
        return departmentDao.findDepartments(orgCode, orgZone);
    }
}
