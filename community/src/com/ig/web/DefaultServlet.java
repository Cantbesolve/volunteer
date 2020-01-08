package com.ig.web;

import com.ig.pojo.Activity;
import com.ig.service.ActivityService;
import com.ig.service.TestService;
import com.ig.service.impl.ActivityServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class DefaultServlet extends BaseServlet {
    TestService service = new TestService();
    ActivityService indexservice = new ActivityServiceImpl();

    /**
     * 初始化首页的所有信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */

    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //加载活动1
        List<Activity> list1 = indexservice.findNewActivity();
        //加载活动2
        List<Activity> list2 = indexservice.findBestActivity();
        //加载日志
        //加载评lun
        request.setAttribute("list1",list1);
        request.setAttribute("list2",list2);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
    // 这些是参考
    public void hotActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO 查询评分最高的活动，下面的不对
        List<Activity> list = service.getAll();
        Object2JsonUtils.java2Json(list, new String[]{}, response);
    }
    public void newActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO 查询最新的活动，下面的不对
        List<Activity> list = service.getAll();
        Object2JsonUtils.java2Json(list, new String[]{}, response);
    }
}