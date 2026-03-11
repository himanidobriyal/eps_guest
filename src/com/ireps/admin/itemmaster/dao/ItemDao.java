

package com.ireps.admin.itemmaster.dao;

import com.ireps.admin.itemmaster.model.ItemRecord;
import java.util.List;

public interface ItemDao {
    List<ItemRecord> findItems(String orgZone, String rlyDept, String subId, int page, int pageSize);
    int countItems(String orgZone, String rlyDept, String subId);
}
