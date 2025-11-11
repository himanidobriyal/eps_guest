
package com.ireps.admin.itemmaster.service;

import com.ireps.admin.itemmaster.model.ItemRecord;

import java.util.List;
public interface ItemService {
    List<ItemRecord> getItems(String orgZone, String rlyDept, String subId, int page, int size);
    int getItemsCount(String orgZone, String rlyDept, String subId);
}
