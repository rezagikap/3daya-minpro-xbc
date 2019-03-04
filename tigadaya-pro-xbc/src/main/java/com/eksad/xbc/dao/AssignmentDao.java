package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.AssignmentModel;

public interface AssignmentDao {
	public List<AssignmentModel> getList();
	public List<AssignmentModel> search(String key);
	public AssignmentModel getById(Integer id);
	public void insert(AssignmentModel model);
	public void update(AssignmentModel model);
	public void delete(AssignmentModel model);
}
