package com.lulu.ofarm.net.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	@RequestMapping("/main")
	public String type(){
		return "admin/product";
	}
}
