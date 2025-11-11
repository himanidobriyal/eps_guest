package com.ireps.admin.hightender.service;

import com.ireps.admin.hightender.dao.HightenderOrganizationDao;
import com.ireps.admin.hightender.model.HightenderOrganization;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HightenderOrganisationService {

    @Autowired
    private HightenderOrganizationDao dao;

    public List<HightenderOrganization> fetchOrganisations() {
        return dao.getAllOrganisations();
    }
}
