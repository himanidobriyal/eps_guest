package com.ireps.admin.hightender.service;

import com.ireps.admin.hightender.dao.HightenderZoneDao;
import com.ireps.admin.hightender.model.HightenderZone;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HightenderZoneService {

    @Autowired
    private HightenderZoneDao dao;

    public List<HightenderZone> fetchZones(int orgCode) {
        return dao.getZonesByOrgCode(orgCode);
    }
}
