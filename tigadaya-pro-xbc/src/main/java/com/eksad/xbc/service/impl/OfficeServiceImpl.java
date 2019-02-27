package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.OfficeDao;
import com.eksad.xbc.model.OfficeModel;
import com.eksad.xbc.service.OfficeService;

@Service
@Transactional
public class OfficeServiceImpl implements OfficeService {

	@Autowired
	private OfficeDao dao;
	
	@Override
	public List<OfficeModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<OfficeModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public OfficeModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(OfficeModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(OfficeModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(OfficeModel model) {
		this.dao.delete(model);
	}
	
}