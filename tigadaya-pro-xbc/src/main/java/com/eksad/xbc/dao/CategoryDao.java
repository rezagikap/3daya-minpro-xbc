package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.CategoryModel;

public interface CategoryDao {
	public List<CategoryModel> getList();
	public List<CategoryModel> search(String key);
	public CategoryModel getById(Integer id);
	public String getNewCode(); //method untuk auto increment
	public void insert(CategoryModel model);
	public void update(CategoryModel model);
	public void delete(CategoryModel model);
}