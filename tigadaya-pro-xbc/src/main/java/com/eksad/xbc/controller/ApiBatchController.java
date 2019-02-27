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

import com.eksad.xbc.model.BatchModel;
import com.eksad.xbc.service.BatchService;

@Controller
public class ApiBatchController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private BatchService service;
	
	@RequestMapping(value="/api/batch/", method=RequestMethod.GET)
	public ResponseEntity<List<BatchModel>> list(){
		ResponseEntity<List<BatchModel>> result = null;
		try {
			List<BatchModel> list = this.service.getList();
			result = new ResponseEntity<List<BatchModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<BatchModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value = "/api/batch/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<BatchModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<BatchModel>> result = null;
		try {
			List<BatchModel> list = this.service.search(cari);
			result = new ResponseEntity<List<BatchModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<BatchModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/batch/{batchId}", method = RequestMethod.GET)
	public ResponseEntity<BatchModel> getById(@PathVariable("batchId") int vId) {
		ResponseEntity<BatchModel> result = null;
		try {
			BatchModel batch = this.service.getById(vId);
			result = new ResponseEntity<BatchModel>(batch, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BatchModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/batch", method = RequestMethod.POST)
	public ResponseEntity<BatchModel> postInsert(@RequestBody BatchModel item){
		ResponseEntity<BatchModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<BatchModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BatchModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value = "/api/batch/", method = RequestMethod.PUT)
	public ResponseEntity<BatchModel> putUpdate(@RequestBody BatchModel item){
		ResponseEntity<BatchModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<BatchModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BatchModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
}