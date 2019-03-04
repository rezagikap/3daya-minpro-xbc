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

import com.eksad.xbc.model.TechForm;
import com.eksad.xbc.model.TechTrainerModel;
import com.eksad.xbc.model.TechnologyModel;
import com.eksad.xbc.service.TechTrainerService;
import com.eksad.xbc.service.TechnologyService;

@Controller
public class ApiTechnologyController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private TechnologyService service;
	
	@Autowired
	private TechTrainerService service2;
	
	
	@RequestMapping(value="/api/technology/", method=RequestMethod.GET)
	public ResponseEntity<List<TechnologyModel>> list(){
		ResponseEntity<List<TechnologyModel>> result = null;
		try {
			List<TechnologyModel> list = this.service.getList();
			result = new ResponseEntity<List<TechnologyModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<TechnologyModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/technology/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<TechnologyModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<TechnologyModel>> result = null;
		try {
			List<TechnologyModel> list = this.service.search(cari);
			result = new ResponseEntity<List<TechnologyModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<TechnologyModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/technology/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<TechnologyModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<TechnologyModel> result = null;
		try {
			TechnologyModel cat = this.service.getById(vId);
			result = new ResponseEntity<TechnologyModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TechnologyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/techtrainer/{techId}", method = RequestMethod.GET)
	public ResponseEntity<TechTrainerModel> getByTtId(@PathVariable("techId") int vId) {
		ResponseEntity<TechTrainerModel> result = null;
		try {
			TechTrainerModel tet = this.service2.getById(vId);
			result = new ResponseEntity<TechTrainerModel>(tet,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TechTrainerModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/technology/", method=RequestMethod.POST)
	public ResponseEntity<TechForm> postInsert(@RequestBody TechForm item){
		ResponseEntity<TechForm> result = null;
		try {
			this.service.insert(item,1);
			result = new ResponseEntity<TechForm>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<TechForm>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/technology/", method=RequestMethod.PUT)
	public ResponseEntity<TechnologyModel> putUpdate(@RequestBody TechnologyModel item){
		ResponseEntity<TechnologyModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<TechnologyModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<TechnologyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
	@RequestMapping(value="/api/technology/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<TechnologyModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<TechnologyModel> result = null;
		try {
			TechnologyModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<TechnologyModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<TechnologyModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<TechnologyModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
}