package com.lulu.ofarm.net.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lulu.ofarm.net.entity.News;
import com.lulu.ofarm.net.entity.Orders;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.NewsService;
import com.lulu.ofarm.net.util.IOUtils;
import com.lulu.ofarm.net.webmodel.NewsBean;
import com.lulu.ofarm.net.webmodel.OrdersBean;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value = "/main")
	public String type(HttpServletRequest request, String mode){
		return "admin/news";
	}
	
	@RequestMapping(value = "/test")
	public String test(HttpServletRequest request, String mode){
		return "admin/aaa";
	}
	
	/**
	 * 保存消息
	 * @param response
	 * @param bean
	 * @param dList
	 * @return
	 */
	@RequestMapping("/insertNews")
	public @ResponseBody News insertNews(HttpServletRequest request, HttpServletResponse response, News news){
		String adminId = ((SysAdmin)request.getSession().getAttribute("user")).getId();
		news.setPublisher(adminId);
		News obj = newsService.save(news);
		return obj;
	}
	
	/**
	 * 分页
	 * @param request
	 * @param pageSize
	 * @param pageNumber
	 * @param searchText
	 * @return
	 */
	@RequestMapping("/findNewsByPage")
	public @ResponseBody PageResultForBootstrap<NewsBean> findNewsByPage(HttpServletRequest request, @RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		PageResultForBootstrap<News> bean = new PageResultForBootstrap<News>();
		PageResultForBootstrap<NewsBean> beanObj = new PageResultForBootstrap<NewsBean>();
		List<NewsBean> beanList = new ArrayList<NewsBean>();
		
		Sort sort =new Sort(Direction.DESC,"createtime");	
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<News> pageObj = newsService.findNewsByPage(pr, searchText);
		
		bean.setTotal(pageObj.getTotalElements());
		bean.setRows(pageObj.getContent());
		for(News news : bean.getRows()){
			NewsBean ob = new NewsBean();
			newsService.conver2Bean(news, ob);
			beanList.add(ob);
		}
		beanObj.setRows(beanList);
		beanObj.setTotal(pageObj.getTotalElements());
		return beanObj;
	}
	
	/**
	 * 删除消息
	 * @param response
	 * @param nIds
	 */
	@RequestMapping("/delNews")
	public void delNews(HttpServletResponse response,@RequestParam(value = "nIds[]")List<String> nIds){
		String msg = "";
		newsService.delNews(nIds);
		msg = "success";
		outPrintResult(response, msg);
	}
	
	/**
	 * 根据id查询消息详情
	 * @param response
	 * @param oid
	 * @return
	 */
	@RequestMapping("/findNewsById")
	public @ResponseBody NewsBean findNewsById(HttpServletResponse response, String nid){
		NewsBean bean = newsService.findNewsById(nid);
		return bean;
	}
	
	private void outPrintResult(HttpServletResponse response,String returnStr) {
		try {
			response.setContentType("text/plain; charset=utf-8");
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.getWriter().print(returnStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			IOUtils.closeResponseWriter(response);
		}
	}
}
