package com;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;

@Component
public class RequestResponseLoggingFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	   //logger.info("init /RequestResponseLoggingFilter filter");
	}

    @Override
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException, ServletException {
    	try {
    		 HttpServletRequest req = (HttpServletRequest) request;
    	     HttpServletResponse res = (HttpServletResponse) response;
    	    // logger.info("Logging RequestResponseLoggingFilter  {} : {}="+req.getMethod()+"URI==="+req.getRequestURI());
    	     chain.doFilter(request, response);
    	    // logger.info("Logging RequestResponseLoggingFilter :{}="+ res.getContentType());
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    @Override
	public void destroy() {
    	
	 }
}
