package com.eksad.xbc.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.xbc.model.MenuAccessModel;
import com.eksad.xbc.service.MenuAccessService;

@Controller
public class ApiMenuAccessController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private MenuAccessService service;
	
	@RequestMapping(value="/api/menu-access/", method=RequestMethod.GET)
	public ResponseEntity<List<MenuAccessModel>> list(){
		ResponseEntity<List<MenuAccessModel>> result = null;
		try {
			List<MenuAccessModel> list = this.service.getList();
			result = new ResponseEntity<List<MenuAccessModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<MenuAccessModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/menu-access/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<MenuAccessModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<MenuAccessModel> result = null;
		try {
			MenuAccessModel cat = this.service.getById(vId);
			result = new ResponseEntity<MenuAccessModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<MenuAccessModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu-access/", method=RequestMethod.POST)
	public ResponseEntity<MenuAccessModel> postInsert(@RequestBody MenuAccessModel item){
		ResponseEntity<MenuAccessModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<MenuAccessModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<MenuAccessModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu-access/", method=RequestMethod.PUT)
	public ResponseEntity<MenuAccessModel> putUpdate(@RequestBody MenuAccessModel item){
		ResponseEntity<MenuAccessModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<MenuAccessModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<MenuAccessModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu-access/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<MenuAccessModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<MenuAccessModel> result = null;
		try {
			MenuAccessModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<MenuAccessModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<MenuAccessModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<MenuAccessModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
