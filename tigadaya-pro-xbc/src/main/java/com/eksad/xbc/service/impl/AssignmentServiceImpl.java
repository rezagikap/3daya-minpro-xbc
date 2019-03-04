package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.AssignmentDao;
import com.eksad.xbc.model.AssignmentModel;
import com.eksad.xbc.model.AssignmentModel;
import com.eksad.xbc.service.AssignmentService;

@Service
@Transactional
public class AssignmentServiceImpl implements AssignmentService {

	@Autowired
	private AssignmentDao dao;
	
	@Override
	public List<AssignmentModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<AssignmentModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public AssignmentModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(AssignmentModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(AssignmentModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(AssignmentModel model) {
		this.dao.delete(model);
	}

}
