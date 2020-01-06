package com.ig.service;

import com.ig.pojo.User;
import org.hibernate.criterion.DetachedCriteria;

public interface UserService {
    User findUserByUserCode(User user);

    void insert(User user);

    Boolean checkUserName(DetachedCriteria detachedCriteria);
}
