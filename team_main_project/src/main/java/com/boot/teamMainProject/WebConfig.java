package com.boot.teamMainProject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///C:/teamImage/") // 공통 이미지 경로
        .addResourceLocations("file:///D:/project/linkerprj/prjphoto/"); // 서연님 경로

		registry.addResourceHandler("/voice/**")
		.addResourceLocations("file:///C:/upload/"); //챗봇 보이스
	}
}
