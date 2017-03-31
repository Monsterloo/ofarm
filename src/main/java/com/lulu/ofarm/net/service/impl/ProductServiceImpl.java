package com.lulu.ofarm.net.service.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.service.CategoryService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.ZtreeNode;

@Component
@Transactional
public class ProductServiceImpl implements ProductService {

	@PersistenceContext
	private EntityManager entityManager;
	

}
