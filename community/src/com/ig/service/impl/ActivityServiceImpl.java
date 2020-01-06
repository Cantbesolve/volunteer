package com.ig.service.impl;

import com.ig.dao.ActivityDao;
import com.ig.dao.impl.AcitivityDaoImpl;
import com.ig.pojo.Activity;
import com.ig.pojo.PageBean;
import com.ig.service.ActivityService;
import com.ig.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class ActivityServiceImpl implements ActivityService {
    private ActivityDao dao = new AcitivityDaoImpl();
    @Override
    public List<Activity> findNewActivity() {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();

        List<Activity> list = dao.findNewActivity();


        //关闭事务
        tx.commit();
        return list;
    }
    public List<Activity> findBestActivity() {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();

        List<Activity> list = dao.findBestActivity();


        //关闭事务
        tx.commit();
        return list;
    }
    /**
     * 分页查询活动
     * @param pageBean
     * @return
     */
    @Override
    public PageBean pageQueryActivity(PageBean pageBean) {
        Session session =  HibernateUtils.getCurrentSession();
        //打开事务
        Transaction tx = session.beginTransaction();
        Integer totalCount = dao.getTotalCount(pageBean.getDetachedCriteria());
        int index = (pageBean.getCurrentPage()-1)*pageBean.getPageSize();
        pageBean.setTotal(totalCount);
        List<Activity> list = dao.getPageList(pageBean,index);
        pageBean.setRows(list);
        //封装PageBean
        tx.commit();
        return pageBean;
    }

    @Override
    public int insert(Activity activity) {
        Session session =  HibernateUtils.getCurrentSession();
        Transaction tx = session.beginTransaction();
        int save = dao.save(activity);
        tx.commit();
        return save;
    }

    @Override
    public Activity findOneActivity(int id) {
        Session session =  HibernateUtils.getCurrentSession();
        Transaction tx = session.beginTransaction();
        Activity byId = dao.getById(id);
        tx.commit();
        return byId;
    }

    @Override
    public void editActivity(Activity activity) {
        Session session =  HibernateUtils.getCurrentSession();
        Transaction tx = session.beginTransaction();
        dao.update(activity);
        tx.commit();
    }

    @Override
    public void delete(int id) {
        Session session =  HibernateUtils.getCurrentSession();
        Transaction tx = session.beginTransaction();
        dao.delete(id);
        tx.commit();
    }
}
