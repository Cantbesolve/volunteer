package com.ig.service.impl;

import com.ig.dao.DictionaryDao;
import com.ig.dao.impl.DictionaryDaoImpl;
import com.ig.pojo.Dictionary;
import com.ig.service.DictionaryService;
import com.ig.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import java.util.List;

public class DictionaryServiceImpl implements DictionaryService {
    DictionaryDao dao = new DictionaryDaoImpl();

    @Override
    public List<Dictionary> getActivityType() {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Dictionary.class);
        detachedCriteria.add(Restrictions.eq("parentid",1));
        List<Dictionary> all = dao.getAll(detachedCriteria);
        //关闭事务
        tx.commit();
        return all;
    }

    @Override
    public Dictionary getActivityType(int id) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        Dictionary byId = dao.getById(id);
        tx.commit();
        return byId;
    }

    @Override
    public List<Dictionary> getActivityTransport() {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Dictionary.class);
        detachedCriteria.add(Restrictions.eq("parentid",14));
        List<Dictionary> all = dao.getAll(detachedCriteria);
        //关闭事务
        tx.commit();
        return all;
    }

    @Override
    public Dictionary getActivityTransport(int id) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        Dictionary byId = dao.getById(id);
        tx.commit();
        return byId;
    }
}
