package com.lulu.ofarm.config;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@Configuration
@PropertySource("classpath:web.properties")
@ComponentScan(basePackages = {"com.lulu.ofarm.net.controller"},
		useDefaultFilters = false, includeFilters = {  
					@ComponentScan.Filter(type = FilterType.ANNOTATION, value = {Controller.class, RestController.class})  
})  
public class ServletContext extends WebMvcConfigurationSupport {
	
	private final static Logger logger = LoggerFactory.getLogger(ServletContext.class);
	
	@Autowired
	private Environment env;
	
	/**
	 * 配置HttpMessageConverter，转换成jackson
	 * @return
	 */
	@Bean
	public MappingJackson2HttpMessageConverter jacksonConverter() {
		MappingJackson2HttpMessageConverter jacksonConverter = new MappingJackson2HttpMessageConverter();
		
		ObjectMapper om = new ObjectMapper();
		om.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		jacksonConverter.setObjectMapper(om);
		
		// 避免返回Json或xml时，产生文件下载
		List<MediaType> mediaTypes = new ArrayList<MediaType>();
		mediaTypes.add(MediaType.parseMediaType("text/html;charset=UTF-8"));
		mediaTypes.add(MediaType.parseMediaType("application/json;charset=UTF-8"));
//		mediaTypes.add(MediaType.APPLICATION_JSON_UTF8);

		jacksonConverter.setSupportedMediaTypes(mediaTypes);
		
		return jacksonConverter;
	}
	
	/**
	 * 配置ViewResolver
	 * @return
	 */
	@Bean  
    public ViewResolver viewResolver() {  
        logger.info("ViewResolver");  
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();  
        viewResolver.setPrefix("/WEB-INF/views/");  
        viewResolver.setSuffix(".jsp");  
        viewResolver.setViewClass(JstlView.class);
        return viewResolver;  
    }  
	
	/**
	 *  RequestMappingHandlerMapping<br>
	 * 
	 * @return
	 */
	@Bean  
    public RequestMappingHandlerMapping requestMappingHandlerMapping() {  
        logger.info("RequestMappingHandlerMapping");  
          
        return super.requestMappingHandlerMapping();  
    }  
	
	/**
	 * 处理静态资源
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		/*registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
		registry.addResourceHandler("/css/**").addResourceLocations("/css/");
		registry.addResourceHandler("/img/**").addResourceLocations("/img/");
		registry.addResourceHandler("/js/**").addResourceLocations("/js/");
		registry.addResourceHandler("/doc/**").addResourceLocations("/doc/");
		registry.addResourceHandler("/cache/**").addResourceLocations("/cache/");
		registry.addResourceHandler("/template/**").addResourceLocations("/template/");*/
		registry.addResourceHandler("/admin/**").addResourceLocations("/admin/");
		registry.addResourceHandler("/admin/assets/**").addResourceLocations("/admin/assets/");
		registry.addResourceHandler("/admin/css/**").addResourceLocations("/admin/css/");
		registry.addResourceHandler("/admin/fonts/**").addResourceLocations("/admin/fonts/");
		registry.addResourceHandler("/admin/img/**").addResourceLocations("/admin/img/");
		registry.addResourceHandler("/admin/js/**").addResourceLocations("/admin/js/");
		registry.addResourceHandler("/admin/doc/**").addResourceLocations("/admin/doc/");
		registry.addResourceHandler("/admin/cache/**").addResourceLocations("/admin/cache/");
		registry.addResourceHandler("/admin/template/**").addResourceLocations("/admin/template/");
		registry.addResourceHandler("/upload/**").addResourceLocations("/upload/");
	}
	
	/**
	 * 文件上传 <br> 
	 * @return
	 */
	@Bean(name="multipartResolver")  
    public CommonsMultipartResolver commonsMultipartResolver() throws IOException {  
        logger.info("CommonsMultipartResolver");  
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();  
        
        commonsMultipartResolver.setMaxUploadSize(Long.parseLong(env.getProperty("maxUploadFileSize")));
        commonsMultipartResolver.setDefaultEncoding(env.getProperty("defaultEncoding"));
        commonsMultipartResolver.setUploadTempDir(new FileSystemResource(new File(env.getProperty("uploadTempDir"))));
        
        return commonsMultipartResolver;
    }  
}
