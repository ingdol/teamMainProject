package com.boot.teamMainProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.boot.teamMainProject.dao.GatherDetComDAO;
import com.boot.teamMainProject.dao.IGatherDetDAO;
import com.boot.teamMainProject.dao.IGatheringDAO;
import com.boot.teamMainProject.dao.IMemDAO;
import com.boot.teamMainProject.dao.ISpaceDAO;
@SpringBootApplication
@ComponentScan(basePackages= {"com.boot.teamMainProject"}) 
//@MapperScan(basePackageClasses = IProductDAO.class)
@MapperScan(basePackageClasses = IMemDAO.class)
@MapperScan(basePackageClasses = ISpaceDAO.class)
@MapperScan(basePackageClasses = IGatheringDAO.class)
@MapperScan(basePackageClasses=GatherDetComDAO.class)
@MapperScan(basePackageClasses=IGatherDetDAO.class)
public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
