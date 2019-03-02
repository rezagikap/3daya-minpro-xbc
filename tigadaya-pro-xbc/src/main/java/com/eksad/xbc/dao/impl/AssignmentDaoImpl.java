package com.eksad.xbc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.AssignmentDao;
import com.eksad.xbc.model.AssignmentModel;

@Repository
public class AssignmentDaoImpl implements AssignmentDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<AssignmentModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from AssignmentModel jt where jt.isDelete='false' order by jt.title";
		Query query = session.createQuery(hql);
		List<AssignmentModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<AssignmentModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from AssignmentModel x where x.title like :keySearch and x.isDelete='false' order by x.title";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public AssignmentModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from AssignmentModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		AssignmentModel result = (AssignmentModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(AssignmentModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(AssignmentModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(AssignmentModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}
}
