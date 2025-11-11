package com;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class IMmsApplication extends SpringBootServletInitializer  {

	   private static final Logger logger = LoggerFactory.getLogger(IMmsApplication.class);

	public static void main(String[] args) {
		logger.info("start eAuction Spring application");
	    logger.warn("start eAuction Spring application");
	    logger.error("start eAuction Spring application");
		SpringApplication.run(IMmsApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		 //setRegisterErrorPageFilter(false);
		return application.sources(IMmsApplication.class);
	}

}
