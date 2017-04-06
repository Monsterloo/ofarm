package com.lulu.ofarm.net.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.webmodel.ProductBean;

public interface ProductService {

	public Product conver2Entity(ProductBean bean, Product product);
	
	public ProductBean conver2Bean(Product product, ProductBean bean);
	
	public Page<Product> findProductByPage(Pageable page);
	
	public Product findProductById(String id);
	
	public Product saveProductImgURL(String id, String newFileName);
	
	public Product save(Product product);
}
