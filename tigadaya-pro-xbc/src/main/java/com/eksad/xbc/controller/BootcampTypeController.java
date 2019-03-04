package com.eksad.xbc.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.service.BootcampTypeService;

@Controller
public class BootcampTypeController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BootcampTypeService service;
	
	@RequestMapping(value="/bootcamptype")
	public String index() {
		return "/bootcamptype/index";
	}
	
	@RequestMapping(value="/bootcamptype/create")
	public String create(){
		return "/bootcamptype/create";
	}
	
	@RequestMapping(value="/bootcamptype/edit")
	public String edit() {
		return "/bootcamptype/edit";
	}
	
	@RequestMapping(value="/bootcamptype/delete")
	public String delete() {
		return "/bootcamptype/delete";
	}
}