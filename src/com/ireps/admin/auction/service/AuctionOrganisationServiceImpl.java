package com.ireps.admin.auction.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.auction.dao.AuctionOrganisationDao;
import com.ireps.admin.auction.model.AuctionCategory;
import com.ireps.admin.auction.model.AuctionOrganisation;


@Service
public class AuctionOrganisationServiceImpl implements AuctionOrganisationService {

    @Autowired
    private AuctionOrganisationDao organisationDao;

    @Override
    public List<AuctionOrganisation> getAllOrganisations() {
        return organisationDao.getAllOrganisations();
    }
   
}