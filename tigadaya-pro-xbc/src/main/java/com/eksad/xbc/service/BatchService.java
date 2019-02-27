package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.BatchModel;

public interface BatchService {
	public List<BatchModel> getList();
	public List<BatchModel> search(String key);
	public BatchModel getById(Integer id);
	public void insert(BatchModel model);
	public void update(BatchModel model);
	public void delete(BatchModel model);
}