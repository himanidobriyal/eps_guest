package com.ireps.admin.searchtender.service;

import com.ireps.admin.searchtender.dao.OrganizationDao;
import com.ireps.admin.searchtender.model.Organization;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class OrganizationService {

    private final OrganizationDao organizationDao;

    public OrganizationService(OrganizationDao organizationDao) {
        this.organizationDao = organizationDao;
    }

    public List<Organization> getAllOrganizations() {
        return organizationDao.getOrganizations();
    }
}
