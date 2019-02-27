package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.OfficeDao;
import com.eksad.xbc.model.OfficeModel;

@Repository
public class OfficeDaoImpl implements OfficeDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<OfficeModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from OfficeModel jt order by jt.id";
		Query query = session.createQuery(hql);
		List<OfficeModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<OfficeModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from OfficeModel x where x.username like :keySearch or x.email like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public OfficeModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from OfficeModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		OfficeModel result = (OfficeModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(OfficeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(OfficeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(OfficeModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}
	
}