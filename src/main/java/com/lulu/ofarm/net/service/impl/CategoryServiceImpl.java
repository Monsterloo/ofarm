package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
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

	public void save(ZtreeNode node) {
		// TODO Auto-generated method stub
		Category c = new Category();
		c.setId(node.getId());
		c.setCid(node.getId());
		c.setCname(node.getName());
		c.setParentid(node.getpId());
		if("true".equals(node.getIsParent())){
			c.setIsParent("true");
		}else{
			c.setIsParent("false");
		}
		c.setState("1");
		categoryDao.save(c);
	}
	
	public void saveAll(List<ZtreeNode> nodeList){
		delAllCategory();
		List<Category> dataList = new ArrayList<Category>();
		for(ZtreeNode node : nodeList){
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
			dataList.add(c);
		}
		categoryDao.save(dataList);
		/*Category c = new Category();
		c.setId("0602f9c8055711e794f328cfe95897da");
		c.setCid("0602f9c8055711e794f328cfe95897da");
		c.setCname("酒茶冲饮");
		c.setParentid("ae3fe6b3055411e794f328cfe95897da");
		c.setState("0");
		c.setIsParent("false");
		categoryDao.save(c);*/
	}
	
	public void delAllCategory(){
		/*Query query = entityManager.createNativeQuery("update category set state=0");
		query.executeUpdate();*/
		categoryDao.deleteAll();
	}

	public void delCategory(ZtreeNode treeNode) {
		/*Category c = new Category();
		String id = treeNode.getId();
		String name = treeNode.getName();
		String parentid = treeNode.getpId();
		String isParent = treeNode.getIsParent();
		c.setId(id);
		c.setCid(id);
		c.setCname(name);
		c.setParentid(parentid);
		c.setIsParent(isParent);
		c.setState("0");
		categoryDao.save(c);*/
		/*Query query = entityManager.createNativeQuery("update category set state=0 where id=:id");
		query.setParameter("id", treeNode.getId());
		query.executeUpdate();*/
		categoryDao.updateCategory(treeNode.getId());
	}

}
