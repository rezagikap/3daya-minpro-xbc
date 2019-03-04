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

import com.eksad.xbc.model.BootcampTypeModel;
import com.eksad.xbc.service.BootcampTypeService;

@Controller
public class ApiBootcampTypeController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BootcampTypeService service;
	
	
	@RequestMapping(value="/api/bootcamptype/", method=RequestMethod.GET)
	public ResponseEntity<List<BootcampTypeModel>> list(){
		ResponseEntity<List<BootcampTypeModel>> result = null;
		try {
			List<BootcampTypeModel> list = this.service.getList();
			result = new ResponseEntity<List<BootcampTypeModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<BootcampTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/bootcamptype/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<BootcampTypeModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<BootcampTypeModel>> result = null;
		try {
			List<BootcampTypeModel> list = this.service.search(cari);
			result = new ResponseEntity<List<BootcampTypeModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<BootcampTypeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/bootcamptype/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<BootcampTypeModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<BootcampTypeModel> result = null;
		try {
			BootcampTypeModel cat = this.service.getById(vId);
			result = new ResponseEntity<BootcampTypeModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BootcampTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/bootcamptype/", method=RequestMethod.POST)
	public ResponseEntity<BootcampTypeModel> postInsert(@RequestBody BootcampTypeModel item){
		ResponseEntity<BootcampTypeModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<BootcampTypeModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<BootcampTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/bootcamptype/", method=RequestMethod.PUT)
	public ResponseEntity<BootcampTypeModel> putUpdate(@RequestBody BootcampTypeModel item){
		ResponseEntity<BootcampTypeModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<BootcampTypeModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<BootcampTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/bootcamptype/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<BootcampTypeModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<BootcampTypeModel> result = null;
		try {
			BootcampTypeModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<BootcampTypeModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<BootcampTypeModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BootcampTypeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}