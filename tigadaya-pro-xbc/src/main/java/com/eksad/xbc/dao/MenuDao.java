package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.MenuModel;

public interface MenuDao {
	public List<MenuModel> getList();
	public List<MenuModel> search(String key);
	public MenuModel getById(Integer id);
	public String getNewCode(); //method utk auto increment
	public void insert(MenuModel model);
	public void update(MenuModel model);
	public void delete(MenuModel model);
}
