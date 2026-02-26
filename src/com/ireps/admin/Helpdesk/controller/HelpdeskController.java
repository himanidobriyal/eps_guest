package com.ireps.admin.Helpdesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eps/Helpdesk")
public class HelpdeskController {

    // Main Page
    @RequestMapping("/help.do")
    public String showHelpdesk() {
    	return "admin/Helpdesk/Helpdesk";
    }

    // Ask Question Page
    @RequestMapping("/askquestion.do")
    public String askquestion() {
        return "admin/Helpdesk/askquestion";
    }

    // View Reply Page
    @RequestMapping("/viewreply.do")
    public String viewreply() {
        return "admin/Helpdesk/viewreply";
    }

    // Change DSC Page
    @RequestMapping("/changeDSC.do")
    public String changeDSC() {
        return "admin/Helpdesk/changeDSC";
    }
}