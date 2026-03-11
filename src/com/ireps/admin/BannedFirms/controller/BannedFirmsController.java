package com.ireps.admin.BannedFirms.controller;
 
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ireps.admin.BannedFirms.dao.BannedFirmsDao;
import com.ireps.admin.BannedFirms.model.BannedFirms;

@Controller
@RequestMapping("/eps/BannedFirms")
public class BannedFirmsController {

    @Autowired
    private BannedFirmsDao bannedFirmsDao;

    @RequestMapping("/seen.do")
    public String viewBannedFirms(@RequestParam(value = "type", required = false, defaultValue = "all") String type,
                                  Model model) {
        List<BannedFirms> banListResult = bannedFirmsDao.getBannedFirmsByType(type);
        model.addAttribute("banListResult", banListResult);
        model.addAttribute("selectedType", type); // so JSP can remember dropdown state
        return "BannedFirms.definition"; // Tiles definition
    }
} 
 