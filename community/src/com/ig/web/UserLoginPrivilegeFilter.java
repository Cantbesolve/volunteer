package com.ig.web;

import com.ig.pojo.User;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//校验用户是否登录-
public class UserLoginPrivilegeFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;
		//校验用户是否登录---校验session是否存在user对象
		HttpSession session = request2.getSession();
		//判断用户是否已经登录 未登录下面的代码不执行
		User user = (User) session.getAttribute("user");
		if (user==null) {
			response2.sendRedirect(request2.getContextPath()+"/login&register.jsp");
			return;
		}
		chain.doFilter(request, response);
	}
    public UserLoginPrivilegeFilter() {
    }
	public void destroy() {
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
