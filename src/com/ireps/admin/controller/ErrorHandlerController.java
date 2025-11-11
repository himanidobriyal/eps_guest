package com.ireps.admin.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ireps.admin.entity.UserProfieForm;

@Controller
public class ErrorHandlerController {
	Logger logger = LoggerFactory.getLogger(ErrorHandlerController.class);
	
	@RequestMapping(value="/error", method = {RequestMethod.POST, RequestMethod.GET })
	    public String handleError(HttpServletRequest request) {
		 	HttpSession session = request.getSession();
		 	Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		 	logger.info("=========ErrorHandlerController===status======="+status);
		 	if(session != null) {
		 		UserProfieForm profile = (UserProfieForm) session.getAttribute("sessionData");
		 		if(profile!=null) {
		 			if (status != null) {
				        Integer statusCode = Integer.valueOf(status.toString());
				        logger.info("========Integer Value For Status Code========="+statusCode);
				        if(statusCode == HttpStatus.NOT_FOUND.value())
				            return "error500";
				        else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value())
				            return "error500";
				        else if(statusCode == HttpStatus.METHOD_NOT_ALLOWED.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.UNAUTHORIZED.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.BAD_REQUEST.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.BAD_GATEWAY.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.SERVICE_UNAVAILABLE.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.NOT_IMPLEMENTED.value())
				        	return "error500";
				        else if(statusCode == HttpStatus.METHOD_FAILURE.value())
				        	return "error500";
				        else
				        	return "error500";
				    }else
				    	return "error500";
		 		}else
		 			return "error404";
		 	}else
		 		return "error404";
	}

}
