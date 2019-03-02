package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.MenuModel;

public interface MenuService {
	public List<MenuModel> getList();
	public List<MenuModel> search(String key);
	public MenuModel getById(Integer id);
	public String getNewCode();
	public void insert(MenuModel model);
	public void update(MenuModel model);
	public void delete(MenuModel model);
}
