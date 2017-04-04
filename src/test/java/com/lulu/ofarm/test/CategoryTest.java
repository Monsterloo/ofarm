package com.lulu.ofarm.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lulu.ofarm.net.dao.CategoryDao;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.service.CategoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = com.lulu.ofarm.config.AppContext.class)
public class CategoryTest {

	@Autowired
	CategoryService categoryService;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Test
	public void TestCategoryService(){
		for(int i=0;i<20;++i){
			Category c = new Category();
			c.setCname("酒茶冲饮");
			c.setState("1");
			c.setIsParent("false");
			
			categoryDao.save(c);
		}
	}
}
