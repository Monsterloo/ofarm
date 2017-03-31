package com.lulu.ofarm.net.service;

import java.util.List;

import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.webmodel.ZtreeNode;

public interface CategoryService {
	
	public List<Category> getAllCategory();
	
	public void save(ZtreeNode node);
	
	public void saveAll(List<ZtreeNode> nodeList);
	
	public void delAllCategory();

	public void delCategory(ZtreeNode treeNode);
}
