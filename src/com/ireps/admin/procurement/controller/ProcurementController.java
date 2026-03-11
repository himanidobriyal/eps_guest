package com.ireps.admin.procurement.controller;
      
import com.ireps.admin.procurement.service.ProcurementService; // now a concrete @Service
import com.ireps.admin.procurement.model.Zone;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/eps/procurement")
public class ProcurementController {
 
    private final ProcurementService procurementService;

    // Spring will autowire the concrete @Service directly
    public ProcurementController(ProcurementService procurementService) {
        this.procurementService = procurementService;
    }

    // GET → show page with zones
    @RequestMapping(value = "/projection.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String fetchStockSummary(
            @RequestParam(required = false) String plNo,
            @RequestParam(required = false) String zone,
            @RequestParam(required = false) String description,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "50") int size,
            Model model) {

        List<Zone> zones = procurementService.getZones();
        model.addAttribute("zones", zones);

        if (zone == null || zone.isEmpty()) {
            return "procurement";
        }

        int offset = page * size;

        List<Map<String, Object>> summary =
                procurementService.getStockSummary(plNo, zone, description, offset, size);

        int totalRecords =
                procurementService.getStockSummaryCount(plNo, zone, description);

        int totalPages = (int) Math.ceil((double) totalRecords / size);

        model.addAttribute("summary", summary);
        model.addAttribute("plNo", plNo);
        model.addAttribute("zone", zone);
        model.addAttribute("description", description);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);
        model.addAttribute("totalRecords", totalRecords);

        return "procurement";
    }


}
