package com.boot.teamMainProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.boot.teamMainProject.service.ClassService;

@Controller
public class ClassController {
	@Autowired
	ClassService service;

}
