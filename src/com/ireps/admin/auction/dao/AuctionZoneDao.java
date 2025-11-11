package com.ireps.admin.auction.dao;

import java.util.List;
import com.ireps.admin.auction.model.AuctionZone;

public interface AuctionZoneDao {
    List<AuctionZone> getZonesByOrgCode(String orgCode);
}