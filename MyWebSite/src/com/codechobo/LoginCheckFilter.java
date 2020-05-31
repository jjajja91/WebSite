package com.codechobo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="LoginCheckFilter", urlPatterns= { "*.jsp" })
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public boolean excludeUrl(HttpServletRequest request) {
		return request.getRequestURI().equals("/index.jsp") || request.getRequestURI().equals("/LoginForm.jsp");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
    	HttpSession session = httpRequest.getSession(true);
    	if(session.getAttribute("id")!=null || excludeUrl(httpRequest)) {
    		chain.doFilter(httpRequest, httpResponse);
    	} else {
    		httpResponse.sendRedirect("/LoginForm.jsp?url="+httpRequest.getRequestURI());
    	}
    	
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
	
}
