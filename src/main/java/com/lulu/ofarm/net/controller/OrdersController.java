package com.lulu.ofarm.net.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lulu.ofarm.net.service.ProductService;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/orders";
	}
}
