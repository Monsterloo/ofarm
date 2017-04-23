package com.lulu.ofarm.net.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.OrdersService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.OrdersBean;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;

@Controller
@RequestMapping("/orders")
public class OrdersController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService orderService;
	
	@RequestMapping(value = "/main")
	public String type(HttpServletRequest request, String mode){
		request.getSession().setAttribute("mode", mode);
		return "admin/orders";
	}
	
	/**
	 * 新增订单
	 * @param response
	 * @param bean
	 * @param dList
	 * @return
	 */
	@RequestMapping("/insertOrder")
	public @ResponseBody Orders insertOrder(HttpServletRequest request, HttpServletResponse response, OrdersBean bean, @RequestParam(value = "detailArr[]") List<String> dList){
		String adminId = ((SysAdmin)request.getSession().getAttribute("user")).getId();
		//"402882355a5e4b28015a5e4b2d9f0000"
		bean.setAdminId(adminId);
		Orders save = orderService.save(bean, dList);
		return save;
	}
	
	/**
	 * 修改订单状态	(1为未完成订单,2为完成的订单,0为取消的订单,-1为错误)
	 * @param response
	 * @param oIds
	 * @param index
	 * @return
	 */
	@RequestMapping("/changeState")
	public @ResponseBody String changeState(HttpServletResponse response, @RequestParam(value = "oIds[]") List<String> oIds, @RequestParam("index") String index){
		String returnStr = "";
		orderService.changeState(oIds, index.trim());
		returnStr = "success";
		return returnStr;
	}
	
	/**
	 * 分页
	 * @param request
	 * @param pageSize
	 * @param pageNumber
	 * @param searchText
	 * @return
	 */
	@RequestMapping("/findOrdersByPage")
	public @ResponseBody PageResultForBootstrap<OrdersBean> findProductByPage(HttpServletRequest request, @RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		String mode = request.getParameter("mode");
		PageResultForBootstrap<Orders> bean = new PageResultForBootstrap<Orders>();
		PageResultForBootstrap<OrdersBean> beanObj = new PageResultForBootstrap<OrdersBean>();
		List<OrdersBean> beanList = new ArrayList<OrdersBean>();
		
		Sort sort =new Sort(Direction.DESC,"createtime");	
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<Orders> pageObj = orderService.findOrdersByPage(pr, mode, searchText);
		
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
	
	/**
	 * 根据id查询订单详情
	 * @param response
	 * @param oid
	 * @return
	 */
	@RequestMapping("/findOrdersById")
	public @ResponseBody OrdersBean findOrdersById(HttpServletResponse response, String oid){
		OrdersBean bean = orderService.findOrdersById(oid);
		return bean;
	}
}
