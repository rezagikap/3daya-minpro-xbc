package com.eksad.xbc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.model.MenuModel;
import com.eksad.xbc.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	private MenuService service;
	
	@RequestMapping(value="/menu")
	public String index(){
		return "/menu/index";
	}
	
	@RequestMapping(value="/menu/list")
	public String list(Model model){
		model.addAttribute("mp", this.service.getList());
		return "/menu/list";
	}

	@RequestMapping(value="/menu/list/{kode}")
	public String getbyid(Model model, @PathVariable("kode") Integer kode){
		model.addAttribute("get", this.service.getById(kode));
		return "/menu/list";
	}
	
	@RequestMapping(value="/menu/search/{cari}")
	public String search(Model model, @PathVariable("cari") String cari){
		model.addAttribute("mp", this.service.search(cari));
		return "/menu/list";
	}
	
	@RequestMapping(value="/menu/create")
	public String create(Model atikm){
		String code = this.service.getNewCode();
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
