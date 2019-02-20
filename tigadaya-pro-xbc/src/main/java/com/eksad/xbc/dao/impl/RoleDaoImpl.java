package com.eksad.xbc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.RoleDao;
import com.eksad.xbc.model.RoleModel;
@Repository

public class RoleDaoImpl implements RoleDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<RoleModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from RoleModel jt order by jt.rolename";
		Query query = session.createQuery(hql);
		List<RoleModel> result = query.getResultList();
		return result;
	}

	//@Override
	//public List<RoleModel> search(String key) {
	//	Session session = sessionFactory.getCurrentSession();
	//	String hql = "select jt from RoleMOdel jt where jt.id=:id";
	//	Query query = session.createQuery(hql);
		//query.setParameter("id", id);
	//	RoleModel result =(RoleModel) query.getSingleResult();
	//	return result;
	//}

	@Override
	public RoleModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select jt from RoleModel jt where jt.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		RoleModel result =(RoleModel) query.getSingleResult();
		return result;
	}

	@Override
	public void insert(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);

	}

	@Override
	public void delete(RoleModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

	@Override
	public List<RoleModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select x from RoleModel x where x.name like :keySearch order by x.code";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%"+key+"%");
		return query.getResultList();
	}

}
