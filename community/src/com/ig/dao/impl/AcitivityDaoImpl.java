package com.ig.dao.impl;

import com.ig.dao.ActivityDao;
import com.ig.pojo.Activity;
import com.ig.utils.HibernateUtils;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;

public class AcitivityDaoImpl extends BaseDaoImpl<Activity> implements ActivityDao {

    @Override
    public List<Activity> findNewActivity() {
        Session session = HibernateUtils.getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from Activity order by starttime desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Activity> list = query.list();
        return list;
    }

    @Override
    public List<Activity> findBestActivity() {
        Session session = HibernateUtils.getCurrentSession();
        Query query = session.createQuery("from Activity order by fivestar_count desc,fourstar_count desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Activity> list = query.list();
        return list;
    }
}
