package com.ireps.admin.auction.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.auction.dao.AuctionZoneDao;
import com.ireps.admin.auction.model.AuctionZone;

@Service
public class AuctionZoneServiceImpl implements AuctionZoneService {

    @Autowired
    private AuctionZoneDao zoneDao;

    @Override
    public List<AuctionZone> getZonesByOrgCode(String orgCode) {
        return zoneDao.getZonesByOrgCode(orgCode);
    }
}