package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BatchController {
	
	@RequestMapping(value = "/batch")
	public String index() {
		return "/batch/index";
	}
	
	@RequestMapping(value = "/batch/create")
	public String create() {
		return "/batch/create";
	}
	
	@RequestMapping(value = "/batch/edit")
	public String edit() {
		return "/batch/edit";	
	}
	
	@RequestMapping(value = "/batch/participant")
	public String participant() {
		return "/batch/participant";
	}
	
	@RequestMapping(value = "/batch/setup")
	public String setup() {
		return "/batch/setup";
	}
}