package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.TrainerDao;
import com.eksad.xbc.model.TrainerModel;

@Repository
public class TrainerDaoImpl implements TrainerDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TrainerModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select tr from TrainerModel tr";
		Query query = session.createQuery(hql);
		List<TrainerModel> result = query.getResultList();
		return result;
	}

	public List<TrainerModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tr from TrainerModel tr where tr.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}
	
	@Override
	public TrainerModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tr from TrainerModel tr where tr.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TrainerModel result = (TrainerModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	@Override
	public void update(TrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
		
	}

	@Override
	public void delete(TrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
		
	}

	
}