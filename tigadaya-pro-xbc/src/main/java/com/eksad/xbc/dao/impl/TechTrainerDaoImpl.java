package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.TechTrainerDao;
import com.eksad.xbc.model.TechTrainerModel;

@Repository
public class TechTrainerDaoImpl implements TechTrainerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TechTrainerModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		// HQl => Hibernate Query language
		// Hibernate => ORM ( Object Relation Mapping )
		String hql = "select tt from TechTrainerModel tt";
		Query query = session.createQuery(hql);
		List<TechTrainerModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TechTrainerModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tt from TechTrainerModel tt where tt.name like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public TechTrainerModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tt from TechTrainerModel tt where tt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TechTrainerModel result = (TechTrainerModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TechTrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(TechTrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(TechTrainerModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

}