package com.ig.service;

import com.ig.pojo.Activity;
import com.ig.pojo.PageBean;

import java.util.List;

public interface ActivityService {

    List<Activity> findNewActivity();
    List<Activity> findBestActivity();
    PageBean pageQueryActivity(PageBean pageBean);

    int insert(Activity activity);

    Activity findOneActivity(int id);

    void editActivity(Activity activity);

    void delete(int id);
}
