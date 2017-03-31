package com.lulu.ofarm.net.dao;

import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.SysAdmin;

@Repository
public interface ProductDao extends SpecificationsRepository<SysAdmin, String>{

}
