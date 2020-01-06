package com.ig.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckCodeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String attribute = (String) session.getAttribute("checkcode_session");
		String parameter = request.getParameter("code");
		Boolean isRight = false;
		if (attribute.equals(parameter)) {
			isRight = true;
			String json = "{\"isRight\":"+isRight +"}";
			response.getWriter().write(json);
		}else{
			String json = "{\"isRight\":"+isRight +"}";
			response.getWriter().write(json);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}