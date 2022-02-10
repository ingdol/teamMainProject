package com.boot.teamMainProject;

import com.boot.teamMainProject.controller.SpaceReservationController;
import com.boot.teamMainProject.controller.MainController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan(basePackages= {"com.boot.teamMainProject"}) 
//@MapperScan(basePackageClasses = IProductDAO.class)
@ComponentScan(basePackageClasses=MainController.class)
@ComponentScan(basePackageClasses= SpaceReservationController.class)

public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
