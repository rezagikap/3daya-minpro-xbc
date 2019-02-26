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

import com.eksad.xbc.model.OfficeModel;
import com.eksad.xbc.service.OfficeService;

@Controller
public class ApiOfficeController {
	private Log log = LogFactory.getLog(getClass());
	@Autowired
	private OfficeService service;

	@RequestMapping(value = "/api/office/", method = RequestMethod.GET)
	public ResponseEntity<List<OfficeModel>> list() {
		ResponseEntity<List<OfficeModel>> result = null;
		try {
			List<OfficeModel> list = this.service.getList();
			result = new ResponseEntity<List<OfficeModel>>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<List<OfficeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/office/search/{katakunci}", method = RequestMethod.GET)
	public ResponseEntity<List<OfficeModel>> search(@PathVariable("katakunci") String cari) {
		ResponseEntity<List<OfficeModel>> result = null;
		try {
			List<OfficeModel> list = this.service.search(cari);
			result = new ResponseEntity<List<OfficeModel>>(list, HttpStatus.OK);
		} catch (Exception err) {
			log.debug(err.getMessage(), err);
			result = new ResponseEntity<List<OfficeModel>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/office/{itemId}", method = RequestMethod.GET)
	public ResponseEntity<OfficeModel> getById(@PathVariable("itemId") int vId) {
		ResponseEntity<OfficeModel> result = null;
		try {
			OfficeModel cat = this.service.getById(vId);
			result = new ResponseEntity<OfficeModel>(cat, HttpStatus.OK);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<OfficeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/office/", method = RequestMethod.POST)
	public ResponseEntity<OfficeModel> postInsert(@RequestBody OfficeModel item) {
		ResponseEntity<OfficeModel> result = null;
		try {
			this.service.insert(item);
			result = new ResponseEntity<OfficeModel>(item, HttpStatus.CREATED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<OfficeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/office/", method = RequestMethod.PUT)
	public ResponseEntity<OfficeModel> putUpdate(@RequestBody OfficeModel item) {
		ResponseEntity<OfficeModel> result = null;
		try {
			this.service.update(item);
			result = new ResponseEntity<OfficeModel>(item, HttpStatus.ACCEPTED);
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<OfficeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}

	@RequestMapping(value = "/api/office/{itemId}", method = RequestMethod.DELETE)
	public ResponseEntity<OfficeModel> delApi(@PathVariable("itemId") Integer vid) {
		ResponseEntity<OfficeModel> result = null;
		try {
			OfficeModel item = this.service.getById(vid);
			if (item != null) {
				this.service.delete(item);
				result = new ResponseEntity<OfficeModel>(item, HttpStatus.ACCEPTED);
			} else {
				result = new ResponseEntity<OfficeModel>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			log.debug(e.getMessage(), e);
			result = new ResponseEntity<OfficeModel>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}