package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	@RequestMapping(value = "/menu")
	public String index() {
		return "/menu/index";
	}

	@RequestMapping(value="/menu/create")
	public String create() {
		return "/menu/create";
	}
	@RequestMapping(value = "/menu/edit")
	public String edit() {
		return "/menu/edit";
	}

	@RequestMapping(value = "/menu/delete")
	public String delete() {
		return "/menu/delete";
	}

	@RequestMapping(value = "/menu/detail")
	public String detail() {
		return "/menu/detail";
	}
}
