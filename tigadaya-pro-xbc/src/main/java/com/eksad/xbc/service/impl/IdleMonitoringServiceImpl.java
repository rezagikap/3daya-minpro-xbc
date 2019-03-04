package com.eksad.xbc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.IdleMonitoringDao;
import com.eksad.xbc.model.IdleMonitoringModel;
import com.eksad.xbc.service.IdleMonitoringService;


@Service
@Transactional
public class IdleMonitoringServiceImpl implements IdleMonitoringService {
  
	@Autowired
	private IdleMonitoringDao dao;
	
	@Override
	public List<IdleMonitoringModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<IdleMonitoringModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public IdleMonitoringModel getById(Integer id) {
		return  this.dao.getById(id);
	}

	@Override
	public void insert(IdleMonitoringModel model) {
		this.dao.insert(model);
		
	}

	@Override
	public void update(IdleMonitoringModel model) {
		this.dao.update(model);
		
	}

	@Override
	public void delete(IdleMonitoringModel model) {
		this.dao.delete(model); 

	}

	@Override
	public void placement(IdleMonitoringModel model) {
	 this.dao.placement(model);		
	}
	

}
