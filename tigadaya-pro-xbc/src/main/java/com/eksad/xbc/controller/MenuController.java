package com.eksad.xbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.model.MenuModel;
import com.eksad.xbc.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService atik;
	
	@RequestMapping(value="/menu")
	public String index(){
		return "/menu/index";
	}
	
	@RequestMapping(value="/menu/create")
	public String create(Model atikm){
		String code = this.atik.getNewCode();
		atikm.addAttribute("KodeBaru", code);
		return "/menu/create";
	}
	
	@RequestMapping(value="/menu/edit")
	public String edit(){
		return "/menu/edit";
	}
	
	@RequestMapping(value="/menu/delete")
	public String delete(){
		return "/menu/delete";
	}
}
