package com.ireps.admin.viewireps.service;

import java.util.List;
import com.ireps.admin.viewireps.model.Zone;

public interface ZoneService {
    List<Zone> getZones(String orgCode);
}
