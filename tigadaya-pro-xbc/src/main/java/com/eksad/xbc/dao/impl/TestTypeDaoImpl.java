package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.TestTypeDao;
import com.eksad.xbc.model.TestTypeModel;

@Repository
public class TestTypeDaoImpl implements TestTypeDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<TestTypeModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select ty from TestTypeModel ty";
		Query query = session.createQuery(hql);
		List<TestTypeModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<TestTypeModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select ty from TestTypeModel ty where t.name lika :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public TestTypeModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select ty from TestTypeModel ty where ty.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", "id");
		TestTypeModel result = (TestTypeModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
		
	}

	@Override
	public void update(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(TestTypeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
		
	}

}
