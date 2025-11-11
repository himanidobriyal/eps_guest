package com.ireps.admin.auction.service;

import java.util.List;

import com.ireps.admin.auction.model.AuctionCategory;
import com.ireps.admin.auction.model.AuctionOrganisation;

public interface AuctionOrganisationService {
    List<AuctionOrganisation> getAllOrganisations();
    
}