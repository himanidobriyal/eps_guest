package com.ireps.admin.auction.dao;

import java.util.List;

import com.ireps.admin.auction.model.AuctionOrganisation;


public interface AuctionOrganisationDao {
    List<AuctionOrganisation> getAllOrganisations();
    
}