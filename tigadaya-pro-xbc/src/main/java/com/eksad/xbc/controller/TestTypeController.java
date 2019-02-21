package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestTypeController {
	@RequestMapping(value = "/testtype")
	public String index() {
		return "/testtype/index";
	}

	@RequestMapping(value="/testtype/create")
	public String create() {
		return "/testtype/create";
	}
	@RequestMapping(value = "/testtype/edit")
	public String edit() {
		return "/testtype/edit";
	}

	@RequestMapping(value = "/testtypedelete")
	public String delete() {
		return "/testtype/delete";
	}
	

}
