package com.lulu.ofarm.test;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lulu.ofarm.net.dao.SysAdminDao;
import com.lulu.ofarm.net.dao.SysRoleDao;
import com.lulu.ofarm.net.entity.Category;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.entity.SysRole;
import com.lulu.ofarm.net.service.CategoryService;
import com.lulu.ofarm.net.service.SysAdminService;
import com.lulu.ofarm.net.util.DateUtils;
import com.lulu.ofarm.net.webmodel.ZtreeNode;

import jxl.Sheet;
import jxl.Workbook;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = com.lulu.ofarm.config.AppContext.class)
public class SysAdminTest {

	/*@Autowired
	SwjAreariverpollutionSurveyService swjAreariverpollutionSurveyService;
	
	@Test
	public void test1() throws Exception{
		File file = new File("C:\\Users\\3hljl\\Desktop\\广州市汇总表.xls");
		swjAreariverpollutionSurveyService.getImport(file , 4,"白云区",8,48);
	}*/
	
	
	@Autowired
	SysAdminService sysAdminService;
	
	@Autowired
	SysRoleDao sysRoleDao;
	
	@Autowired
	CategoryService categoryService;
	
	@Test
	public void TestCategoryService(){
		/*List<Category> allCategory = categoryService.getAllCategory();
		for(Category c : allCategory){
			System.out.println(c.toString());
		}*/
		/*Category c = new Category();
		c.setId("asdffdf");
		c.setCid(c.getId());
		c.setCname("test");
		c.setIsParent("true");
		c.setParentid("0");
		c.setState("1");*/
		ZtreeNode node = new ZtreeNode();
		node.setId("saaas");
		node.setIsParent("true");
		node.setName("test");
		node.setpId("0");
		List<ZtreeNode> list = new ArrayList<ZtreeNode>();
		list.add(node);
		categoryService.save(list);
	}
	
	@Test
	public void saveAdmin(){
		for(int i=0;i<30;++i){
			SysAdmin admin = new SysAdmin();
			admin.setLoginname("test"+i);
			admin.setPassword("123456");
			admin.setPhone("12345678910");
			admin.setEmail(i+"@qq.com");
			admin.setRoletype("2");
			admin.setState("1");
			Date now = new Date();
			admin.setCreatetime(DateUtils.DateToString_14a(now));
			sysAdminService.save(admin);
		}
	}
	
	@Test
	public void saveRole(){
		List<SysRole> list = new ArrayList<SysRole>();
		SysRole role1 = new SysRole();
		role1.setRoletype("1");
		role1.setRolename("超级管理员");
		SysRole role2 = new SysRole();
		role2.setRoletype("2");
		role2.setRolename("普通管理员");
		sysRoleDao.save(role1);
		sysRoleDao.save(role2);
	}
	
	@Test
	public void printTotal(){
		//System.out.println(sysAdminService.getTotalCount());
		
		/*List<SysAdmin> list = sysAdminService.findAll();
		for(SysAdmin admin : list){
			System.out.println(admin.toString());
		}*/
	}
}
