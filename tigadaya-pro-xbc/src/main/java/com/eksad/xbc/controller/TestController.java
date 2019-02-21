package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping(value = "/test")
	public String index() {
		return "/test/index";
	}

	@RequestMapping(value="/test/create")
	public String create() {
		return "/test/create";
	}
	@RequestMapping(value = "/test/edit")
	public String edit() {
		return "/test/edit";
	}

	@RequestMapping(value = "/test/delete")
	public String delete() {
		return "/test/delete";
	}
}
