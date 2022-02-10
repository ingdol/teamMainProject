package com.boot.teamMainProject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
					 .addResourceLocations("file:///D:/springWorkspace/"); // sej 경로
    registry.addResourceHandler("/images/**")
		        .addResourceLocations("file:///D:/project/linkerprj/prjphoto/"); // 서연님 경로
	}
}

