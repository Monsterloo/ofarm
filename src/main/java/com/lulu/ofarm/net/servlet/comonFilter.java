package com.lulu.ofarm.net.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.util.StringUtil;



public class comonFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("doing filter...");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		//TODO
		

		HttpServletRequest req = (HttpServletRequest)request;
		String loc=req.getServletPath();

		/*if(loc.contains("/admin/")==false && loc.contains("/upload/")==false && loc.contains("/backstage/")==false){
			HttpSession session =  req.getSession();
			SysAdmin admin = (SysAdmin)session.getAttribute("user");
			if(admin == null ){
				HttpServletResponse res = (HttpServletResponse)response;
				res.sendRedirect(req.getServletContext().getContextPath()+"/backstage/login");
				return;
			}
		}*/
		HttpSession session =  req.getSession();
		if(!loc.contains("/css/") && !loc.contains("/fonts/") && !loc.contains("/img/") && !loc.contains("/js/") && !loc.contains("/upload/") && !loc.contains("/backstage/") && !loc.contains("favicon.ico")){
			SysAdmin admin = (SysAdmin)session.getAttribute("user");
			if(admin == null){
				HttpServletResponse res = (HttpServletResponse)response;
				res.sendRedirect(req.getServletContext().getContextPath()+"/backstage/login");
				return;
			}
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
