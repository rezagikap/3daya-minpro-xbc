package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.BiodataDao;
import com.eksad.xbc.model.BiodataModel;
import com.eksad.xbc.model.MenuModel;

@Repository
public class BiodataDaoImpl implements BiodataDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<BiodataModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from BiodataModel jt order by jt.name";
		Query query = session.createQuery(hql);
		List<BiodataModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<BiodataModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from BiodataModel x where x.name like :keySearch order by x.name";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public BiodataModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from BiodataModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		BiodataModel result = (BiodataModel)query.getSingleResult();
		return result;
	}
	@Override
	public void insert(BiodataModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(BiodataModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(BiodataModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

}
