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

import com.eksad.xbc.model.TestTypeModel;
import com.eksad.xbc.service.TestTypeService;

@Controller
public class ApiTestTypeController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private TestTypeService service;
	
	@RequestMapping(value = "/api/testtype/", method = RequestMethod.GET)
	public ResponseEntity<List<TestTypeModel>> list(){
		ResponseEntity<List<TestTypeModel>> result = null;
		try {
			List<TestTypeModel> list = this.service.getList();
			result = new ResponseEntity<List<TestTypeModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<TestTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/testtype/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<TestTypeModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<TestTypeModel>> result = null;
		try {
			List<TestTypeModel> list = this.service.search(cari);
			result = new ResponseEntity<List<TestTypeModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<TestTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/testtype/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<TestTypeModel> getById(@PathVariable("itemId") int vid){
		ResponseEntity<TestTypeModel> result = null;
		try {
			TestTypeModel cat = this.service.getById(vid);
			result = new ResponseEntity<TestTypeModel>(cat, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/testtype/", method = RequestMethod.POST)
	public ResponseEntity<TestTypeModel> postInsert(@RequestBody TestTypeModel item){
		ResponseEntity<TestTypeModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<TestTypeModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/testtype/", method = RequestMethod.PUT)
	public ResponseEntity<TestTypeModel> putUpdate(@RequestBody TestTypeModel item){
		ResponseEntity<TestTypeModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<TestTypeModel>(item,HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TestTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
			return result;
		}
	
//	@RequestMapping(value = "/api/testtype/{itemId}", method = RequestMethod.DELETE)
//	public ResponseEntity<TestTypeModel> delApi(@PathVariable("itemId") Integer vid){
//		ResponseEntity<TestTypeModel> result = null;
//		try {
//			TestTypeModel item = this.service.getById(vid);
//			if (item != null) {
//				this.service.delete(item);
//				result = new ResponseEntity<TestTypeModel>(item, HttpStatus.ACCEPTED);
//			} else {
//				result = new ResponseEntity<TestTypeModel>(HttpStatus.NO_CONTENT);
//			}
//		} catch (Exception e) {
//			log.debug(e.getMessage(), e);
//			result = new ResponseEntity<TestTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}		
//			return result;
//		}
	}
	

