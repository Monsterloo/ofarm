package com.lulu.ofarm.net.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.OrdersService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.OrdersBean;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;
import com.lulu.ofarm.net.webmodel.ProductBean;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService orderService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/orders";
	}
	
	@RequestMapping("/insertOrder")
	public @ResponseBody Orders insertOrder(HttpServletResponse response, OrdersBean bean, @RequestParam(value = "detailArr[]") List<String> dList){
		String adminId = "402882355a5e4b28015a5e4b2d9f0000";
		bean.setAdminId(adminId);
		Orders save = orderService.save(bean, dList);
		return save;
	}
	
	@RequestMapping("/findOrdersByPage")
	public @ResponseBody PageResultForBootstrap<OrdersBean> findProductByPage(@RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		PageResultForBootstrap<Orders> bean = new PageResultForBootstrap<Orders>();
		PageResultForBootstrap<OrdersBean> beanObj = new PageResultForBootstrap<OrdersBean>();
		List<OrdersBean> beanList = new ArrayList<OrdersBean>();
		
		Sort sort =new Sort(Direction.DESC,"createtime");	
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<Orders> pageObj = orderService.findOrdersByPage(pr);
		
		bean.setTotal(pageObj.getTotalElements());
		bean.setRows(pageObj.getContent());
		for(Orders order : bean.getRows()){
			OrdersBean ob = new OrdersBean();
			orderService.conver2Bean(order, ob);
			beanList.add(ob);
		}
		beanObj.setRows(beanList);
		beanObj.setTotal(pageObj.getTotalElements());
		return beanObj;
	}
}
