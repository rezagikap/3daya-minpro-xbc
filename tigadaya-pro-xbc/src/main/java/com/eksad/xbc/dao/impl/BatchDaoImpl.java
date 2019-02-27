package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.BatchDao;
import com.eksad.xbc.model.BatchModel;
import com.eksad.xbc.model.TrainerModel;

@Repository
public class BatchDaoImpl implements BatchDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<BatchModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select tr from BatchModel tr order by id";
		Query query = session.createQuery(hql);
		List<BatchModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<BatchModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from BatchModel x where x.name like :keySearch";
		//or x.technologyId like :keySearch
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

	@Override
	public BatchModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select bm from BatchModel bm where bm.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		BatchModel result = (BatchModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(BatchModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(BatchModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(BatchModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}

}