package com.eksad.xbc.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.xbc.model.MenuModel;
import com.eksad.xbc.service.MenuService;

@Controller
public class ApiMenuController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private MenuService service;
	
	@RequestMapping(value="/api/menu/", method=RequestMethod.GET)
	public ResponseEntity<List<MenuModel>> list(){
		ResponseEntity<List<MenuModel>> result = null;
		try {
			List<MenuModel> list = this.service.getList();
			result = new ResponseEntity<List<MenuModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<MenuModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/menu/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<MenuModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<MenuModel>> result = null;
		try {
			List<MenuModel> list = this.service.search(cari);
			result = new ResponseEntity<List<MenuModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<MenuModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<MenuModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<MenuModel> result = null;
		try {
			MenuModel cat = this.service.getById(vId);
			result = new ResponseEntity<MenuModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<MenuModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu/", method=RequestMethod.POST)
	public ResponseEntity<MenuModel> postInsert(@RequestBody MenuModel item){
		ResponseEntity<MenuModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<MenuModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<MenuModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu/", method=RequestMethod.PUT)
	public ResponseEntity<MenuModel> putUpdate(@RequestBody MenuModel item){
		ResponseEntity<MenuModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<MenuModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<MenuModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/menu/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<MenuModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<MenuModel> result = null;
		try {
			MenuModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<MenuModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<MenuModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<MenuModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
