package com.ireps.admin.auction.dao;

import com.ireps.admin.auction.model.AuctionCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuctionCategoryDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<AuctionCategory> getCategories() {
    	String sql = "SELECT CATEGORY_ID, CATEGORY_NAME " +
                "FROM bv1to1.LEASE_CATEGORY_MASTER " +
                "WHERE CATEGORY_ATTRIBUTE = 'BOTH' " +
                "AND PARENT_CATEGORY_ID = '000' " +
                "AND CURRENT_STATUS = 'LIVE' " +
                "ORDER BY CATEGORY_NAME";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            AuctionCategory category = new AuctionCategory();
            category.setCategoryId(rs.getString("CATEGORY_ID"));
            category.setCategoryName(rs.getString("CATEGORY_NAME"));
            return category;
        });
    }
}
