package com.ireps.admin.viewireps.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.viewireps.dao.OrganisationDao;
import com.ireps.admin.viewireps.model.Organisation;

@Service
public class OrganisationServiceImpl implements OrganisationService {

    @Autowired
    private OrganisationDao organisationDao;

    @Override
    public List<Organisation> getOrganisations() {
        return organisationDao.getOrganisations();
    }
}
