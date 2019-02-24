package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestimonyController {
	@RequestMapping(value="/testimony")
	public String index() {
		return "/testimony/index";
		
	}
	@RequestMapping(value="/testimony/create")
	public String create() {
		return "/testimony/create";
		
	}
	@RequestMapping(value="/testimony/edit")
	public String edit() {
		return "/testimony/edit";
		
	}
	@RequestMapping(value="/testimony/detail")
	public String detail() {
		return "/testimony/detail";
		
	}
	@RequestMapping(value="/testimony/delete")
	public String delete() {
		return "/testimony/delete";
		
	}
}
