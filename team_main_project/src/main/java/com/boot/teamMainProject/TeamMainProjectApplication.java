package com.boot.teamMainProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.boot.teamMainProject.controller.GatherDetController;
import com.boot.teamMainProject.controller.MainController;

@SpringBootApplication
@ComponentScan(basePackageClasses=MainController.class)
@ComponentScan(basePackageClasses=GatherDetController.class)
public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
