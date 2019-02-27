package com.eksad.xbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.model.CategoryModel;
import com.eksad.xbc.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired
	private CategoryService atik;
	
	@RequestMapping(value = "/category")
	public String index() {
		return "category/index";
	}
	
	@RequestMapping(value = "/category/create")
	public String create(Model atikm) {
		String code = this.atik.getNewCode(); 
		 atikm.addAttribute("KodeBaru",code);
		return "category/create";
		
	}
	
	@RequestMapping(value = "/category/edit")
	public String edit() {
		return "category/edit";
	}
	
	@RequestMapping(value = "/category/delete")
	public String delete() {
		return "category/delete";
	}
	
	
}