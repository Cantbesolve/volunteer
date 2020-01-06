package com.ig.dao;

import com.ig.pojo.PageBean;
import org.hibernate.criterion.DetachedCriteria;

import java.io.Serializable;
import java.util.List;
public interface BaseDao<T> {
	//增
	int save(T t);
	//删
	void delete(T t);
	//删
	void delete(Serializable id);
	//改
	void update(T t);
	//查 根据id查询
	T	getById(Serializable id);
	//查 符合条件的总记录数
	Integer	getTotalCount(DetachedCriteria dc);
	//查 查询分页列表数据
	List<T> getPageList(PageBean pagebean,int index);
	//查
	List<T> getAll();
	//查
	List<T> getAll(DetachedCriteria dc);
}