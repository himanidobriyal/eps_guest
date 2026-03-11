package com.ireps.admin.procurement.service;

import com.ireps.admin.procurement.dao.DataDao;
import com.ireps.admin.procurement.dao.ZoneDao;
import com.ireps.admin.procurement.model.Zone;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
  
@Service 
public class ProcurementService {

    private final DataDao dataDao;
    private final ZoneDao zoneDao;

    public ProcurementService(DataDao dataDao, ZoneDao zoneDao) {
        this.dataDao = dataDao;
        this.zoneDao = zoneDao;
    }
 
    public List<Zone> getZones() {
        return zoneDao.getZones(); 
    }

    // Paginated Data
    public List<Map<String, Object>> getStockSummary(
            String plNo,
            String zone,
            String description,
            int offset,
            int size) {

        return dataDao.fetchStockSummary(plNo, zone, description, offset, size);
    }

    // Total Count
    public int getStockSummaryCount(
            String plNo,
            String zone,
            String description) {

        return dataDao.fetchStockSummaryCount(plNo, zone, description);
    }
}
