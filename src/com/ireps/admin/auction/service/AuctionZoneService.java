package com.ireps.admin.auction.service;

import java.util.List;
import com.ireps.admin.auction.model.AuctionZone;

public interface AuctionZoneService {
    List<AuctionZone> getZonesByOrgCode(String orgCode);
}