package com.lulu.ofarm.net.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@RequestMapping(value = "/main")
	public String type(HttpServletRequest request, String mode){
		return "admin/chart";
	}
}
