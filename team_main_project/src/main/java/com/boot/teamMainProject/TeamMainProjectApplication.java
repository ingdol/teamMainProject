package com.boot.teamMainProject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.boot.teamMainProject"}) 
//@MapperScan(basePackageClasses = IProductDAO.class)
public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
