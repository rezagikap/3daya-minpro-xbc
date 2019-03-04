package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.BootcampTypeModel;

public interface BootcampTypeDao {
	public List<BootcampTypeModel> getList();
	public List<BootcampTypeModel> search(String key);
	public BootcampTypeModel getById(Integer id);
	public void insert(BootcampTypeModel model);
	public void update(BootcampTypeModel model);
	public void delete(BootcampTypeModel model);


}
