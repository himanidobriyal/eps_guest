package com.ireps.admin.goods.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.goods.dao.ZoneRDao;  // ensure you use the combined DAO we created
import com.ireps.admin.goods.model.Zone;

public interface ZoneRService {
    List<Zone> getZones(String orgCode);
}

@Service
class ZoneRServiceImpl implements ZoneRService {

    @Autowired
    private ZoneRDao zoneRDao;

    @Override
    public List<Zone> getZones(String orgCode) {
        return zoneRDao.getZonesByOrgCode(orgCode);
    }
}
