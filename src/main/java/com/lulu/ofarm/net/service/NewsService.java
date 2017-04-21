package com.lulu.ofarm.net.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.lulu.ofarm.net.entity.News;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.webmodel.NewsBean;
import com.lulu.ofarm.net.webmodel.ProductBean;

public interface NewsService {
	
	public News conver2Entity(NewsBean bean, News news);
	
	public NewsBean conver2Bean(News news, NewsBean bean);
	
	public Page<News> findNewsByPage(Pageable page, String title);
	
	public NewsBean findNewsById(String nid);
	
	public News save(News news);
	
	public void delNews(List<String> nIds);

}
