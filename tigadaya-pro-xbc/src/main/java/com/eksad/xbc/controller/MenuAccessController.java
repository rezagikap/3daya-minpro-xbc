package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuAccessController {
	@RequestMapping(value="/menu-access")
	public String index(){
		return "/menu-access/index";
	}
	
	@RequestMapping(value="/menu-access/create")
	public String create(){
		return "/menu-access/create";
	}
	
	@RequestMapping(value="/menu-access/edit")
	public String edit(){
		return "/menu-access/edit";
	}
	
	@RequestMapping(value="/menu-access/delete")
	public String delete(){
		return "/menu-access/delete";
	}
}
