package com.ireps.admin.Helpdesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eps/Helpdesk")
public class HelpdeskController {

    @RequestMapping("/help.do")
    public String showHelpdesk() {
        
        return "Helpdesktest";  
    }
}
