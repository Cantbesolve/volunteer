
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../javascript/jquery.min.js"></script>

</head>
<body>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li id="per" class="layui-nav-item "><a id="per1" href="back_index.jsp">个人中心</a></li>
            <li id="a" class="layui-nav-item">
                <a class="" href="javascript:;">公益活动</a>
                <dl class="layui-nav-child">
                    <dd><a id="a1" href="/activity?method=hasInActivity" target="iframe">已参加公益活动</a></dd>
                    <c:if test="${user.level>3}">
                        <dd><a id="a2" href="/activity?method=hasPutActivity" target="iframe">已发布公益活动</a></dd>
                        <dd><a id="a3" href="back_create.jsp" target="iframe">发布公益活动</a></dd>
                    </c:if>
                    <dd><a id="a4" href="/activity?method=hasVoteActivity" target="iframe">已投票公益活动</a></dd>
                    <c:if test="${user.level==10000}">
                        <dd><a id="a5" href="/activity?method=allActivity" target="iframe">所有公益活动</a></dd>
                    </c:if>
                </dl>
            </li>
            <li id="c" class="layui-nav-item">
                <a href="javascript:;">日志与评论</a>
                <dl class="layui-nav-child">
                    <dd><a id="c1" href="/logger?method=priaseComment&flag=c1" target="iframe">我发布的日志</a></dd>
                    <dd><a id="c2" href="/logger?method=priaseComment&flag=c2" target="iframe">我点赞的日志</a></dd>
                    <dd><a id="c3" href="/logger?method=priaseComment&flag=c3" target="iframe">我的评论</a></dd>
                    <dd><a id="c1" href="/comment?method=hasPutLogger">我发布的日志</a></dd>
                    <dd><a id="c4" href="back_addLogger.jsp" target="iframe">发布日志</a></dd>
                    <dd><a id="c2" href="/comment?method=">我点赞的日志</a></dd>
                    <dd><a id="c3" href="/comment?method=">我的评论</a></dd>
                </dl>
            </li>

            <li id="o" class="layui-nav-item">
                <a id="o1" href="/user?method=personal&flag=p1">个人资料</a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
