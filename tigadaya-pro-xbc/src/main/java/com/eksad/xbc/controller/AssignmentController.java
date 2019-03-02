package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AssignmentController {
	
	@RequestMapping(value="/assignment")
	public String index(){
		return "/assignment/index";
	}
	
	@RequestMapping(value="/assignment/create")
	public String create(){
		return "/assignment/create";
	}
	
	@RequestMapping(value="/assignment/edit")
	public String edit(){
		return "/assignment/edit";
	}
	
	@RequestMapping(value="/assignment/delete")
	public String delete(){
		return "/assignment/delete";
	}
}
