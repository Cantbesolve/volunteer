package com.ig.dao.impl;

import com.ig.dao.UserDao;
import com.ig.pojo.User;
import com.ig.utils.HibernateUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import java.util.List;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    @Override
    public User findUserByUserCode(User user) {
        Session currentSession = HibernateUtils.getCurrentSession();
        String hql = "from User where username=:username";
        Query query = currentSession.createQuery(hql);
        query.setParameter("username",user.getUsername());
        List list = query.list();
        if(list!=null&&list.size()>0){
            return (User) list.get(0);
        }
        return null;
    }
}
