package com.eksad.xbc.service;

import java.util.List;

import com.eksad.xbc.model.IdleMonitoringModel;

public interface IdleMonitoringService {
    public List<IdleMonitoringModel> getList();
    public List<IdleMonitoringModel> search(String key);
    public IdleMonitoringModel getById(Integer id);
    public void insert(IdleMonitoringModel model);
    public void update(IdleMonitoringModel model);
    public void delete(IdleMonitoringModel model);
    public void placement(IdleMonitoringModel model); 
}
