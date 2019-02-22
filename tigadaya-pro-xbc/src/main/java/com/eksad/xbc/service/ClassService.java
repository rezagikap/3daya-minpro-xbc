package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.ClassModel;

public interface ClassService {
	public List<ClassModel> getList();
	public List<ClassModel> search(String key);
	public ClassModel getById(Integer id);
	public void insert(ClassModel model);
	public void update(ClassModel model);
	public void delete(ClassModel model);
}
