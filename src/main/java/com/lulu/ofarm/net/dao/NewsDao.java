package com.lulu.ofarm.net.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.hhh.fund.util.SpecificationsRepository;
import com.lulu.ofarm.net.entity.News;

@Repository
public interface NewsDao extends SpecificationsRepository<News, String>{

	@Modifying 
	@Query("UPDATE News n SET state=0 where nid=:nid")
	public void delNews(@Param("nid")String nid);
}
