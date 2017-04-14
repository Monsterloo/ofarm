package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.CategoryDao;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.entity.Product;
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

	public void save(ZtreeNode node) {
		Category c = categoryDao.findOne(node.getId());
		c.setCname(node.getName());
		c.setIsParent(node.getIsParent());
		c.setParentid(node.getpId());
		c.setState("1");
	}
	
	public void saveAll(List<ZtreeNode> nodeList){
		delAllCategory();
		for(ZtreeNode node : nodeList){
			Category c = categoryDao.findOne(node.getId());
			if(c == null){
				c = new Category();
			}
			c.setCname(node.getName());
			c.setCname(node.getName());
			c.setIsParent(node.getIsParent());
			c.setParentid(node.getpId());
			c.setState("1");
			categoryDao.save(c);
		}
	}
	
	public void delAllCategory(){
		Query query = entityManager.createNativeQuery("update category set state=0");
		query.executeUpdate();
	}

	public void delCategory(ZtreeNode treeNode) {
		categoryDao.updateCategory(treeNode.getId());
	}

	@Override
	public long findCount() {
		// TODO Auto-generated method stub
		Query query = entityManager.createNativeQuery("SELECT COUNT(1) FROM category WHERE parentid!=0 AND state = 1");
        long count = Long.parseLong(query.getSingleResult().toString());
		return count;
	}

}
