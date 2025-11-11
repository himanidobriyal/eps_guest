package com.ireps.admin.hightender.service;

import com.ireps.admin.hightender.dao.TenderSearchDao;
import com.ireps.admin.hightender.model.HightenderSearchCriteria;
import com.ireps.admin.hightender.model.TenderResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenderSearchService {

    @Autowired
    private TenderSearchDao tenderSearchDao;

    /**
     * Search tenders based on the given criteria.
     * @param criteria user input search filters
     * @return list of matching tenders
     */
    public List<TenderResult> searchTenders(HightenderSearchCriteria criteria) {
        if (criteria == null) {
            throw new IllegalArgumentException("Search criteria cannot be null");
        }
        System.out.println(">>> Calling DAO from TenderSearchService with criteria: " + criteria);
        return tenderSearchDao.searchTenders(criteria);
    }
}
