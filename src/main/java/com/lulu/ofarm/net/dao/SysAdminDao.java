package com.lulu.ofarm.net.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.SysAdmin;

@Repository
public interface SysAdminDao extends SpecificationsRepository<SysAdmin, String>{

	public SysAdmin findByLoginname(String loginname);
	
	/*@Query("SELECT * FROM sys_admin LIMIT ?1,?2")
	public List<SysAdmin> findAll(@Param("pageNumber") int pageNumber, @Param("pageSize") int pagesize);*/
}
