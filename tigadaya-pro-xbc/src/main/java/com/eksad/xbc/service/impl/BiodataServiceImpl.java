package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.BiodataDao;
import com.eksad.xbc.model.BiodataModel;
import com.eksad.xbc.service.BiodataService;

@Service
@Transactional
public class BiodataServiceImpl implements BiodataService {
	
	@Autowired
	private BiodataDao dao;
	
	@Override
	public List<BiodataModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<BiodataModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public BiodataModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(BiodataModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(BiodataModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(BiodataModel model) {
		this.dao.delete(model);
	}

}
