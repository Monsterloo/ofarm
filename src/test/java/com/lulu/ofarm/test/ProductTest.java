package com.lulu.ofarm.test;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lulu.ofarm.net.dao.ProductDao;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.util.DateUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = com.lulu.ofarm.config.AppContext.class)
public class ProductTest {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductDao productDao;
	
	@Test
	public void TestProductService(){
		for(int i=0;i<5;++i){
			Product p = new Product();
			Date date = new Date();
			p.setCreattime(DateUtils.DateToString_14a(date));
			productDao.save(p);
		}
	}
}
