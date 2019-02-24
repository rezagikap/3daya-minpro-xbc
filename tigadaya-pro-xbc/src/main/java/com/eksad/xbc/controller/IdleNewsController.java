package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class IdleNewsController {
	
	
	@RequestMapping(value="/idlenews")
	public String index() {
		return "/idle-news/index";
	}
	@RequestMapping(value="/idlenews/create")
	public String create() {
		return "/idle-news/create";
	}
	@RequestMapping(value="/idlenews/edit")
	public String edit() {
		return "/idlenews/edit";
		
	}
	@RequestMapping(value="/idlenews/detail")
	public String detail() {
		return "idle-news/detail";
	}
	@RequestMapping(value="/idlenews/delete")
	public String delete() {
		return "/idlenews/delete";
	}
	
}
