package com.eksad.xbc.controller;

import org.apache.commons.logging.LogFactory;
import org.hibernate.annotations.common.util.impl.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
private Log log = (Log) LogFactory.getLog(getClass());
	
 @RequestMapping(value="/user")
 public String index() {
	 return"/user/index";
 }
 
 @RequestMapping(value="/user/create")
 public String create() {
	 return"/user/create";
 }
 
 @RequestMapping(value="/user/edit")
 public String edit() {
	 return"/user/edit";
 }
 
 @RequestMapping(value="/user/delete")
 public String delete() {
	 return"/user/delete";
 }
 
 @RequestMapping(value="/user/delete")
 public String deteail() {
	 return"/user/detail";
 }
 
 
}
