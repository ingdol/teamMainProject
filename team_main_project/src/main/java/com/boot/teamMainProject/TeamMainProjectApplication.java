package com.boot.teamMainProject;

import com.boot.teamMainProject.controller.SpaceReservationController;
import com.boot.teamMainProject.dao.IMemDAO;
import com.boot.teamMainProject.controller.MainController;
import com.boot.teamMainProject.dao.ISpaceDAO;

import com.boot.teamMainProject.controller.MemberController;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.boot.teamMainProject.controller.GatherDetController;
import com.boot.teamMainProject.controller.MainController;
import com.boot.teamMainProject.controller.SpaceReservationController;
import com.boot.teamMainProject.dao.IGatherDetDAO;
import com.boot.teamMainProject.dao.IMemDAO;
@SpringBootApplication
@ComponentScan(basePackages= {"com.boot.teamMainProject"}) 
//@MapperScan(basePackageClasses = IProductDAO.class)
@ComponentScan(basePackageClasses=MainController.class)
@ComponentScan(basePackageClasses=GatherDetController.class)
@ComponentScan(basePackageClasses= SpaceReservationController.class)
@ComponentScan(basePackageClasses= MemberController.class)
@MapperScan(basePackageClasses = IMemDAO.class)
@MapperScan(basePackageClasses=IGatherDetDAO.class)//ldh
@MapperScan(basePackageClasses = ISpaceDAO.class)


public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
