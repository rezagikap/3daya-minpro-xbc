package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.UserModel;

public interface UserDao {
	public List<UserModel> getList();
	public List<UserModel> search(String key);
	public UserModel getById(Integer id);
	public void insert(UserModel model);
	public void update(UserModel model);
	public void delete(UserModel model);
	public void reset(UserModel model);

}