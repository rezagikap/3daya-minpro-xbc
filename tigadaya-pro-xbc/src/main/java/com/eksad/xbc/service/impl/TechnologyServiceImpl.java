package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.TechnologyDao;
import com.eksad.xbc.model.TechnologyModel;
import com.eksad.xbc.service.TechnologyService;

@Service
@Transactional
public class TechnologyServiceImpl implements TechnologyService {
	
	@Autowired
	private TechnologyDao dao;

	@Override
	public List<TechnologyModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TechnologyModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TechnologyModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TechnologyModel model) {
		this.dao.insert(model);		
	}

	@Override
	public void update(TechnologyModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(TechnologyModel model) {
		this.dao.delete(model);
	}

}