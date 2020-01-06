package com.ig.dao;

import com.ig.pojo.Activity;

import java.util.List;

public interface ActivityDao extends BaseDao<Activity>{
    List<Activity> findNewActivity();
    List<Activity> findBestActivity();
}
