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

import com.eksad.xbc.model.IdleMonitoringModel;
import com.eksad.xbc.service.IdleMonitoringService;

@Controller
public class ApiIdleMonitoringController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private IdleMonitoringService service;
	
	@RequestMapping(value="/api/idlemonitoring/", method=RequestMethod.GET)
	public ResponseEntity<List<IdleMonitoringModel>> list(){
		ResponseEntity<List<IdleMonitoringModel>> result = null;
		try {
			List<IdleMonitoringModel> list = this.service.getList();
			result = new ResponseEntity<List<IdleMonitoringModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<IdleMonitoringModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/idlemonitoring/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<IdleMonitoringModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<IdleMonitoringModel>> result = null;
		try {
			List<IdleMonitoringModel> list = this.service.search(cari);
			result = new ResponseEntity<List<IdleMonitoringModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<IdleMonitoringModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/idlemonitoring/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<IdleMonitoringModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<IdleMonitoringModel> result = null;
		try {
			IdleMonitoringModel cat = this.service.getById(vId);
			result = new ResponseEntity<IdleMonitoringModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleMonitoringModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/idlemonitoring/", method=RequestMethod.POST)
	public ResponseEntity<IdleMonitoringModel> postInsert(@RequestBody IdleMonitoringModel item){
		ResponseEntity<IdleMonitoringModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<IdleMonitoringModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<IdleMonitoringModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/idlemonitoring/", method=RequestMethod.PUT)
	public ResponseEntity<IdleMonitoringModel> putUpdate(@RequestBody IdleMonitoringModel item){
		ResponseEntity<IdleMonitoringModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<IdleMonitoringModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<IdleMonitoringModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/idlemonitoring/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<IdleMonitoringModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<IdleMonitoringModel> result = null;
		try {
			IdleMonitoringModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<IdleMonitoringModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<IdleMonitoringModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<IdleMonitoringModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
