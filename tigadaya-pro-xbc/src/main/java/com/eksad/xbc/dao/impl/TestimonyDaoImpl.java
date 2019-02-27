package com.eksad.xbc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.TestimonyDao;
import com.eksad.xbc.model.TestimonyModel;

@Repository
public class TestimonyDaoImpl implements TestimonyDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<TestimonyModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql ="select t from TestimonyModel t";
		Query query = session.createQuery(hql);
		List<TestimonyModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TestimonyModel> search(String key) {
		Session session =sessionFactory.getCurrentSession();
		String hql = "select t from TestimonyModel t where t.title like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public TestimonyModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql ="select t from TestimonyModel t where t.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		TestimonyModel result = (TestimonyModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(TestimonyModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

	

}
