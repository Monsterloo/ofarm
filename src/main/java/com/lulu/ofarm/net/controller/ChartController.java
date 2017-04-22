package com.lulu.ofarm.net.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.service.ChartService;
import com.lulu.ofarm.net.webmodel.ChartBean;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	@RequestMapping(value = "/main")
	public String type(HttpServletRequest request){
		return "admin/chart";
	}
	
	@RequestMapping(value = "/findBaseData")
	public @ResponseBody ChartBean findBaseData(HttpServletRequest request){
		ChartBean cb = chartService.findBaseData();
		return cb;
	}
}
