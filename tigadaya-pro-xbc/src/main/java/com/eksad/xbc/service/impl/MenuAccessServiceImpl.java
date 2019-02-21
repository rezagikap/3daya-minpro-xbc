package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.MenuAccessDao;
import com.eksad.xbc.model.MenuAccessModel;
import com.eksad.xbc.service.MenuAccessService;

@Service
@Transactional
public class MenuAccessServiceImpl implements MenuAccessService {

	@Autowired
	private MenuAccessDao dao;
	
	@Override
	public List<MenuAccessModel> getList() {
		return this.dao.getList();
	}

	@Override
	public MenuAccessModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(MenuAccessModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(MenuAccessModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(MenuAccessModel model) {
		this.dao.delete(model);
	}

}
