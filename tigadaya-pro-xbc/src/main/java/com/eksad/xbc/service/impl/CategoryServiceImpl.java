package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.CategoryDao;
import com.eksad.xbc.model.CategoryModel;
import com.eksad.xbc.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;

	@Override
	public List<CategoryModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<CategoryModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public CategoryModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(CategoryModel model) {
		this.dao.insert(model);

	}

	@Override
	public void update(CategoryModel model) {
		this.dao.update(model);

	}

	@Override
	public void delete(CategoryModel model) {
		this.dao.delete(model);

	}

	@Override
	public String getNewCode() {
		return this.dao.getNewCode();
	}

}