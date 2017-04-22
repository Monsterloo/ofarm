package com.lulu.ofarm.net.controller;

import java.io.IOException;

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
			request.setAttribute("errorMsg", "-1");
			return "admin/index";
		} else{
			request.setAttribute("loginname", loginname);
			request.setAttribute("errorMsg", "用户名或密码错误!");
			return "admin/login";
		}
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		request.setAttribute("errorMsg", "-1");
		return "admin/login";
	}
	
	@RequestMapping("/loginout")
	public void loginout(HttpServletRequest request, HttpServletResponse response){
		try {
			response.sendRedirect(request.getServletContext().getContextPath()+"/backstage/login");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request){
		return "admin/home";
	}
	
	/*@RequestMapping("/loginin")
	public String loginin(){
		return "admin/login";
	}*/
}
