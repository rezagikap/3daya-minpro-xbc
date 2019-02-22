package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassController {
  
	@RequestMapping(value="/class")
	public String index() {
		return "/class/index";
	}
	
	@RequestMapping(value="/class/create")
	public String create() {
		return "/class/create";
	}
	
	@RequestMapping(value="/class/edit")
	public String edit() {
		return "/class/delete";
	}
	
	@RequestMapping(value="/class/delete")
	public String delete() {
		return "/class/delete";
	}
	
}
