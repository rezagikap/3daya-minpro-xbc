package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.BootcampTestTypeDao;
import com.eksad.xbc.model.BootcampTestTypeModel;
import com.eksad.xbc.service.BootcampTestTypeService;

@Service
@Transactional
public class BootcampTestTypeServiceImpl implements BootcampTestTypeService {
	@Autowired
	private BootcampTestTypeDao dao;
		
	@Override
	public List<BootcampTestTypeModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<BootcampTestTypeModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public BootcampTestTypeModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(BootcampTestTypeModel model) {
		this.dao.insert(model);
		
	}

	@Override
	public void update(BootcampTestTypeModel model) {
		this.dao.update(model);
		
	}

	@Override
	public void delete(BootcampTestTypeModel model) {
		this.dao.delete(model);
		
	}

}
