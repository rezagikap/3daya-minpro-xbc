package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.TestModel;

public interface TestDao {
	public List<TestModel> getList();
	public List<TestModel> search(String key);
	public TestModel getById(Integer id);
	public void insert(TestModel model);
	public void update(TestModel model);
	public void delete(TestModel model);
}


