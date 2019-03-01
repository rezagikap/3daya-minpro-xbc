package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoleController {
	@RequestMapping(value="/role") //requestmapping untuk url
	public String index() {  
		return "/role/index"; //untuk menampilkan role dari nama file index.jsp/view
	}
	@RequestMapping(value="/role/create")
	public String create() {
		return "/role/create";
	}
	@RequestMapping(value="/role/edit")
	public String edit() {
		return "/role/edit";
		
	}
	@RequestMapping(value="/role/delete")
	public String delete() {
		return "/role/delete";
	}
	@RequestMapping(value="/role/detail")
	public String detail() {
		return "/role/detail";
	}
}
