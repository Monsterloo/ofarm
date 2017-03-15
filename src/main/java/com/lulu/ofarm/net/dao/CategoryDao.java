package com.lulu.ofarm.net.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.entity.SysAdmin;

@Repository
public interface CategoryDao  extends SpecificationsRepository<Category, String>{
	
	@Query("SELECT c FROM Category c WHERE state=1")
	public List<Category> findAllCategory();
}
