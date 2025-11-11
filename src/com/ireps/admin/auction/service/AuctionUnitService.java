package com.ireps.admin.auction.service;

import com.ireps.admin.auction.dao.AuctionUnitDao;
import com.ireps.admin.auction.model.AuctionUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionUnitService {

    @Autowired
    private AuctionUnitDao unitDao;

    public List<AuctionUnit> getUnitsByOrgAndZone(String orgCode, String zoneCode) {
        return unitDao.getUnitsByOrgAndZone(orgCode, zoneCode);
    }
}
