package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BootcampTestTypeController {
	
	@RequestMapping(value="/bootcamptesttype")
	public String index() {
		return "/bootcamptesttype/index";
	}
	
	// digunakan untuk URL nya
	// menampilkan bootcamptesttype create.jsp
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