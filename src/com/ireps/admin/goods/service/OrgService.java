package com.ireps.admin.goods.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ireps.admin.goods.dao.OrgDao;
import com.ireps.admin.goods.model.Org;

public interface OrgService {
    List<Org> getOrganisations();
}

@Service
class OrgServiceImpl implements OrgService {

    @Autowired
    private OrgDao organisationDao;

    @Override
    public List<Org> getOrganisations() {
        return organisationDao.getOrganisations();
    }
}
