package com.lulu.ofarm.net.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.webmodel.OrdersBean;

public interface OrdersService {
	
	public Orders conver2Entity(OrdersBean bean, Orders order);
	
	public OrdersBean conver2Bean(Orders order, OrdersBean bean);
	
	public Page<Orders> findOrdersByPage(Pageable page);

	public Orders save(OrdersBean bean, List<String> detailStr);
}
