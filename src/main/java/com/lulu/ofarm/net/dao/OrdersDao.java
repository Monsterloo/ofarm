package com.lulu.ofarm.net.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.Orders;

@Repository
public interface OrdersDao extends SpecificationsRepository<Orders, String> {
	
	@Query("SELECT o FROM Orders o WHERE state=1")
	public List<Orders> findAllOrders();
}
