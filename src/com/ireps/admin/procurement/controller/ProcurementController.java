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
    @GetMapping("/projection.do")
    public String showProcurementPage(Model model) {
        List<Zone> zones = procurementService.getZones();
        model.addAttribute("zones", zones);
        return "procurement"; // JSP
    }

    // POST → fetch summary after form submission
    @PostMapping("/projection.do")
    public String fetchStockSummary(
            @RequestParam("plNo") String plNo,
            @RequestParam("zone") String zone,
            @RequestParam("description") String description,
            Model model) {

        List<Map<String, Object>> summary =
                procurementService.getStockSummary(plNo, zone, description);

        model.addAttribute("summary", summary);
        model.addAttribute("plNo", plNo);
        model.addAttribute("zone", zone);
        model.addAttribute("description", description);

        List<Zone> zones = procurementService.getZones();
        model.addAttribute("zones", zones);

        return "procurement"; // JSP
    }
}
