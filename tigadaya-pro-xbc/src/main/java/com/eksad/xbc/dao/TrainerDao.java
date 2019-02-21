package com.eksad.xbc.dao;

import java.util.List;

import com.eksad.xbc.model.TrainerModel;

public interface TrainerDao {
	
	public List<TrainerModel> getList();
	public List<TrainerModel> search(String key);
	public TrainerModel getById(Integer id);
	public void insert(TrainerModel model);
	public void update(TrainerModel model);
	public void delete(TrainerModel model);

}