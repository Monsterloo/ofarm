package com.lulu.ofarm.net.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.entity.Orders;

@Repository
public interface OrderdetailDao  extends SpecificationsRepository<Orderdetail, String> {

	public Orderdetail save(Orderdetail od);
	
	public List<Orderdetail> findOrderdetailByOrder(Orders order) ;
}
