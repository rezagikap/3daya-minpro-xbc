package com.eksad.xbc.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eksad.xbc.model.TestModel;
import com.eksad.xbc.service.TestService;

public class ApiTestController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private TestService service;
	
	@RequestMapping(value = "/api/menu/", method = RequestMethod.GET)
	public ResponseEntity<List<TestModel>> list(){
		ResponseEntity<List<TestModel>> result = null;
		try {
			List<TestModel> list = this.service.getList();
			result = new ResponseEntity<List<TestModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<TestModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/menu/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<TestModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<TestModel>> result = null;
		try {
			List<TestModel> list = this.service.search(cari);
			result = new ResponseEntity<List<TestModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<TestModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/menu/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<TestModel> getById(@PathVariable("itemId") int vid){
		ResponseEntity<TestModel> result = null;
		try {
			TestModel cat = this.service.getById(vid);
			result = new ResponseEntity<TestModel>(cat, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/menu/", method = RequestMethod.POST)
	public ResponseEntity<TestModel> postInsert(@RequestBody TestModel item){
		ResponseEntity<TestModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<TestModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/menu/", method = RequestMethod.PUT)
	public ResponseEntity<TestModel> putUpdate(@RequestBody TestModel item){
		ResponseEntity<TestModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<TestModel>(item,HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
			return result;
		}
	
	@RequestMapping(value = "/api/menu/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<TestModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<TestModel> result = null;
		try {
			TestModel item = this.service.getById(vid);
			if (item != null) {
				this.service.delete(item);
				result = new ResponseEntity<TestModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<TestModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
			return result;
		}
	}
	

