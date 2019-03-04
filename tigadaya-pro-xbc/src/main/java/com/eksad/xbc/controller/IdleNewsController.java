package com.eksad.xbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class IdleNewsController {
	
	
	@RequestMapping(value="/idle-news")
	public String index() {
		return "/idle-news/index";
	}
	@RequestMapping(value="/idle-news/create")
	public String create() {
		return "/idle-news/create";
	}
	@RequestMapping(value="/idle-news/edit")
	public String edit() {
		return "/idle-news/edit";
		
	}
	@RequestMapping(value="/idle-news/detail")
	public String detail() {
		return "idle-news/detail";
	}
	@RequestMapping(value="/idle-news/delete")
	public String delete() {
		return "/idle-news/delete";
	}
	
}
