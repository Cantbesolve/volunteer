<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <script src="../javascript/jquery.min.js"></script>
    <script type="text/javascript" src="../js/vendor/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/style.css" type="text/css"/>
    <link rel="stylesheet" href="../css/vendor/bootstrap.min.css" type="text/css"/>
</head>
<body>
<div class="container">
    <div id="logindiv" class="row" style="margin-top: 0px">

        <div class="col-md-8 text-center">

                <legend>---
                    添加日志
                    ---</legend>
                <form action="/user" class="form-horizontal" method="post" id="form">
                    <div class="form-group ">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  placeholder="请输入用户名" name="username" value="村长">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入用户名" name="username" value="村长">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" placeholder="请输入用户名" name="username" value="村长">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  placeholder="请输入用户名" name="username" value="村长">
                        </div>
                    </div>
                    <div class="form-group ">
                        <label  class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" rows="3" placeholder="请输入。。。"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="exampleInputFile">日志图片</label>
                        <div class="col-sm-6">
                            <input type="file" id="exampleInputFile">
                        </div>
                    </div>
                    <div class="form-group " >
                        <label  class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control"  placeholder="请输入密码" name="password" value="123456">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class=" col-sm-offset col-sm-6" >
                            <button class="btn btn-primary btn-sm" >&nbsp;&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;&nbsp;</button>
                        </div>
                    </div>
                </form>



        </div>
        <div class="col-md-2"></div>
    </div>


</div>

</body>
</html>
