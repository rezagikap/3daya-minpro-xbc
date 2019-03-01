package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.QuestionDao;
import com.eksad.xbc.model.QuestionModel;
import com.eksad.xbc.service.QuestionService;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDao dao;
	
	@Override
	public List<QuestionModel> getList() {
		
		return this.dao.getList();
	}

	
	@Override
	public QuestionModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(QuestionModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(QuestionModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(QuestionModel model) {
	this.dao.delete(model);

	}


	@Override
	public List<QuestionModel> search(String key) {
		return this.dao.search(key);
	}

}
