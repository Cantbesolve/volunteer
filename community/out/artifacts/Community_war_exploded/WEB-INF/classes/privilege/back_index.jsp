<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人中心</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/privilege/back_header.jsp"></jsp:include>
    <jsp:include page="back_left.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <%--<jsp:include page="back_iframe.jsp"></jsp:include>--%>
            <iframe id="iframe" name="iframe" src="blank.jsp" class="layui-container" style="width: 100%;height:100%;border: 0px;">
            </iframe>
        </div>
    </div>
<jsp:include page="back_footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="../javascript/jquery.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../javascript/index.js"></script>
</body>
</html>
