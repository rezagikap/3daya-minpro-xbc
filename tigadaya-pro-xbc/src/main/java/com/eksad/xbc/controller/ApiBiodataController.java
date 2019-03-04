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

import com.eksad.xbc.model.BiodataModel;
import com.eksad.xbc.service.BiodataService;

@Controller
public class ApiBiodataController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private BiodataService service;
	
	@RequestMapping(value="/api/biodata/", method=RequestMethod.GET)
	public ResponseEntity<List<BiodataModel>> list(){
		ResponseEntity<List<BiodataModel>> result = null;
		try {
			List<BiodataModel> list = this.service.getList();
			result = new ResponseEntity<List<BiodataModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<BiodataModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/biodata/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<BiodataModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<BiodataModel>> result = null;
		try {
			List<BiodataModel> list = this.service.search(cari);
			result = new ResponseEntity<List<BiodataModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<BiodataModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<BiodataModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<BiodataModel> result = null;
		try {
			BiodataModel cat = this.service.getById(vId);
			result = new ResponseEntity<BiodataModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/", method=RequestMethod.POST)
	public ResponseEntity<BiodataModel> postInsert(@RequestBody BiodataModel item){
		ResponseEntity<BiodataModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<BiodataModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/", method=RequestMethod.PUT)
	public ResponseEntity<BiodataModel> putUpdate(@RequestBody BiodataModel item){
		ResponseEntity<BiodataModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<BiodataModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/delete/", method=RequestMethod.PUT)
	public ResponseEntity<BiodataModel> putDelete(@RequestBody BiodataModel item){
		ResponseEntity<BiodataModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<BiodataModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/biodata/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<BiodataModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<BiodataModel> result = null;
		try {
			BiodataModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<BiodataModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<BiodataModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<BiodataModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
