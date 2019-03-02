package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.AssignmentModel;

public interface AssignmentService {
	public List<AssignmentModel> getList();
	public List<AssignmentModel> search(String key);
	public AssignmentModel getById(Integer id);
	public void insert(AssignmentModel model);
	public void update(AssignmentModel model);
	public void delete(AssignmentModel model);
}
