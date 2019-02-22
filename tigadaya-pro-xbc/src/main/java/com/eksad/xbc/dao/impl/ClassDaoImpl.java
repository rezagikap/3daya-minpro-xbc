package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.ClassDao;
import com.eksad.xbc.model.ClassModel;
import com.eksad.xbc.model.MenuModel;

@Repository
public class ClassDaoImpl implements ClassDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<ClassModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from ClassModel jt order by jt.title";
		Query query = session.createQuery(hql);
		List<ClassModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<ClassModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from ClassModel x where x.title like  :keySearch order by.x.title";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%" + key + "%");
		return query.getResultList();
	}

	@Override
	public ClassModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from ClassModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ClassModel result = (ClassModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(ClassModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(ClassModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(ClassModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}
}
