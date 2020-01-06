package com.ig.web;
import com.ig.pojo.User;
import com.ig.service.UserService;
import com.ig.service.impl.UserServiceImpl;
import com.ig.utils.MyDateConverter;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;

//登陆注册servlet
public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Map<String, String[]> parameterMap = req.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User userLogin = userService.findUserByUserCode(user);
        if(userLogin==null){
            req.setAttribute("error","该用户不存在！");
            req.getRequestDispatcher("/login&register.jsp").forward(req,resp);
        }else {
            //用户名存在
            if(userLogin.getPassword().equals(user.getPassword())){
                //登陆成功
                req.getSession().setAttribute("user",userLogin);
                resp.sendRedirect(req.getContextPath()+"/index?method=index");
            }else{
                req.setAttribute("error","密码错误！");
                req.getRequestDispatcher("/login&register.jsp").forward(req,resp);
            }
        }
    }
    public void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath()+"/index?method=index");
    }
    public void register(HttpServletRequest request, HttpServletResponse resp) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        Map<String, String[]> parameterMap = request.getParameterMap();
        User user = new User();
        try {
            ConvertUtils.register(new MyDateConverter(), Date.class);
            BeanUtils.populate(user, parameterMap);
        } catch (IllegalAccessException|InvocationTargetException e) {
            e.printStackTrace();
        }
        user.setCreatetime(new Date());
        user.setStatus(0);
        //管理员的等级
//        user.setLevel(Float.MAX_VALUE);
        user.setLevel(1f);
        System.out.println(user);
        userService.insert(user);
        request.setAttribute("success","注册成功！");
        request.getRequestDispatcher("login&register.jsp").forward(request,resp);
    }

}