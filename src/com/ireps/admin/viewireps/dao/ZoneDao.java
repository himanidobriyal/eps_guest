package com.ireps.admin.viewireps.dao;

import java.util.List;
import com.ireps.admin.viewireps.model.Zone;

public interface ZoneDao {
    List<Zone> getZonesByOrgCode(String orgCode);
}
