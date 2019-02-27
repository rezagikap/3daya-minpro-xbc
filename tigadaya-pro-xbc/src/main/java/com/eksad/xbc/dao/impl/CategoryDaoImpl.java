package com.eksad.xbc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eksad.xbc.dao.CategoryDao;
import com.eksad.xbc.model.CategoryModel;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<CategoryModel> getList() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm order by id";
		Query query = session.createQuery(hql);
		List<CategoryModel> result = query.getResultList();
		return result;
	}

	@Override
	public List<CategoryModel> search(String key) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm where cm.name like :keySearch or cm.code like :keySearch";
		Query query = session.createQuery(hql);
		query.setParameter("keySearch", "%" + key + "%");
		return query.getResultList();
	}

	@Override
	public CategoryModel getById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select cm from CategoryModel cm where cm.id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CategoryModel result = (CategoryModel) query.getSingleResult();
		return result;
	}

	@Override
	public String getNewCode() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select xx from CategoryModel xx where xx.code=(select max(code) from CategoryModel)";
		Query query = session.createQuery(hql);
		CategoryModel xx = (CategoryModel) query.getSingleResult();
		String kodeBaru = xx.getCode();
		if (xx != null) {
			int xCode = Integer.parseInt(kodeBaru.substring(1, 4));// value di mulai 1 dan panjang nya 3
			xCode++;
			kodeBaru = "C" + String.format("%03d", xCode);
		} else {
			kodeBaru = "C001";
			
		}

		return kodeBaru;
	}

	@Override
	public void insert(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.save(model);

	}

	@Override
	public void update(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.update(model);
	}

	@Override
	public void delete(CategoryModel model) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(model);

	}

}