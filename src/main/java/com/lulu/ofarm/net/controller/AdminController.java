package com.lulu.ofarm.net.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.SysAdminService;

@Controller
@RequestMapping("/backstage")
public class AdminController {
	
	@Autowired
	private SysAdminService	adminService;

	@RequestMapping("/index")
	public String adminMain(HttpServletRequest request, HttpServletResponse response) {
		String loginname = request.getParameter("loginname");
		String password = request.getParameter("password");
		SysAdmin admin = adminService.findByLoginname(loginname);
		if(admin != null && password.equals(admin.getPassword())){
			request.getSession().setAttribute("user", admin);
			return "admin/index";
		} else{
			return "admin/login";
		}
	}
	
	@RequestMapping("/login")
	public String login(){
		return "admin/login";
	}
	
	/*@RequestMapping("/loginin")
	public String loginin(){
		return "admin/login";
	}*/
}
