package com.lulu.ofarm.net.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lulu.ofarm.net.entity.Product;
import com.lulu.ofarm.net.entity.SysAdmin;
import com.lulu.ofarm.net.service.ProductService;
import com.lulu.ofarm.net.util.IOUtils;
import com.lulu.ofarm.net.webmodel.PageResultForBootstrap;
import com.lulu.ofarm.net.webmodel.ProductBean;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/main")
	public String type(){
		return "admin/product";
	}
	
	@RequestMapping("/test")
	public String typetest(){
		return "admin/test";
	}
	
	@RequestMapping("/insertProduct")
	public void insertAdmin(Product p,HttpServletResponse response){
		String msg = "";
		productService.save(p);
		msg = "Successful";
		outPrintResult(response, msg);
	}
	
	@RequestMapping("/findProductByPage")
	public @ResponseBody PageResultForBootstrap<ProductBean> findProductByPage(@RequestParam(value="pageSize",defaultValue="10") Integer pageSize,@RequestParam(value="pageNumber",defaultValue="1") Integer pageNumber, String searchText){
		PageResultForBootstrap<Product> bean = new PageResultForBootstrap<Product>();
		PageResultForBootstrap<ProductBean> beanObj = new PageResultForBootstrap<ProductBean>();
		List<ProductBean> beanList = new ArrayList<ProductBean>();
		
		Sort sort =new Sort(Direction.ASC,"createtime");	
		PageRequest pr = new PageRequest(pageNumber-1, pageSize,sort);
		Page<Product> pageObj = productService.findProductByPage(pr);
		
		bean.setTotal(pageObj.getTotalElements());
		bean.setRows(pageObj.getContent());
		for(Product product : bean.getRows()){
			ProductBean pb = new ProductBean();
			productService.conver2Bean(product, pb);
			beanList.add(pb);
		}
		beanObj.setRows(beanList);
		beanObj.setTotal(pageObj.getTotalElements());
		return beanObj;
	}
	
	@RequestMapping("uploader")
    public void upload(HttpServletRequest request,HttpServletResponse response){
		System.out.println("收到图片!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象
        String upaloadUrl = request.getSession().getServletContext().getRealPath("/")+"upload/";//得到当前工程路径拼接上文件名
        File dir = new File(upaloadUrl);
        System.out.println(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            String fileName=file.getOriginalFilename();
            File tagetFile = new File(upaloadUrl+fileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
    System.out.println("接收完毕");
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
