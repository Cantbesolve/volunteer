
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-header">
    <div class="layui-logo" align="center">公益平台-个人中心</div>
    <div align="center" style="line-height:60px;text-align:center;color:#009688;font-size:16px">欢迎来到公益平台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item"><a href="/index?method=index">首页</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                ${user.username}
            </a>
        </li>
        <li class="layui-nav-item"><a href="/user?method=logout">登出</a></li>
    </ul>
</div>
</body>
</html>
