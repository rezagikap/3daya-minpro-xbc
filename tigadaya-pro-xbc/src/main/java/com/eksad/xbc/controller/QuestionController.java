package com.eksad.xbc.controller;

<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class QuestionController {

	@RequestMapping(value="/menu")
	public String index(){
		return "/menu/index";
	}
	
	@RequestMapping(value="/menu/create")
	public String create(){
		return "/menu/create";
	}
	
	@RequestMapping(value="/menu/edit")
	public String edit(){
		return "/menu/edit";
	}
	
	@RequestMapping(value="/menu/delete")
	public String delete(){
		return "/menu/delete";
=======
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
>>>>>>> a929f0c6df1cff5f685ff04a2c6ef5ada45d3561
	}
}
