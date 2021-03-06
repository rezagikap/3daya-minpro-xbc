package com.eksad.xbc.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.service.TechnologyService;

@Controller
public class TechnologyController extends BaseController{
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TechnologyService service;
	
	@RequestMapping(value="/technology")
	public String index(Model model) {
		model.addAttribute("username", this.getUserName());
		model.addAttribute("userid", this.getUserId());
		return "/technology/index";
	}
	
<<<<<<< HEAD
=======

	//url yang ada di create.jsp
>>>>>>> 1d5f2298255ce79c69ddc7048840a352f0467546
	@RequestMapping(value="/technology/create")
	public String create(){
		return "/technology/create";
	}
	
	@RequestMapping(value="/technology/edit")
	public String edit() {
		return "/technology/edit";
	}
	
	@RequestMapping(value="/technology/delete")
	public String delete() {
		return "/technology/delete";
	}
	
	@RequestMapping(value="/technology/detail")
	public String detail() {
		return "/technology/detail";
	}
	
	@RequestMapping(value="/technology/trainer")
	public String addTt() {
		return"/technology/trainer";
	}
}