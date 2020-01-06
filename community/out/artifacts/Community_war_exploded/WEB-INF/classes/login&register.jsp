<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录&注册</title>
    <link rel="stylesheet" href="css/animate.css">
    <script src="javascript/jquery.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css" type="text/css"/>
    <!--引入表单校验jquery插件-->
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/jquery.timers-1.2.js"></script>
    <script src="js/vendor/html5shiv.min.js"></script>
    <script src="js/vendor/respond.min.js"></script>
    <link rel="stylesheet" href="css/styles-merged.css">
    <script type="text/javascript">
        $.extend($.validator.messages, {
            required: "必填字段",
            remote: "请修正该字段",
            email: "请输入正确格式的电子邮件",
            url: "请输入合法的网址",
            date: "请输入合法的日期",
            dateISO: "请输入合法的日期 (ISO).",
            number: "请输入合法的数字",
            digits: "只能输入整数",
            creditcard: "请输入合法的信用卡号",
            equalTo: "请再次输入相同的值",
            accept: "请输入拥有合法后缀名的字符串",
            maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
            minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
            rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
            range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
            max: $.validator.format("请输入一个最大为 {0} 的值"),
            min: $.validator.format("请输入一个最小为 {0} 的值")
        });
        $.validator.addMethod(
            "checkusername",
            function(value,element,params){
                var flag = false;
                //value:输入的内容
                //element:被校验的元素对象
                //params:规则对应的参数值
                //目的：对输入的username进行ajax校验
                $.ajax({
                    "async":false,
                    "url":"/checkusername",
                    "data":{"username":value},
                    "type":"POST",
                    "dataType":"json",
                    "success":function(data){
                        flag = data.isExist;
                    }
                })
                return flag;
            });

        $.validator.addMethod(
            "isphone",
            function(value,element,params){
                if((/^1(3|4|5|7|8)\d{9}$/.test(value))){
                    return true;
                }
                return false;
            });

        $(function(){
            $("#form").validate({
                rules:{
                    "username":{
                        "required":true
                    },
                    "password":{
                        "required":true,
                        "rangelength":[6,12]
                    },

                },
                messages:{
                    "username":{
                        "required":"用户名不能为空！"
                    },
                    "password":{
                        "required":"密码不能为空！",
                        "rangelength":"密码长度在6-12之间！"
                    },

                }
            });
        });

        $(function(){
            $("#reform").validate({
                rules:{
                    "username":{
                        "required":true,
                        "checkusername":true
                    },
                    "birth":{
                        "required":true
                    },
                    "phone":{
                        "required":true,
                        "isphone" :true
                    },
                    "email":{
                        "required":true
                    },
                    "address":{
                        "required":true
                    },
                    "emp":{
                        "required":true
                    },
                    "password":{
                        "required":true,
                        "rangelength":[6,12]
                    },
                    "repassword":{
                        "required":true,
                        "rangelength":[6,12]
                    },
                    "vcode":{
                        "required":true,
                        "checkcode":true
                    }
                },
                messages:{
                    "username":{
                        "required":"用户名不能为空！",
                        "checkusername":"用户名已存在！"
                    },
                    "password":{
                        "required":"密码不能为空！",
                        "rangelength":"密码长度在6-12之间！"
                    },
                    "phone":{
                        "required":"手机号不能为空",
                        "isphone" :"手机号格式不正确！"
                    },
                    "vcode":{
                        "required":"验证码不能为空！",
                        "checkcode":"验证码不正确！"
                    }
                }
            });
        });
    </script>
    <style>
        .bg {
            background:url('img/bai.jpg') no-repeat center fixed;
            background-size:100% 100%;
        }
    </style>
    <script>
        $(function () {
            if ("${success}"!=""){
                alert(${success})
            }
        })
    </script>
