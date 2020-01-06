package com.ig.dao.impl;
import com.ig.dao.TestDao;
import com.ig.pojo.*;
import com.ig.utils.HibernateUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class TestDaoImpl extends BaseDaoImpl<Activity> implements TestDao {

    public static void main(String[] args){
        Session session = HibernateUtils.getCurrentSession();
		Transaction beginTransaction = session.beginTransaction();
        User user = session.get(User.class, 4);
        User user1 = session.get(User.class, 1);
        Logger logger = session.get(Logger.class, 3);
        Comment comment = new Comment();
        comment.setContent("我是一条不起眼的评论！！！");
        comment.setLogger(logger);
        comment.setBeforeUser(user);
        comment.setAfterUser(user1);
        session.save(comment);
        beginTransaction.commit();
    }
}
