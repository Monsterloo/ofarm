package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.CategoryDao;
import com.lulu.ofarm.net.dao.ProductDao;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.util.DateUtils;
import com.lulu.ofarm.net.webmodel.ProductBean;

@Component
@Transactional
public class ProductServiceImpl implements ProductService {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public Product conver2Entity(ProductBean bean, Product product) {
		BeanUtils.copyProperties(bean, product);
		return product;
	}

	@Override
	public ProductBean conver2Bean(Product product, ProductBean bean) {
		BeanUtils.copyProperties(product, bean);
		String categoryName = categoryDao.findOne(product.getPcategory()).getCname();
		bean.setPcategoryName(categoryName);
		return bean;
	}
	
	
	public Page<Product> findProductByPage(Pageable page/*, final String loginname*/) {
		Specification<Product> spec = new Specification<Product>() {
			
			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				List<Predicate> predicates = new ArrayList<Predicate>();
				/*if(null != loginname && !loginname.isEmpty()){
					predicates.add(cb.like(root.get("loginname").as(String.class), "%"+loginname+"%"));
				}*/
				predicates.add(cb.equal(root.get("state").as(String.class), "1"));
				if(predicates.isEmpty()){
					return query.getRestriction();
				} else{
					query.where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
					return query.getRestriction();
				}
				
			}
		}; 
		Page<Product> pageObj = productDao.findAll(spec,page);
		return pageObj;
	}
	
	@Override
	public Product save(Product product) {
		if(product.getCreatetime() == null || "".equals(product.getCreatetime())){
			Date date = new Date();
			product.setCreatetime(DateUtils.DateToString_14a(date));
		}
		product.setState("1");
		return productDao.save(product);
	}

	@Override
	public Product findProductById(String id) {
		return productDao.findOne(id);
	}

	@Override
	public Product saveProductImgURL(String id, String newFileName) {
		Product bean = productDao.findOne(id);
		bean.setPimg("{ctx}/upload/"+newFileName);
		Product newBean = productDao.save(bean);
		return newBean;
	}
}
