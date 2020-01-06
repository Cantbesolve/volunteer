package com.ig.dao;

import com.ig.pojo.User;

public interface UserDao extends BaseDao<User> {
    User findUserByUserCode(User user);
}
