package com.ig.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import com.ig.dao.BaseDao;
import com.ig.pojo.Activity;
import com.ig.pojo.PageBean;
import com.ig.utils.HibernateUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;


public class BaseDaoImpl<T> implements BaseDao<T> {
	private Class clazz;
	public BaseDaoImpl() {
		ParameterizedType ptClass = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz = (Class) ptClass.getActualTypeArguments()[0];
	}
	@Override
	public int save(T t) {
		//1 获得session
		Session session = HibernateUtils.getCurrentSession();
		//3 执行保存
		return (int) session.save(t);
	}

	@Override
	public void delete(T t) {
		Session session = HibernateUtils.getCurrentSession();
		session.delete(t);
	}

	@Override
	public void delete(Serializable id) {
		T t = this.getById(id);
		Session session = HibernateUtils.getCurrentSession();
		session.delete(t);
	}

	@Override
	public void update(T t) {
		Session session = HibernateUtils.getCurrentSession();
		session.saveOrUpdate(t);
	}

	@Override
	public T getById(Serializable id) {
		//1 获得session
		Session session = HibernateUtils.getCurrentSession();
		return (T) session.get(clazz, id);
	}

	@Override
	public Integer getTotalCount(DetachedCriteria dc) {
		Session session = HibernateUtils.getCurrentSession();
		//设置查询的聚合函数,总记录数
		dc.setProjection(Projections.rowCount());

		Criteria c = dc.getExecutableCriteria(session);
		//3 执行查询并返回
		List<Long> list = (List<Long>) c.list();
		//清空之前设置的聚合函数
		dc.setProjection(null);
		if(list!=null && list.size()>0){
			Long count = list.get(0);
			return count.intValue();
		}else{
			return null;
		}
	}
	
	@Override
	public List<T> getPageList(PageBean pageBean,int index) {
		Session session = HibernateUtils.getCurrentSession();
		DetachedCriteria dc = pageBean.getDetachedCriteria();
        Criteria c = dc.getExecutableCriteria(session);
        c.setFirstResult(index);
        c.setMaxResults(pageBean.getPageSize());
		return c.list();
	}

	@Override
	public List<T> getAll() {
		//1 获得session
		Session session = HibernateUtils.getCurrentSession();
		//2 创建Criteria对象
		Criteria c = session.createCriteria(clazz);
		return c.list();
	}

	@Override
	public List<T> getAll(DetachedCriteria dc) {
		//1 获得session
		Session session = HibernateUtils.getCurrentSession();
		//2 将离线对象关联到session
		Criteria c = dc.getExecutableCriteria(session);
		//3 执行查询并返回
		return c.list();
	}

}
