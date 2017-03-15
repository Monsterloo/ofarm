package com.lulu.ofarm.net.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.service.CategoryService;
import com.lulu.ofarm.net.util.IOUtils;
import com.lulu.ofarm.net.webmodel.ZtreeNode;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/categoryTree";
	}
	
	@RequestMapping("/getAllCategory")
	public @ResponseBody List<ZtreeNode> getAllCategory(HttpServletResponse response){
		List<Category> cList = categoryService.getAllCategory();
		if(cList != null){
			List<ZtreeNode> zList = new ArrayList<ZtreeNode>();
			for(Category c : cList){
				ZtreeNode z = new ZtreeNode();
				z.setId(c.getCid());
				z.setName(c.getCname());
				z.setpId(c.getParentid());
				z.setIsParent(c.getIsParent());
				zList.add(z);
			}
			return zList;
		}else{
			return null;
		}
	}
	
	private void outPrintResult(HttpServletResponse response,String returnStr) {
		try {
			response.setContentType("text/plain; charset=utf-8");
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.getWriter().print(returnStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			IOUtils.closeResponseWriter(response);
		}
	}
}
