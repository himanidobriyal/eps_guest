package com.ireps.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;




@Controller
//@PreAuthorize("isAuthenticated()")
public class LogonController {

	Logger logger = LoggerFactory.getLogger(LogonController.class);



	@GetMapping("/logon")
	public String showLoginForm(Model model, HttpServletRequest request,@ModelAttribute("errorMessage") String errorMessage,HttpSession session) {
		


		return "logon";
	}


}