</head>
<body class="bg">
<a type="button" class="btn btn-default btn-lg" href="/index?method=index">返回首页
</a>
    <div class="container">

        <div id="logindiv" class="row" style="margin-top: 0px">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center">
                <img id="moveimg" class="animated bounceInDown " width="200px" height="100px" src="https://www.baidu.com/img/dong_6b43e987ca87c26dd0ad5fc0ebffb871.gif">
                <h1 id="moveh1" class="animated bounceInRight ">请登陆</h1>
                <div id="movediv" class="animated bounceInUp " style="width: 100%; border: 1px solid #E7E7E7;padding: 20px 0 20px 30px;border-radius: 5px;margin-top: 10px;background-color:rgba(255,255,255,0.3) ">
                    <form action="/user" class="form-horizontal" method="post" id="form">
                        <div style="display: none;">
                            <input type="text" name="method" value="login"/>
                        </div>
                        <div class="form-group ">
                            <label for="username" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" placeholder="请输入用户名" name="username" value="村长">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="password" placeholder="请输入密码" name="password" value="123456">
                            </div>
                        </div>

                        </div>

                        <div class="form-group">
                            <c:if test="${!empty error }">
                                <span style="color: #FF0000;">${error }</span>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <div class=" col-sm-offset col-sm-10" >
                                <button class="btn btn-primary btn-sm" >&nbsp;&nbsp;&nbsp;&nbsp;登陆&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                <a href="javascript:void(0)" class="btn btn-primary btn-sm" onclick="register()">&nbsp;&nbsp;&nbsp;&nbsp;注册&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            </div>
                        </div>
                        <script>
                            $(function () {
                                $("#regisdiv").hide();
                            })
                            function register() {
                                $("#movediv").attr("class","animated slideOutLeft")
                                $("#moveh1").attr("class","animated slideOutLeft")
                                $("#moveimg").attr("class","animated slideOutLeft")
                                rechangeImg();
                                $('#logindiv').oneTime('0.4s',function(){
                                    $("#logindiv").hide();
                                    $("#regisdiv").show();
                                    $("#removediv").attr("class","animated bounceInUp ")
                                    $("#removeh1").attr("class","animated bounceInRight ")
                                    $("#removeimg").attr("class","animated bounceInDown ")
                                });
                            }
                        </script>
                    </form>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>


        <div id="regisdiv" class="row" style="margin-top: 0px">
            <div class="col-md-2"></div>
            <div class="col-md-8 text-center">
                <img id="removeimg" class="animated bounceInDown" width="200px" height="100px" src="https://www.baidu.com/img/dong_6b43e987ca87c26dd0ad5fc0ebffb871.gif">
                <h1 id="removeh1" class="animated bounceInRight">请注册</h1>
                <div id="removediv" class="animated bounceInUp" style="width: 100%; border: 1px solid #E7E7E7;padding: 20px 0 20px 30px;border-radius: 5px;margin-top: 10px;background-color:rgba(255,255,255,0.3) ">
                    <form action="/user" class="form-horizontal" method="post" id="reform">
                        <div style="display: none;">
                            <input type="text" name="method" value="register"/>
                        </div>
                        <div class="form-group">
                            <label for="reusername" class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="reusername" placeholder="请输入用户名" name="username" value="123456">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="password" class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="repassword" placeholder="请输入密码" name="password" value="123456">
                            </div>
                        </div>

                        <div class="form-group " >
                            <label for="repasresword" class="col-sm-2 control-label">确认密码</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="repasresword" placeholder="请输入密码" name="repassword" value="123456">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="birth" class="col-sm-2 control-label">出生日期</label>
                            <div class="col-sm-6">
                                <input  type="date" class="form-control" id="birth"  placeholder="请输入出生日期" name="birth">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label  class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-2 " >
                                <select class="form-control" name="gender" id="gender">
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group " >
                            <label for="email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-6">
                                <input  type="email" class="form-control" id="email"  placeholder="请输入邮箱" name="email">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="phone" class="col-sm-2 control-label">手机号</label>
                            <div class="col-sm-6">
                                <input  type="text" class="form-control" id="phone"  placeholder="请输入手机号" name="phone">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="emp" class="col-sm-2 control-label">职业</label>
                            <div class="col-sm-6">
                                <input  type="text" class="form-control" id="emp"  placeholder="请输入职业" name="emp">
                            </div>
                        </div>
                        <div class="form-group " >
                            <label for="address" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-6">
                                <input  type="text" class="form-control" id="address" placeholder="请输入地址" name="address">
                            </div>
                        </div>

                        <script type="text/javascript">
                            function rechangeImg(){
                                var time = new Date().getTime();
                                $("#reimg").attr("src","${pageContext.request.contextPath}/checkimg?"+time);
                            }
                        </script>
                        <div class="form-group">
                            <c:if test="${!empty error }">
                                <span style="color: #FF0000;">${error }</span>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox" name="autologin">自动登录</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label><input type="checkbox" name="markusername">记住用户名</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset col-sm-10">
                                <button class="btn btn-primary btn-sm" >&nbsp;&nbsp;&nbsp;&nbsp;立即注册&nbsp;&nbsp;&nbsp;&nbsp;</button>
                                <a class="btn btn-primary btn-sm" onclick="tologin()">&nbsp;&nbsp;&nbsp;&nbsp;登陆&nbsp;&nbsp;&nbsp;&nbsp;</a>
                            </div>
                        </div>
                        <script>
                            function tologin(){
                                $("#removediv").attr("class","animated  slideOutLeft")
                                $("#removeh1").attr("class","animated  slideOutLeft")
                                $("#removeimg").attr("class","animated  slideOutLeft")
                                changeImg()
                                $('#regisdiv').oneTime('0.4s',function(){
                                    $("#regisdiv").hide();
                                    $("#logindiv").show();
                                    $("#movediv").attr("class","animated bounceInUp ")
                                    $("#moveh1").attr("class","animated bounceInRight ")
                                    $("#moveimg").attr("class","animated bounceInDown ")
                                });
                            }
                        </script>
                    </form>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</body>
</html>
