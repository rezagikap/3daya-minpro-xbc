package com.eksad.xbc.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.xbc.service.IdleMonitoringService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IdleMonitoringController {

		@RequestMapping(value="/idlemonitoring")
		public String index(){
			return "/idlemonitoring/index";
		}
		
		@RequestMapping(value="/idlemonitoring/create")
		public String create(){
			return "/idlemonitoring/create";
		}
		
		@RequestMapping(value="/idlemonitoring/edit")
		public String edit(){
			return "/idlemonitoring/edit";
		}
		
		@RequestMapping(value="/idlemonitoring/delete")
		public String delete(){
			return "/idlemonitoring/delete";
		}
		
		@RequestMapping(value="/idlemonitoring/placement")
		public String placement(){
			return "/idlemonitoring/placement";
		}
		
	}
