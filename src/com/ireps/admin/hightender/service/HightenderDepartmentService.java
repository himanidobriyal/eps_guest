package com.ireps.admin.hightender.service;

import com.ireps.admin.hightender.dao.HightenderDepartmentDao;
import com.ireps.admin.hightender.model.HightenderDepartment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HightenderDepartmentService {

    @Autowired
    private HightenderDepartmentDao departmentDao;

    // Updated to include both orgCode and zoneCode
    public List<HightenderDepartment> getDepartmentsByOrgAndZone(String orgCode, String zoneCode) {
        return departmentDao.getDepartmentsByOrgAndZone(orgCode, zoneCode);
    }
}
