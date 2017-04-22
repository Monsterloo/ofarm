package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
	
	public SysAdmin save(SysAdmin admin) {
		if(admin.getCreatetime() == null || "".equals(admin.getCreatetime())){
			Date date = new Date();
			admin.setCreatetime(DateUtils.DateToString_14a(date));
		}
		/*if(admin.getRoletype() != null || !"".equals(admin.getRoletype())){
			if("超级管理员".equals(admin.getRoletype())){
				admin.setRoletype("1");
			}else{
				admin.setRoletype("2");
			}
		}else{
			admin.setRoletype("2");
		}*/
		if("管理员".equals(admin.getRoletype())){
			admin.setRoletype("1");
		} else if("人事员工".equals(admin.getRoletype())){
			admin.setRoletype("2");
		} else if("产品员工".equals(admin.getRoletype())){
			admin.setRoletype("3");
		} 
		admin.setState("1");
		return sysAdminDao.save(admin);	
	}

	public SysAdmin findByLoginname(String loginname) {
		return sysAdminDao.findByLoginname(loginname);
	}
	
	@Override
	public SysAdmin findById(String id) {
		SysAdmin admin = sysAdminDao.findOne(id);
		return admin;
	}
	
	@Override
	public SysAdmin modify(SysAdmin admin) {
		SysAdmin result = sysAdminDao.save(admin);
		return result;
	}
	
	@Override
	public void delAdminById(List<String> idList) {
		for(String id : idList){
			sysAdminDao.delete(id);
		}
	}

	public String getTotalCount(){
		return sysAdminDao.count()+"";
	}
	
	public int getPage(int pageSize, int pageNumber){
		return (pageNumber-1)*pageSize;
	}
	
	public Page<SysAdmin> findAllByPage(Pageable page, final String loginname){
		Specification<SysAdmin> spec = new Specification<SysAdmin>() {
			
			@Override
			public Predicate toPredicate(Root<SysAdmin> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				// TODO Auto-generated method stub
				List<Predicate> predicates = new ArrayList<Predicate>();
				if(null != loginname && !loginname.isEmpty()){
					predicates.add(cb.like(root.get("loginname").as(String.class), "%"+loginname+"%"));
				}
				predicates.add(cb.equal(root.get("state").as(String.class), "1"));
				if(predicates.isEmpty()){
					return query.getRestriction();
				} else{
					query.where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
					return query.getRestriction();
				}
				
			}
		}; 
		Page<SysAdmin> pageObj = sysAdminDao.findAll(spec,page);
		return pageObj;
	}


}
