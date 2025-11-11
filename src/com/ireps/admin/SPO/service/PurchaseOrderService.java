package com.ireps.admin.SPO.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ireps.admin.SPO.dao.PurchaseOrderDao;
import com.ireps.admin.SPO.model.PurchaseOrder;

@Service
public class PurchaseOrderService {

    @Autowired
    private PurchaseOrderDao purchaseOrderDao;

    // ✅ Method signature now correctly accepts BigDecimal to match the DAO
    public List<PurchaseOrder> searchPurchaseOrders(String railway, String supplierName, String plNumber,
                                                    Date fromDate, Date toDate,
                                                    BigDecimal valueFrom, BigDecimal valueTo) {
        return purchaseOrderDao.searchPurchaseOrders(railway, supplierName, plNumber, 
                                                     fromDate, toDate, valueFrom, valueTo);
    }

    public List<Map<String, Object>> getRailwayList() {
        return purchaseOrderDao.getRailwayList();
    }

    public List<Map<String, Object>> getAccountDetails(String accountName) {
        return purchaseOrderDao.getAccountDetails(accountName);
    }

    public String generateVerificationCode() {
        String[] codes = {"15ea88", "7f3k9p", "x4m8z1", "q2w6r9", "a5s8d3", 
                         "g8h4j7", "m3n9b5", "k7l2p8", "c4v6x9", "z1w5e8"};
        return codes[(int) (Math.random() * codes.length)];
    }

    public boolean validateVerificationCode(String inputCode, String expectedCode) {
        return inputCode != null && inputCode.equalsIgnoreCase(expectedCode);
    }
}
