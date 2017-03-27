package com.lulu.ofarm.net.controller;

import java.util.List;

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

import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.SysAdminService;
import com.lulu.ofarm.net.util.IOUtils;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;

@Controller
@RequestMapping("/sysAdmin")
public class SysAdminController {
	
	@Autowired
	private SysAdminService sysAdminService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/adminList";
	}
	
	@RequestMapping("/searchAllAdmin")
	public @ResponseBody PageResultForBootstrap<SysAdmin> searchAllAdmin(@RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		PageResultForBootstrap<SysAdmin> bean = new PageResultForBootstrap<SysAdmin>();
		Sort sort =new Sort(Direction.ASC,"createtime");
		
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<SysAdmin> pageObj = sysAdminService.findAllByPage(pr,searchText);
		
		bean.setTotal(pageObj.getTotalElements());
		bean.setRows(pageObj.getContent());
		for(SysAdmin admin : bean.getRows()){
			if("1".equals(admin.getRoletype())){
				admin.setRoletype("管理员");
			}else if("2".equals(admin.getRoletype())){
				admin.setRoletype("产品员工");
			}else if("3".equals(admin.getRoletype())){
				admin.setRoletype("人事员工");
			}
		}
		return bean;
	}
	
	@RequestMapping("/insertAdmin")
	public void insertAdmin(SysAdmin sysAdmin,HttpServletResponse response){
		String msg = "";
		SysAdmin result = sysAdminService.findByLoginname(sysAdmin.getLoginname());
		if(result == null){
			sysAdminService.save(sysAdmin);
			msg = "Successful";
		}else{
			msg = "";
		}
		outPrintResult(response, msg);
	}
	
	@RequestMapping("/updateAdmin")
	public void updateAdmin(SysAdmin sysAdmin,HttpServletResponse response){
		String msg = "";
		SysAdmin result = sysAdminService.save(sysAdmin);
		if(result != null){
			msg = "Successful";
		}else{
			msg = "";
		}
		outPrintResult(response, msg);
	}
	
	@RequestMapping("/delAdmin")
	public void delAdmin(HttpServletResponse response,@RequestParam(value = "idArr[]")List<String> idList){
		String msg = "";
		sysAdminService.delAdminById(idList);
		msg = "success";
		outPrintResult(response, msg);
	}
	
	
	@RequestMapping("/findAdminByLoginname")
	public @ResponseBody SysAdmin findAdminByLoginname(String loginname){
		SysAdmin result = sysAdminService.findByLoginname(loginname);
		return result;
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
