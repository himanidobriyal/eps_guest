package com.ireps.admin.learningcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/eps/LearningCenter")
public class LearningCenterController {

   
    @RequestMapping("/learn.do")
    public String viewBannedFirms() {
            return "LearningCenter"; 
    }
}
