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

import com.eksad.xbc.model.QuestionModel;
import com.eksad.xbc.service.QuestionService;

@Controller
public class ApiQuestionController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private QuestionService service;
	
	@RequestMapping(value="/api/question/", method=RequestMethod.GET) // request body berfungsi menangkap data di kirim ke data base yang di kirimkan viek 
	public ResponseEntity<List<QuestionModel>> list(){
		ResponseEntity<List<QuestionModel>> result = null;
		try {
			List<QuestionModel> list = this.service.getList();
			result = new ResponseEntity<List<QuestionModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<List<QuestionModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}		
		return result;
	}
	
	@RequestMapping(value="/api/question/search/{katakunci}",method=RequestMethod.GET)
	public ResponseEntity<List<QuestionModel>> search(@PathVariable("katakunci") String cari){
		ResponseEntity<List<QuestionModel>> result = null;
		try {
			List<QuestionModel> list = this.service.search(cari);
			result = new ResponseEntity<List<QuestionModel>>(list,HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(),err);
			result = new ResponseEntity<List<QuestionModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/question/{itemId}",method=RequestMethod.GET)
	public ResponseEntity<QuestionModel> getById(@PathVariable("itemId") int vId){
		ResponseEntity<QuestionModel> result = null;
		try {
			QuestionModel cat = this.service.getById(vId);
			result = new ResponseEntity<QuestionModel>(cat,HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<QuestionModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/question/", method=RequestMethod.POST)
	public ResponseEntity<QuestionModel> postInsert(@RequestBody QuestionModel item){
		ResponseEntity<QuestionModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<QuestionModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<QuestionModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/question/", method=RequestMethod.PUT)
	public ResponseEntity<QuestionModel> putUpdate(@RequestBody QuestionModel item){
		ResponseEntity<QuestionModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<QuestionModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<QuestionModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/question/{itemId}", method=RequestMethod.DELETE)
	public ResponseEntity<QuestionModel> delApi(@PathVariable("itemId") Integer vid){
		ResponseEntity<QuestionModel> result = null;
		try {
			QuestionModel item = this.service.getById(vid);
			if(item != null){
				this.service.delete(item);
				result = new ResponseEntity<QuestionModel>(item,HttpStatus.ACCEPTED);
			}else {
				result = new ResponseEntity<QuestionModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<QuestionModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	@RequestMapping(value="/api/question/delete/", method=RequestMethod.PUT)
	public ResponseEntity<QuestionModel> deleteUpdate(@RequestBody QuestionModel item){
		ResponseEntity<QuestionModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<QuestionModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(),e);
			result = new ResponseEntity<QuestionModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
}
