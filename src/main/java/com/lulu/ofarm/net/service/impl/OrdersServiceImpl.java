package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.OrdersDao;
import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.OrderdetailService;
import com.lulu.ofarm.net.service.OrdersService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.service.SysAdminService;
import com.lulu.ofarm.net.util.DateUtils;
import com.lulu.ofarm.net.webmodel.OrdersBean;

@Component
@Transactional
public class OrdersServiceImpl implements OrdersService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private SysAdminService sysAdminService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderdetailService orderdetailService;
	
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public Orders conver2Entity(OrdersBean bean, Orders order) {
		BeanUtils.copyProperties(bean, order);
		order.setAdmin(bean.getAdminId());
		return order;
	}

	@Override
	public OrdersBean conver2Bean(Orders order, OrdersBean bean) {
		BeanUtils.copyProperties(order, bean);
		bean.setAdminId(order.getAdmin());
		bean.setAdmin(sysAdminService.findById(order.getAdmin()).getLoginname());;
		return bean;
	}
	
	@Override
	public Orders save(OrdersBean bean, List<String> detailStr) {
		Orders order = new Orders();
		this.conver2Entity(bean, order);
		order.setState("1");
		Date date = new Date();
		order.setCreatetime(DateUtils.DateToString_14a(date));
		List<Orderdetail> odList = new ArrayList<Orderdetail>();
		for(String s : detailStr){
			Orderdetail od = new Orderdetail();
			String[] sArr = new String[2];
			sArr = s.split("#");
			Product p = productService.findProductById(sArr[0]);
			//库存数不足
			if(Integer.parseInt(sArr[1]) > p.getInventory()){
				Orders error = new Orders();
				error.setState("-1");
				error.setNote("\""+p.getPname()+"\""+"库存数不足! 需求为:"+sArr[1]+", 库存数为:"+p.getInventory()+"!");
				return error;
			}
			
			od.setPid(sArr[0]);
			od.setNumber(Integer.parseInt(sArr[1]));
			odList.add(od);
		}
		Orders save = ordersDao.save(order);
		for(Orderdetail od: odList){
			od.setOrder(save);
			orderdetailService.save(od);
		}
		return save;
	}

	@Override
	public Page<Orders> findOrdersByPage(Pageable page) {
		Specification<Orders> spec = new Specification<Orders>() {

			@Override
			public Predicate toPredicate(Root<Orders> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				/*
				 * if(null != loginname && !loginname.isEmpty()){
				 * predicates.add(cb.like(root.get("loginname").as(String.class)
				 * , "%"+loginname+"%")); }
				 */
				predicates.add(cb.equal(root.get("state").as(String.class), "1"));
				if (predicates.isEmpty()) {
					return query.getRestriction();
				} else {
					query.where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
					return query.getRestriction();
				}

			}
		};
		Page<Orders> pageObj = ordersDao.findAll(spec, page);
		return pageObj;
	}

}
