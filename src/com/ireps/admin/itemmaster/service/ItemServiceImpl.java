
package com.ireps.admin.itemmaster.service;

import com.ireps.admin.itemmaster.dao.ItemDao;
import com.ireps.admin.itemmaster.model.ItemRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemDao itemDao;

    @Override
    public List<ItemRecord> getItems(String orgZone, String rlyDept, String subId, int page, int size) {
        return itemDao.findItems(orgZone, rlyDept, subId, page, size);
    }

    @Override
    public int getItemsCount(String orgZone, String rlyDept, String subId) {
        return itemDao.countItems(orgZone, rlyDept, subId);
    }
}
