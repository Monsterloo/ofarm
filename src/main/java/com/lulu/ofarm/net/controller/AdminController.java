package com.lulu.ofarm.net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backstage")
public class AdminController {

	@RequestMapping("/index")
	public String adminMain() {
		return "admin/index";
	}
}
