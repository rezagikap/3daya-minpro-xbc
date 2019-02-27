package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.TechTrainerDao;
import com.eksad.xbc.model.TechTrainerModel;
import com.eksad.xbc.service.TechTrainerService;

@Service
@Transactional
public class TechTrainerServiceImpl implements TechTrainerService {

	@Autowired
	private TechTrainerDao dao;
	
	@Override
	public List<TechTrainerModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TechTrainerModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TechTrainerModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TechTrainerModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(TechTrainerModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(TechTrainerModel model) {
		this.dao.delete(model);

	}

}