package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentZoneDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentZoneService {

    @Autowired
    private DepartmentZoneDao zoneDao;

    public List<DepartmentZone> getZonesByOrg(String orgCode) {
        return zoneDao.getZonesByOrg(orgCode);
    }
}
