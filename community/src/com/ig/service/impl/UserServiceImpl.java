package com.ig.service.impl;

import com.ig.dao.UserDao;
import com.ig.dao.impl.UserDaoImpl;
import com.ig.pojo.Activity;
import com.ig.pojo.User;
import com.ig.service.UserService;
import com.ig.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;

import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDao dao = new UserDaoImpl();
    @Override
    public User findUserByUserCode(User user) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        User list = dao.findUserByUserCode(user);
        //关闭事务
        tx.commit();
        return list;
    }

    @Override
    public void insert(User user) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        dao.save(user);
        //关闭事务
        tx.commit();
    }

    @Override
    public Boolean checkUserName(DetachedCriteria detachedCriteria) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        List<User> all = dao.getAll(detachedCriteria);
        //关闭事务
        tx.commit();
        return all.size()==0;
    }
}
