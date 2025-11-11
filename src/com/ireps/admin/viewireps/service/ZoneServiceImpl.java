package com.ireps.admin.viewireps.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.viewireps.dao.ZoneDao;
import com.ireps.admin.viewireps.model.Zone;

@Service
public class ZoneServiceImpl implements ZoneService {

    @Autowired
    private ZoneDao zoneDao;

    @Override
    public List<Zone> getZones(String orgCode) {
        return zoneDao.getZonesByOrgCode(orgCode);
    }
}
