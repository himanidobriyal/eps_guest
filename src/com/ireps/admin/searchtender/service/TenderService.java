package com.ireps.admin.searchtender.service;
import java.util.Map;
import com.ireps.admin.searchtender.dao.TenderDao;
import com.ireps.admin.searchtender.model.Tender;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class TenderService {

    private final TenderDao tenderDao;

    public TenderService(TenderDao tenderDao) {
        this.tenderDao = tenderDao;
    }

    public List<Tender> getTenders(String tabType) {
        return tenderDao.getTenders(tabType);
    }

    public List<Tender> getCustomTenders(Map<String, String> params) {
        return tenderDao.getCustomTenders(params);
    }
}

