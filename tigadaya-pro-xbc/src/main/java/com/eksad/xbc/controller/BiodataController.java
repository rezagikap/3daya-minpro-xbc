package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BiodataController {

	@RequestMapping(value="/biodata")
	public String index(){
		return "/biodata/index";
	}
	
	@RequestMapping(value="/biodata/create")
	public String create(){
		return "/biodata/create";
	}
	
	@RequestMapping(value="/biodata/edit")
	public String edit(){
		return "/biodata/edit";
	}
	
	@RequestMapping(value="/biodata/delete")
	public String delete(){
		return "/biodata/delete";
	}
}
