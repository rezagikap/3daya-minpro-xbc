package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.MenuDao;
import com.eksad.xbc.model.MenuModel;

@Repository
public class MenuDaoImpl implements MenuDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public List<MenuModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from MenuModel jt order by jt.title";
		Query query = session.createQuery(hql);
		List<MenuModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<MenuModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from MenuModel x where x.title like :keySearch order by x.title";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");		
		return query.getResultList();
	}

	@Override
	public MenuModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from MenuModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		MenuModel result = (MenuModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);
	}

	@Override
	public void update(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(MenuModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);
	}
}
