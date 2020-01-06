package com.ig.service;
import com.ig.dao.impl.TestDaoImpl;
import com.ig.pojo.Activity;
import com.ig.pojo.PageBean;
import com.ig.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;

import java.sql.SQLException;
import java.util.List;

public class TestService {
    private TestDaoImpl testDao = new TestDaoImpl();

    public void save(Activity c) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        //调用Dao保存客户
        try {
            testDao.save(c);
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        }
        //关闭事务
        tx.commit();
    }

    public List<Activity> getAll() {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        List<Activity> list = testDao.getAll();
        //关闭事务
        tx.commit();
        return list;
    }

    public List<Activity> getAll(DetachedCriteria dc) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        List<Activity> list = testDao.getAll(dc);
        //关闭事务
        tx.commit();
        return list;
    }

}
