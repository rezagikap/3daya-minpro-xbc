package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
	
	@RequestMapping(value = "/category")
	public String index() {
		return "menu/index";
	}
	
	@RequestMapping(value = "/category/create")
	public String create() {
		return "category/create";
	}
	
	@RequestMapping(value = "/category/edit")
	public String edit() {
		return "menu/edit";
	}
	
	@RequestMapping(value = "/category/delete")
	public String delete() {
		return "category/delete";
	}
}