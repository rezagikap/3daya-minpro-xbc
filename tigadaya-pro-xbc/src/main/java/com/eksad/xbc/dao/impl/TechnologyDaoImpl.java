package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.TechnologyDao;
import com.eksad.xbc.model.TechnologyModel;

@Repository
public class TechnologyDaoImpl implements TechnologyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TechnologyModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select tc from TechnologyModel tc";
		Query query = session.createQuery(hql);
		List<TechnologyModel> result = query.getResultList();
		return result;
	}

	public List<TechnologyModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tc from TechnologyModel tc where tc.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}
	
	@Override
	public TechnologyModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tc from TechnologyModel tc where tc.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TechnologyModel result = (TechnologyModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TechnologyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	@Override
	public void update(TechnologyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
		
	}

	@Override
	public void delete(TechnologyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
		
	}

	
}