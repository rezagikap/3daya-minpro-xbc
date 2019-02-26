package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.OfficeModel;

public interface OfficeService {
	public List<OfficeModel> getList();
	public List<OfficeModel> search(String key);
	public OfficeModel getById(Integer id);
	public void insert(OfficeModel model);
	public void update(OfficeModel model);
	public void delete(OfficeModel model);

}