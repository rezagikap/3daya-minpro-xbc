package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.ClassDao;
import com.eksad.xbc.model.ClassModel;
import com.eksad.xbc.service.ClassService;

@Service
@Transactional
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDao dao;
	
	@Override
	public List<ClassModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<ClassModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public ClassModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(ClassModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(ClassModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(ClassModel model) {
		this.dao.delete(model);
	}
	
}