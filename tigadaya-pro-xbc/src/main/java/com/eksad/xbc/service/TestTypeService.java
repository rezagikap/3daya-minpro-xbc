package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.TestTypeModel;

public interface TestTypeService {
	public List<TestTypeModel> getList();
	public List<TestTypeModel> search(String key);
	public TestTypeModel getById(Integer id);
	public void insert(TestTypeModel model);
	public void update(TestTypeModel model);
	public void delete(TestTypeModel model);

}
