package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.IdleNewsDao;
import com.eksad.xbc.model.IdleNewsModel;
import com.eksad.xbc.service.IdleNewsService;

@Service
@Transactional

public class IdleNewsServiceImpl implements IdleNewsService {
	@Autowired
	private IdleNewsDao dao;
	
	@Override
	public List<IdleNewsModel> getList() {
		return this.dao.getList();
			}

	@Override
	public IdleNewsModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(IdleNewsModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(IdleNewsModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(IdleNewsModel model) {
		this.dao.delete(model);

	}

	@Override
	public List<IdleNewsModel> search(String key) {
		return this.dao.search(key);
	}

}
