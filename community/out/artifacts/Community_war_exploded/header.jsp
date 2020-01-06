<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default probootstrap-navbar">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascripts:void(0);" title="uiCookies:Enlight">Enlight</a>
        </div>
        <div id="navbar-collapse" class="navbar-collapse collapse" style="margin-right:-80px">
            <ul class="nav navbar-nav navbar-right" style="margin-right:-50px">
                <li class="active"><a href="index.jsp">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/activity?method=activityPageList">公益活动</a></li>
                <li><a href="loggerlist.jsp">社区日志</a></li>
                <li><a href="privilege/back_index.jsp">个人中心</a></li>
                <li class="probootstra-cta-button last" style="margin-right: 25px;"><a href="login&register.jsp" class="btn btn-primary">立即成为志愿者</a></li>
                <li style="margin-right: -20px;">
                    <a href="login&register.jsp" >
                        <c:if test="${user==null}">登陆</c:if>
                        <c:if test="${user!=null}"><a style="text-decoration: none;color:red;margin-top: -67px">你好，${user.username}</a></c:if>
                    </a>
                </li>
                <li style="margin-right: -20px;"><a href="javascripts:void(0);">&nbsp;|&nbsp;</a></li>
                <li><a href="/user?method=logout" >登出</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
