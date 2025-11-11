package com.ireps.admin.auction.service;

import com.ireps.admin.auction.model.AuctionCategory;
import com.ireps.admin.auction.dao.AuctionCategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionCategoryServiceImpl implements AuctionCategoryService {

    @Autowired
    private AuctionCategoryDao categoryDao;

    @Override
    public List<AuctionCategory> getAllCategories() {
        return categoryDao.getCategories();
    }
}
