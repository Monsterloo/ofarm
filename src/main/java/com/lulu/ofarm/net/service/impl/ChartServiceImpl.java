package com.lulu.ofarm.net.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.lulu.ofarm.net.dao.CategoryDao;
import com.lulu.ofarm.net.dao.OrderdetailDao;
import com.lulu.ofarm.net.dao.ProductDao;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.entity.Orderdetail;
import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.service.CategoryService;
import com.lulu.ofarm.net.service.ChartService;
import com.lulu.ofarm.net.service.OrderdetailService;
import com.lulu.ofarm.net.service.OrdersService;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.webmodel.ChartBean;
import com.lulu.ofarm.net.webmodel.PieBean;

@Component
@Transactional
public class ChartServiceImpl implements ChartService {

	@Autowired
	private OrderdetailService orderdetailService;
	
	@Autowired
	private OrderdetailDao orderdetailDao;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CategoryDao categoryDao;
	
	/*@Autowired
	private ProductDao 
	*/
	public ChartBean findBaseData(){
		ChartBean cb = new ChartBean();
		
		//查找基础数据
		cb.setProductNumber(productService.findCount());
		cb.setNewOrders(ordersService.findCount());
		List<Orderdetail> odList = (List<Orderdetail>) orderdetailDao.findAll();
		Double totalIncome = 0.0;
		for(Orderdetail od : odList){
			Product p = productService.findProductById(od.getPid());
			Double total = 0.0;
			total = p.getPrice()*od.getNumber();
			totalIncome += total;
		}
		cb.setTotalIncome(totalIncome);
		
		//查找圆饼图数据
		List<Orderdetail> orderdetailList = (List<Orderdetail>) orderdetailDao.findAll();
		List<Product> productList = (List<Product>) productDao.findAll();
		List<Category> sonList = categoryService.findSonCategory();
		List<Category> rootList = categoryService.findCategoryByParentId("0");
		
		//初始根类别map
		Map<String,Integer> rootMap = new HashMap<String,Integer>();
		for(Category c : rootList){
			if(rootMap.get(c.getId()) == null){
				rootMap.put(c.getId(), 0);
			}else{
				int code = rootMap.get(c.getId()).intValue()+1;
				rootMap.put(c.getId(), code);
			}
		}
		
		//初始子类别map
		Map<Category,Integer> sonMap = new HashMap<Category,Integer>();
		for(Category c : sonList){
			if(sonMap.get(c) == null){
				sonMap.put(c, 1);
			}else{
				int code = sonMap.get(c).intValue()+1;
				sonMap.put(c, code);
			}
		}
		
		//所有订单详细中所有产品
		Map<String,Integer> pidMap = new HashMap<String,Integer>();
		for(Orderdetail od : orderdetailList){
			if(pidMap.get(od.getPid()) == null){
				pidMap.put(od.getPid(), 1);
			} else{
				int code = pidMap.get(od.getPid()).intValue()+1;
				pidMap.put(od.getPid(), code);
			}
		}
		//所有选出的产品中 所有类别id
		Map<String,Integer> cidMap = new HashMap<String,Integer>();
		for(Product p : productList){
			if(cidMap.get(p.getPcategory()) == null){
				cidMap.put(p.getPcategory(), 1);
			}else {
				int code = cidMap.get(p.getPcategory()).intValue()+1;
				pidMap.put(p.getPcategory(), code);
			}
		}
		
		//统计根类别id的个数
		for (Category sonCategory : sonMap.keySet()) {
			if(rootMap.get(sonCategory.getParentid()) == null){
				rootMap.put(sonCategory.getParentid(), 1);
			} else{
				int code = rootMap.get(sonCategory.getParentid()).intValue()+1;
				rootMap.put(sonCategory.getParentid(), code);
			}
		}
		
		List<PieBean> pbList = new ArrayList<PieBean>();
		for (String rootId : rootMap.keySet()) {
			Category root = categoryDao.findOne(rootId);
			PieBean pb = new PieBean();
			pb.setName(root.getCname());
			pb.setValue(rootMap.get(rootId));
			pbList.add(pb);
		}
		cb.setPbList(pbList);
		return cb;
	}
}
