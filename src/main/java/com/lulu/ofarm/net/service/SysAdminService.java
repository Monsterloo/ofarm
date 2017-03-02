package com.lulu.ofarm.net.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.lulu.ofarm.net.entity.SysAdmin;

public interface SysAdminService {

	public void save(SysAdmin admin);
	
	public SysAdmin findByLoginname(String loginname);
	
	public String getTotalCount();
	
	public int getPage(int pageSize, int pageNumber);
	
	public Page<SysAdmin> findAllByPage(Pageable page);
}
