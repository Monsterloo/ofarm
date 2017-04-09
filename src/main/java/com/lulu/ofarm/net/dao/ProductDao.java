package com.lulu.ofarm.net.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.Product;

@Repository
public interface ProductDao extends SpecificationsRepository<Product, String>{

	/*@Query("SELECT p FROM Product p WHERE state=1")
	public List<Category> findAllProduct();*/
	
	@Modifying 
	@Query("UPDATE Product p SET state=0 where pid=:pid")
	public void delProduct(@Param("pid")String pid);
}
