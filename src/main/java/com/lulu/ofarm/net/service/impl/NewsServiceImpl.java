package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

import com.lulu.ofarm.net.dao.NewsDao;
import com.lulu.ofarm.net.dao.SysAdminDao;
import com.lulu.ofarm.net.entity.News;
import com.lulu.ofarm.net.service.NewsService;
import com.lulu.ofarm.net.util.DateUtils;
import com.lulu.ofarm.net.webmodel.NewsBean;

@Component
@Transactional
public class NewsServiceImpl implements NewsService{

	@Autowired
	private SysAdminDao adminDao;
	
	@Autowired
	private NewsDao newsDao;
	
	@Override
	public News conver2Entity(NewsBean bean, News news) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NewsBean conver2Bean(News news, NewsBean bean) {
		BeanUtils.copyProperties(news, bean);
		bean.setPublishName(adminDao.findOne(news.getPublisher()).getLoginname());
		return bean;
	}

	@Override
	public Page<News> findNewsByPage(Pageable page, String title) {
		Specification<News> spec = new Specification<News>() {

			@Override
			public Predicate toPredicate(Root<News> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<Predicate>();
				
			    if(null != title && !title.isEmpty()){
			    predicates.add(cb.like(root.get("title").as(String.class), "%"+title+"%")); }
			    predicates.add(cb.equal(root.get("state").as(String.class), "1"));
				if (predicates.isEmpty()) {
					return query.getRestriction();
				} else {
					query.where(cb.and(predicates.toArray(new Predicate[predicates.size()])));
					return query.getRestriction();
				}

			}
		};
		Page<News> pageObj = newsDao.findAll(spec, page);
		return pageObj;
	}

	@Override
	public News save(News news) {
		Date date = new Date();
		news.setCreatetime(DateUtils.DateToString_14a(date));
		news.setState("1");
		return newsDao.save(news);
	}
	
	@Override
	public void delNews(List<String> nIds) {
		for(String nid : nIds){
			newsDao.delNews(nid);
		}
	}
	
	@Override
	public NewsBean findNewsById(String nid) {
		News news = newsDao.findOne(nid);
		NewsBean bean = new NewsBean();
		conver2Bean(news, bean);
		return bean;
	}


}
