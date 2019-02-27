package com.eksad.xbc.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eksad.xbc.dao.TechnologyDao;
import com.eksad.xbc.dao.TechTrainerDao;
import com.eksad.xbc.model.TechForm;
import com.eksad.xbc.model.TechnologyModel;
import com.eksad.xbc.model.TechTrainerModel;
import com.eksad.xbc.service.TechnologyService;

@Service
@Transactional
public class TechnologyServiceImpl implements TechnologyService {
	
	@Autowired
	private TechnologyDao dao;
	@Autowired
	private TechTrainerDao daoTt;

	@Override
	public List<TechnologyModel> getList() {
		return this.dao.getList();
	}

	@Override
	public List<TechnologyModel> search(String key) {
		return this.dao.search(key);
	}

	@Override
	public TechnologyModel getById(Integer id) {
		return this.dao.getById(id);
	}

	@Override
	public void insert(TechForm model, Integer userid) {
		SimpleDateFormat date = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
		Date now = new Date();
		String strDate = date.format(now);
		//input data ke tabel Technology
		TechnologyModel tech = model.getTech();
		tech.setCreatedBy(userid);
		tech.setCreatedOn(strDate);
		tech.setIsDelete(false);
		this.dao.insert(model.getTech());
				
		// input ke tabel Technology Trainer
		if (model.getTt() !=null) {
			for (TechTrainerModel tt : model.getTt()) {
				tt.setTechnologyId(tech.getId());
				tt.setCreatedBy(userid);
				tt.setCreatedOn(strDate);
				this.daoTt.insert(tt);	
			}				
		}
	}

	@Override
	public void update(TechnologyModel model) {
		this.dao.update(model);
	}

	@Override
	public void delete(TechnologyModel model) {
		this.dao.delete(model);
	}

}