package com.ireps.admin.searchtender.service;

import com.ireps.admin.searchtender.dao.UnitDao;
import com.ireps.admin.searchtender.model.Unit;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UnitService {

    private final UnitDao unitDao;

    public UnitService(UnitDao unitDao) {
        this.unitDao = unitDao;
    }

    // Get units for all work areas
    public List<Unit> getUnitsForAllWorkAreas(String orgCode) {
        return unitDao.getUnitsForAllWorkAreas(orgCode);
    }

    // Get units for a specific work area
    public List<Unit> getUnitsByWorkArea(String workArea, String orgCode) {
        return unitDao.getUnitsByWorkArea(workArea, orgCode);
    }
}
