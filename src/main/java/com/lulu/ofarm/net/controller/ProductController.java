package com.lulu.ofarm.net.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;
import com.lulu.ofarm.net.webmodel.ProductBean;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/product";
	}
	
	@RequestMapping("/findProductByPage")
	public @ResponseBody PageResultForBootstrap<ProductBean> findProductByPage(@RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		PageResultForBootstrap<Product> bean = new PageResultForBootstrap<Product>();
		PageResultForBootstrap<ProductBean> beanObj = new PageResultForBootstrap<ProductBean>();
		List<ProductBean> beanList = new ArrayList<ProductBean>();
		
		Sort sort =new Sort(Direction.ASC,"createtime");	
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<Product> pageObj = productService.findProductByPage(pr);
		
		bean.setTotal(pageObj.getTotalElements());
		bean.setRows(pageObj.getContent());
		for(Product product : bean.getRows()){
			ProductBean pb = new ProductBean();
			productService.conver2Bean(product, pb);
			beanList.add(pb);
		}
		beanObj.setRows(beanList);
		beanObj.setTotal(pageObj.getTotalElements());
		return beanObj;
	}
}
