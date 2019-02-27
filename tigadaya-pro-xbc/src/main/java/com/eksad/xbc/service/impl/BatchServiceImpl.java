package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.BatchDao;
import com.eksad.xbc.model.BatchModel;
import com.eksad.xbc.service.BatchService;

@Service
@Transactional
public class BatchServiceImpl implements BatchService {

	@Autowired
	private BatchDao dao;
	
	@Override
	public List<BatchModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<BatchModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public BatchModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(BatchModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(BatchModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(BatchModel model) {
		this.dao.delete(model);

	}

}