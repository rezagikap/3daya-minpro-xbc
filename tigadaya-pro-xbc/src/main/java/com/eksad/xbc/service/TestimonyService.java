package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.TestimonyModel;

public interface TestimonyService {
	public List<TestimonyModel> getList();
	public List<TestimonyModel> search(String key);
	public TestimonyModel getById(Integer id);
	public void insert(TestimonyModel model);
	public void update(TestimonyModel model);
	public void delete(TestimonyModel model);
}
