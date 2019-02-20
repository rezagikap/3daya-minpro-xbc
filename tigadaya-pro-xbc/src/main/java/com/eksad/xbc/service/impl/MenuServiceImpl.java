package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.MenuDao;
import com.eksad.xbc.model.MenuModel;
import com.eksad.xbc.service.MenuService;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao dao;
	
	@Override
	public List<MenuModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<MenuModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public MenuModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(MenuModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(MenuModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(MenuModel model) {
		this.dao.delete(model);
	}

}
