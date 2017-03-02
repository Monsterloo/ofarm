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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.SysAdminDao;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.SysAdminService;
import com.lulu.ofarm.net.util.DateUtils;

@Component
@Transactional
public class SysAdminServiceImpl implements SysAdminService {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private SysAdminDao sysAdminDao;
	
	public void save(SysAdmin admin) {
		Date date = new Date();
		admin.setCreatetime(DateUtils.DateToString_14a(date));
		admin.setRoletype("2");
		admin.setState("1");
		sysAdminDao.save(admin);	
	}

	public SysAdmin findByLoginname(String loginname) {
		return sysAdminDao.findByLoginname(loginname);
	}

	public String getTotalCount(){
		return sysAdminDao.count()+"";
	}
	
	public int getPage(int pageSize, int pageNumber){
		return (pageNumber-1)*pageSize;
	}
	
	public Page<SysAdmin> findAllByPage(Pageable page){
		Specification<SysAdmin> spec = new Specification<SysAdmin>() {
			
			@Override
			public Predicate toPredicate(Root<SysAdmin> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				return query.getRestriction();
			}
		}; 
		Page<SysAdmin> pageObj = sysAdminDao.findAll(spec,page);
		return pageObj;
	}
}
