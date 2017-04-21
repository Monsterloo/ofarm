package com.lulu.ofarm.net.service;

import java.util.List;

import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.webmodel.OrderdetailBean;
import com.lulu.ofarm.net.webmodel.OrdersBean;

public interface OrderdetailService {
	
	public Orders conver2Entity(OrderdetailBean bean, Orderdetail orderdetail);
	
	public OrdersBean conver2Bean(Orderdetail orderdetail, OrderdetailBean bean);
	
	public Orderdetail save(Orderdetail od);
	
	public List<Orderdetail> findOrderdetailByOrder(Orders order);
	
	
}
