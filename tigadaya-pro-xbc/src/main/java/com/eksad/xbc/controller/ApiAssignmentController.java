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

import com.eksad.xbc.model.AssignmentModel;
import com.eksad.xbc.service.AssignmentService;

@Controller
public class ApiAssignmentController {

	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private AssignmentService service;
	
	@RequestMapping(value="/api/assignment/", method=RequestMethod.GET)
	public ResponseEntity<List<AssignmentModel>> list(){
		ResponseEntity<List<AssignmentModel>> result = null;
		try {
			List<AssignmentModel> list = this.service.getList();
			result = new ResponseEntity<List<AssignmentModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<AssignmentModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/assignment/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<AssignmentModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<AssignmentModel>> result = null;
		try {
			List<AssignmentModel> list = this.service.search(cari);
			result = new ResponseEntity<List<AssignmentModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<AssignmentModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/assignment/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<AssignmentModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<AssignmentModel> result = null;
		try {
			AssignmentModel cat = this.service.getById(vId);
			result = new ResponseEntity<AssignmentModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<AssignmentModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/assignment/", method=RequestMethod.POST)
	public ResponseEntity<AssignmentModel> postInsert(@RequestBody AssignmentModel item){
		ResponseEntity<AssignmentModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<AssignmentModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<AssignmentModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/assignment/", method=RequestMethod.PUT)
	public ResponseEntity<AssignmentModel> putUpdate(@RequestBody AssignmentModel item){
		ResponseEntity<AssignmentModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<AssignmentModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<AssignmentModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/assignment/delete/", method=RequestMethod.PUT)
	public ResponseEntity<AssignmentModel> putDelete(@RequestBody AssignmentModel item){
		ResponseEntity<AssignmentModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<AssignmentModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<AssignmentModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/assignment/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<AssignmentModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<AssignmentModel> result = null;
		try {
			AssignmentModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<AssignmentModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<AssignmentModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<AssignmentModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
}
