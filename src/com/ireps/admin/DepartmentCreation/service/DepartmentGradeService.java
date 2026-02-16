package com.ireps.admin.DepartmentCreation.service;

import com.ireps.admin.DepartmentCreation.dao.DepartmentGradeDao;
import com.ireps.admin.DepartmentCreation.model.DepartmentGrade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentGradeService {

    @Autowired
    private DepartmentGradeDao gradeDao;

    /**
     * Fetch grades based on organization, zone, and admin unit dept
     */
    public List<DepartmentGrade> getGrades(String orgId, String zoneId, String orgSubUnitDeptId) {
        return gradeDao.getGrades(orgId, zoneId, orgSubUnitDeptId);
    }
}
