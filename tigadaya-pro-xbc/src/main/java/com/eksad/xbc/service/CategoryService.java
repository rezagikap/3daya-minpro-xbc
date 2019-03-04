package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.CategoryModel;

public interface CategoryService {
	public List<CategoryModel> getList();
	public List<CategoryModel> search(String key);
	public CategoryModel getById(Integer id);
	public String getNewCode();
	public void insert(CategoryModel model);
	public void update(CategoryModel model);
	public void delete(CategoryModel model);
	
}