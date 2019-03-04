package com.eksad.xbc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.QuestionDao;
import com.eksad.xbc.model.QuestionModel;
import com.eksad.xbc.model.QuestionModel;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<QuestionModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select qt from QuestionModel qt order by qt.question";
		Query query = session.createQuery(hql);
		List<QuestionModel> result = query.getResultList();
		return result;	}


	@Override
	public QuestionModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select qt from QuestionModel qt where qt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		QuestionModel result =(QuestionModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(QuestionModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(QuestionModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(QuestionModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}


	@Override
	public List<QuestionModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from QuestionModel x where x.question like :keySearch order by x.question";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

}
