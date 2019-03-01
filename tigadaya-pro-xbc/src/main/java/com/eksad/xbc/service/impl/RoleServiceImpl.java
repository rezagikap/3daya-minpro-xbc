package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.RoleDao;
import com.eksad.xbc.model.RoleModel;
import com.eksad.xbc.service.RoleService;


@Service
@Transactional
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao dao;
	
	@Override
	public List<RoleModel> getList() {
		return this.dao.getList();
	}

	
	@Override
	public RoleModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(RoleModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(RoleModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(RoleModel model) {
		this.dao.delete(model);
	}

	@Override
	public List<RoleModel> search(String key) {
		return this.dao.search(key);
	}

}
