package com.lulu.ofarm.net.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.OrderdetailDao;
import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.service.OrderdetailService;

@Component
@Transactional
public class OrderdetailSeriveImpl implements OrderdetailService {

	@Autowired
	private OrderdetailDao orderdetailDao;
	
	@Override
	public Orderdetail save(Orderdetail od) {
		Orderdetail save = orderdetailDao.save(od);
		return save;
	}
}
