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

import com.eksad.xbc.model.ClassModel;
import com.eksad.xbc.service.ClassService;

@Controller
public class ApiClassController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private ClassService service;

	@RequestMapping(value = "/api/class/", method = RequestMethod.GET)
	public ResponseEntity<List<ClassModel>> list() {
		ResponseEntity<List<ClassModel>> result = null;
		try {
			List<ClassModel> list = this.service.getList();
			result = new ResponseEntity<List<ClassModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<ClassModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/class/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<ClassModel>> search(@PathVariable("katakunci") String cari) {
		ResponseEntity<List<ClassModel>> result = null;
		try {
			List<ClassModel> list = this.service.search(cari);
			result = new ResponseEntity<List<ClassModel>>(list, HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(), err);
			result = new ResponseEntity<List<ClassModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/class/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<ClassModel> getById(@PathVariable("itemId") int vId) {
		ResponseEntity<ClassModel> result = null;
		try {
			ClassModel cat = this.service.getById(vId);
			result = new ResponseEntity<ClassModel>(cat, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClassModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/class/", method = RequestMethod.POST)
	public ResponseEntity<ClassModel> postInsert(@RequestBody ClassModel item) {
		ResponseEntity<ClassModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<ClassModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClassModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/class/", method = RequestMethod.PUT)
	public ResponseEntity<ClassModel> putUpdate(@RequestBody ClassModel item) {
		ResponseEntity<ClassModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<ClassModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClassModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/class/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<ClassModel> delApi(@PathVariable("itemId") Integer vid) {
		ResponseEntity<ClassModel> result = null;
		try {
			ClassModel item = this.service.getById(vid);
			if (item != null) {
				this.service.delete(item);
				result = new ResponseEntity<ClassModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<ClassModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<ClassModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}