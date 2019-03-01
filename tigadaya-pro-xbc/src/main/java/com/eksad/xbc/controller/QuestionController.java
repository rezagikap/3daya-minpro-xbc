package com.eksad.xbc.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller

public class QuestionController {
	
	@RequestMapping(value="/question")
	public String index() {
		return"/Question/index";
	}
	
	@RequestMapping(value="/question/create")
	public String create() {
		return"/question/create";
	}
	
	@RequestMapping(value="/question/edit")
	public String edit() {
		return"/question/edit";
	}
	@RequestMapping(value="/question/delete")
	public String delete() {
		return"/question/delete";
	}
	@RequestMapping(value="/question/detail")
	public String detail() {
		return"/question/detail";
	}
}
