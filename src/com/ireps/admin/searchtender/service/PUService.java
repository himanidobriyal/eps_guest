package com.ireps.admin.searchtender.service;

import com.ireps.admin.searchtender.dao.PUdao;
import com.ireps.admin.searchtender.model.PU;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class PUService {
    private final PUdao puDao;

    public PUService(PUdao puDao) {
        this.puDao = puDao;
    }

    public List<PU> getPUsByOrg(String orgCode) {
        return puDao.getPUsByOrg(orgCode);
    }
}