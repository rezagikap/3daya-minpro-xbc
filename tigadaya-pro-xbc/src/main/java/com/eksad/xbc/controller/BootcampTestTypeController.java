package com.eksad.xbc.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eksad.xbc.service.BootcampTestTypeService;

@Controller
public class BootcampTestTypeController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BootcampTestTypeService service;
	
	@RequestMapping(value="/bootcamptesttype")
	public String index() {
		return "/bootcamptesttype/index";
	}
	
	@RequestMapping(value="/bootcamptesttype/detail")
	public String detail(){
		return "/bootcamptesttype/detail";
	}
	
	@RequestMapping(value="/bootcamptesttype/create")
	public String create(){
		return "/bootcamptesttype/create";
	}
	
	@RequestMapping(value="/bootcamptesttype/edit")
	public String edit(){
		return "/bootcamptesttype/edit";
	}
	
	@RequestMapping(value="/bootcamptesttype/delete")
	public String delete(){
		return "/bootcamptesttype/delete";
	}
}