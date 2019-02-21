package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.MenuAccessModel;

public interface MenuAccessService {
	public List<MenuAccessModel> getList();
	public MenuAccessModel getById(Integer id);
	public void insert(MenuAccessModel model);
	public void update(MenuAccessModel model);
	public void delete(MenuAccessModel model);
}
