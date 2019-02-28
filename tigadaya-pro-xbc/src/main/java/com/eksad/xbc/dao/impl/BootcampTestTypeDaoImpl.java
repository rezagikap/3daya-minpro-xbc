package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.BootcampTestTypeDao;
import com.eksad.xbc.model.BootcampTestTypeModel;

@Repository
public class BootcampTestTypeDaoImpl implements BootcampTestTypeDao {
 @Autowired
 private SessionFactory sessionFactory;
 
 @Override
 public  List<BootcampTestTypeModel> getList(){
	 Session session = sessionFactory.getCurrentSession();
	 String hql = "select jt from BootcampTestTypeModel jt order by id";
	 Query query = session.createQuery(hql);
	 List<BootcampTestTypeModel> result = query.getResultList();
	 return result; 
 }

@Override
public List<BootcampTestTypeModel> search(String key) {
	Session session = sessionFactory.getCurrentSession();
	String hql = "select x from BootcampTestTypeModel x where x.name like :keySearch";
	Query query = session.createQuery(hql);
	query.setParameter("keySearch", "%"+key+"%");		
	return query.getResultList();
}

@Override
public BootcampTestTypeModel getById(Integer id) {
	Session session = sessionFactory.getCurrentSession();
	String hql = "select jt from BootcampTestTypeModel jt where jt.id=:id";
	Query query = session.createQuery(hql);
	query.setParameter("id", id);
	BootcampTestTypeModel result = (BootcampTestTypeModel)query.getSingleResult();
	return result;
	
}

@Override
public void insert(BootcampTestTypeModel model) {
	Session session = sessionFactory.getCurrentSession();
	session.save(model);
}

@Override
public void update(BootcampTestTypeModel model) {
	Session session = sessionFactory.getCurrentSession();
	session.update(model);
	
}

@Override
public void delete(BootcampTestTypeModel model) {
	Session session = sessionFactory.getCurrentSession();
	session.delete(model);
	
}
 

	
}