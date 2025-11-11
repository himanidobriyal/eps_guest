package com.ireps.admin.hightender.service;

import com.ireps.admin.hightender.dao.HightenderUnitDao;
import com.ireps.admin.hightender.model.HightenderUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HightenderUnitService {

    @Autowired
    private HightenderUnitDao unitDao;

    public List<HightenderUnit> getUnitsByDeptAndZone(String zoneCode, String deptCode) {
        System.out.println("=== DEBUG HightenderUnitService ===");
        System.out.println("Fetching units for zoneCode: " + zoneCode + ", deptCode: " + deptCode);
        List<HightenderUnit> units = unitDao.getUnitsByDeptAndZone(zoneCode, deptCode);
        System.out.println("Units fetched: " + units.size());
        return units;
    }
}
