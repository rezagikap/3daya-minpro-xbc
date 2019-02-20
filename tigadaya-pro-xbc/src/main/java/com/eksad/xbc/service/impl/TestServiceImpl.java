package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.TestDao;
import com.eksad.xbc.model.TestModel;
import com.eksad.xbc.service.TestService;

@Service
@Transactional
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestDao dao;
	
	@Override
	public List<TestModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TestModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TestModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TestModel model) {
		this.dao.insert(model);
		
	}

	@Override
	public void update(TestModel model) {
		this.dao.update(model);
		
	}

	@Override
	public void delete(TestModel model) {
		this.dao.delete(model);
		
	}

}
