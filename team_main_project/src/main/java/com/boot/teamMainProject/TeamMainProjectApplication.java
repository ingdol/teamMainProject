package com.boot.teamMainProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.boot.teamMainProject.dao.GatherDetComDAO;
import com.boot.teamMainProject.dao.IChatbotDAO;
import com.boot.teamMainProject.dao.IChattingDAO;
import com.boot.teamMainProject.dao.IClassCreateDAO;
import com.boot.teamMainProject.dao.IClassDAO;
import com.boot.teamMainProject.dao.IClassRevDAO;
import com.boot.teamMainProject.dao.IClass_ScheDAO;
import com.boot.teamMainProject.dao.ICommunityComDAO;
import com.boot.teamMainProject.dao.ICommunityDAO;
import com.boot.teamMainProject.dao.IGatherDetDAO;
import com.boot.teamMainProject.dao.IGatherScheduleDAO;
import com.boot.teamMainProject.dao.IGatheringDAO;
import com.boot.teamMainProject.dao.IHobbyCtgDAO;
import com.boot.teamMainProject.dao.IMemDAO;
import com.boot.teamMainProject.dao.ISpaceCreateDAO;
import com.boot.teamMainProject.dao.ISpaceDAO;
import com.boot.teamMainProject.dao.ISpaceReservationDAO;
import com.boot.teamMainProject.dao.ISpaceReviewDAO;
import com.boot.teamMainProject.dao.ISpace_CtgDAO;

@SpringBootApplication
@ComponentScan(basePackages= {"com.boot.teamMainProject"}) 
//@MapperScan(basePackageClasses = IProductDAO.class)
@MapperScan(basePackageClasses=GatherDetComDAO.class)
@MapperScan(basePackageClasses=IChatbotDAO.class)
@MapperScan(basePackageClasses=IChattingDAO.class)
@MapperScan(basePackageClasses=IClass_ScheDAO.class)
@MapperScan(basePackageClasses=IClassCreateDAO.class)
@MapperScan(basePackageClasses=IClassDAO.class)
@MapperScan(basePackageClasses=IClassRevDAO.class)
@MapperScan(basePackageClasses=ICommunityComDAO.class)
@MapperScan(basePackageClasses=ICommunityDAO.class)
@MapperScan(basePackageClasses=IGatherDetDAO.class)
@MapperScan(basePackageClasses=IGatheringDAO.class)
@MapperScan(basePackageClasses=IGatherScheduleDAO.class)
@MapperScan(basePackageClasses=IHobbyCtgDAO.class)
@MapperScan(basePackageClasses=IMemDAO.class)
@MapperScan(basePackageClasses=ISpace_CtgDAO.class)
@MapperScan(basePackageClasses=ISpaceCreateDAO.class)
@MapperScan(basePackageClasses=ISpaceDAO.class)
@MapperScan(basePackageClasses=ISpaceReservationDAO.class)
@MapperScan(basePackageClasses=ISpaceReviewDAO.class)

public class TeamMainProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(TeamMainProjectApplication.class, args);
	}

}
