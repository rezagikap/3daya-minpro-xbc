package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.TechForm;
import com.eksad.xbc.model.TechnologyModel;

public interface TechnologyService {
	
	public List<TechnologyModel> getList();
	public List<TechnologyModel> search(String key);
	public TechnologyModel getById(Integer id);
	public void insert(TechForm model, Integer userid);
	public void update(TechnologyModel model);
	public void delete(TechnologyModel model);

}