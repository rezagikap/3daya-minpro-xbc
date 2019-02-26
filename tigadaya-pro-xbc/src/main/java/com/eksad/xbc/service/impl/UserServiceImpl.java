package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.UserDao;
import com.eksad.xbc.model.UserModel;
import com.eksad.xbc.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;
	
	@Override
	public List<UserModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<UserModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public UserModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(UserModel model) {
		this.dao.insert(model);
	}

	@Override
	public void update(UserModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(UserModel model) {
		this.dao.delete(model);
	}
	
	@Override
	public void reset(UserModel model) {
		this.dao.reset(model);
	}
}