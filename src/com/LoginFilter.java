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
import com.ireps.admin.entity.UserProfieForm;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.*;

@Component
public class LoginFilter implements Filter {
	
	 private static final Logger logger = LoggerFactory.getLogger(LoginFilter.class);

	 @Override 
	  public void init(FilterConfig filterConfig) throws ServletException {
	    //logger.info("init /login filter");
	  }

	  @Override 
	  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,FilterChain filterChain) throws IOException, ServletException {

		    String idToken = ((HttpServletRequest) servletRequest).getHeader("X-ID-TOKEN");
		    HttpServletResponse response = (HttpServletResponse) servletResponse;
		    HttpServletRequest request = (HttpServletRequest) servletRequest;
		    HttpSession session = request.getSession(false);
		    boolean flag=false;
		    //logger.info("filtered /login request: " + idToken);
		      try 
		      { 
		    	    UserProfieForm profile = null;
			    	Object sessionData = null; 
			    	// Remove MDC values
			    	MDC.remove("userName");
			    	MDC.remove("remoteIp");
			    	// Retrieve the attribute from the session
			    	if (session != null)
			    	{
			    		sessionData = session.getAttribute("sessionData");
			    		logger.info("LoginFilter.sessionData==" + sessionData);
			    	}
			    	// Check if the retrieved attribute is not null and of the expected type
			    	if (sessionData != null && sessionData instanceof UserProfieForm) 
			    	{
			    	    // Cast the attribute to the expected type
			    	    profile = (UserProfieForm) sessionData;
			    	    logger.info("LoginFilter.profile==" + profile);
			    	} 
			    	 
			    	if(profile != null )
			  	    {
			          MDC.put("userName", profile.getEmailId());
			          MDC.put("remoteIp",  (request.getHeader("X-Forwarded-For")!=null?request.getHeader("X-Forwarded-For"):request.getRemoteAddr()).toString());
			        } 
			    	
			    	 try
			         {
			           flag = doCheckAnyomysUrls(request);
			           logger.info("LoginFilter.==> flag==" + flag);
			         }
			         catch (Exception e)
			         {
			           logger.info("LoginFilter.Invalid Request Catch of doCheckAnyomysUrls--" + e.getMessage());
			           
			           request.getRequestDispatcher(String.valueOf(request.getContextPath())+"/logon").forward(request, response);
			         }
			    	 
			    	  filterChain.doFilter(new RequestWrapper(request), response);
		              return;
		      } 
		      catch (Exception e) 
		      {
		        e.printStackTrace();
		        logger.info("LoginFilter. some exception occured = " + e.getMessage()); 
		      }
		    ((HttpServletResponse) servletResponse).sendError(HttpServletResponse.SC_UNAUTHORIZED);
		  }

	  @Override
	  public void destroy() {
	  
	  }
	  
	  private boolean doCheckAnyomysUrls(HttpServletRequest req)
	  {
	    boolean flag = false;
	    logger.info("LoginFilter.doCheckAnyomysUrls=="+ req.getContextPath());
	    String urI= req.getRequestURI();
	    
	    if (req.getRequestURI().equalsIgnoreCase(String.valueOf(req.getContextPath()) + "/getuserType"))
	    {
	      flag = true;
	    }
		return flag; 
	  }
	   
}
