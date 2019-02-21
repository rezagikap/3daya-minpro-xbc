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

import com.eksad.xbc.model.TrainerModel;
import com.eksad.xbc.service.TrainerService;

@Controller
public class ApiTrainerController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TrainerService service;
	
	
	@RequestMapping(value="/api/trainer/", method=RequestMethod.GET)
	public ResponseEntity<List<TrainerModel>> list(){
		ResponseEntity<List<TrainerModel>> result = null;
		try {
			List<TrainerModel> list = this.service.getList();
			result = new ResponseEntity<List<TrainerModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<TrainerModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/trainer/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<TrainerModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<TrainerModel>> result = null;
		try {
			List<TrainerModel> list = this.service.search(cari);
			result = new ResponseEntity<List<TrainerModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<TrainerModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/trainer/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<TrainerModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<TrainerModel> result = null;
		try {
			TrainerModel cat = this.service.getById(vId);
			result = new ResponseEntity<TrainerModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TrainerModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/trainer/", method=RequestMethod.POST)
	public ResponseEntity<TrainerModel> postInsert(@RequestBody TrainerModel item){
		ResponseEntity<TrainerModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<TrainerModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<TrainerModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/trainer/", method=RequestMethod.PUT)
	public ResponseEntity<TrainerModel> putUpdate(@RequestBody TrainerModel item){
		ResponseEntity<TrainerModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<TrainerModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<TrainerModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/trainer/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<TrainerModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<TrainerModel> result = null;
		try {
			TrainerModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<TrainerModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<TrainerModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TrainerModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}