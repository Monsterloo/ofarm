package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.CategoryDao;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.service.CategoryService;
import com.lulu.ofarm.net.webmodel.ZtreeNode;

@Component
@Transactional
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Category> getAllCategory() {
		// TODO Auto-generated method stub
		List<Category> allList = categoryDao.findAllCategory();
		return allList;
	}

	@Override
	public void save(List<ZtreeNode> nodesList) {
		// TODO Auto-generated method stub
		List<Category> categoryList = new ArrayList<Category>();
		for(ZtreeNode node : nodesList){
			Category c = new Category();
			c.setId(node.getId());
			c.setCid(node.getId());
			c.setCname(node.getName());
			c.setParentid(node.getpId());
			if("true".equals(node.getIsParent())){
				c.setIsParent("true");;
			}else{
				c.setIsParent("false");
			}
			c.setState("1");
			categoryList.add(c);
		}
		delAllCategory();
		categoryDao.save(categoryList);
	}
	
	public void delAllCategory(){
		Query query = entityManager.createNativeQuery("update category set state=0");
		query.executeUpdate();
	}

}
