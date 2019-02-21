package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.MenuAccessDao;
import com.eksad.xbc.model.MenuAccessModel;

@Repository
public class MenuAccessDaoImpl implements MenuAccessDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<MenuAccessModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from MenuAccessModel jt order by jt.menuId";
		Query query = session.createQuery(hql);
		List<MenuAccessModel> result = query.getResultList();
		return result;
	}

	@Override
	public MenuAccessModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from MenuAccessModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		MenuAccessModel result = (MenuAccessModel)query.getSingleResult();
		return result;
	}

	@Override
	public void insert(MenuAccessModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(MenuAccessModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(MenuAccessModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

}
