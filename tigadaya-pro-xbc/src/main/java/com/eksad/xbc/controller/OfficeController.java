package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OfficeController {

	@RequestMapping(value="/office")
	public String index(){
		return "/office/index";
	}
	
	@RequestMapping(value="/office/create")
	public String create(){
		return "/office/create";
	}
	
	@RequestMapping(value="/office/edit")
	public String edit(){
		return "/office/edit";
	}
	
	@RequestMapping(value="/office/delete")
	public String delete(){
		return "/office/delete";
	}
	
}
