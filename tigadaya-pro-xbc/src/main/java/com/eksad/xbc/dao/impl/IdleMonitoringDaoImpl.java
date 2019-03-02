package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.IdleMonitoringDao;
import com.eksad.xbc.model.IdleMonitoringModel;
import com.eksad.xbc.model.UserModel;


@Repository
public class IdleMonitoringDaoImpl implements IdleMonitoringDao{
	@Autowired
	private SessionFactory sessionFactory; 
	
	@Override
	public List<IdleMonitoringModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from IdleMonitoringModel jt order by jt.id";
		Query query = session.createQuery(hql);
		List<IdleMonitoringModel> result = query.getResultList();
		return result;
		
	}

	@Override
	public List<IdleMonitoringModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from IdleMonitoringMode  x where x.username like :keySearch or x.email like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public IdleMonitoringModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from IdleMonitoringModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		IdleMonitoringModel result = (IdleMonitoringModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(IdleMonitoringModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	@Override
	public void update(IdleMonitoringModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
		
	}

	@Override
	public void delete(IdleMonitoringModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
		
	}

	@Override
	public void placement(IdleMonitoringModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	
}
