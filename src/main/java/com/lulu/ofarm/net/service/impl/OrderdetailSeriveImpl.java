package com.lulu.ofarm.net.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.OrderdetailDao;
import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.OrderdetailService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.OrderdetailBean;
import com.lulu.ofarm.net.webmodel.OrdersBean;

@Component
@Transactional
public class OrderdetailSeriveImpl implements OrderdetailService {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderdetailDao orderdetailDao;
	
	@Override
	public Orders conver2Entity(OrderdetailBean bean, Orderdetail orderdetail) {
		/*BeanUtils.copyProperties(bean, orderdetail);
		orderdetail.set(bean.getAdminId());*/
		return null;
	}

	@Override
	public OrdersBean conver2Bean(Orderdetail orderdetail, OrderdetailBean bean) {
		BeanUtils.copyProperties(orderdetail, bean);
		Product product = productService.findProductById(orderdetail.getPid());
		bean.setPname(product.getPname());
		bean.setPrice(product.getPrice());
		return null;
	}
	
	@Override
	public Orderdetail save(Orderdetail od) {
		Orderdetail save = orderdetailDao.save(od);
		return save;
	}

	@Override
	public List<Orderdetail> findOrderdetailByOrder(Orders order) {
		List<Orderdetail> odList = orderdetailDao.findOrderdetailByOrder(order);
		return odList;
	}

}
