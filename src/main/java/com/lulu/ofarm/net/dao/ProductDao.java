package com.lulu.ofarm.net.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.webmodel.ProductBean;

@Repository
public interface ProductDao extends SpecificationsRepository<Product, String>{

	/*@Query("SELECT p FROM Product p WHERE state=1")
	public List<Category> findAllProduct();*/
	
}
