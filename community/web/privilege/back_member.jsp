<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>layout 后台大布局 - Layui</title>
  <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="js/scripts.min.js"></script>
    <script src="js/main.min.js"></script>
    <script src="js/custom.js"></script>
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="../css/vendor/bootstrap.min.css">
</head>
<!-- 内容主体区域 -->
    <fieldset class="layui-elem-field" style="width:99%;">
        <legend>---${title}---</legend>
        <div class="layui-field-box" >
            <form class="layui-form" action="" style="margin-left: -700px;">
                <div class="layui-form-item" style="text-align:center;">
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input autocomplete="off" class="layui-input" placeholder="请输入名称" type="text" name="name" value="">
                        </div>
                    </div>
                    <div class="layui-inline" style="text-align:left;">
                        <div class="layui-input-inline">
                            <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                        </div>
                    </div>
                </div>
            </form>
            <hr>
            <div style="overflow:scroll;">

            <table class="table text-nowrap" style="overflow-y:scroll;" border="0.5px">
                <colgroup>
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                    <col width="200px">
                </colgroup>
                <thead>
                <tr>
                    <th width="200px">活动标题</th>
                    <th>报名结束时间</th>
                    <th>活动内容</th>
                    <th>创建时间</th>
                    <th>最大报名人数</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>活动类型</th>
                    <th>交通方式</th>
                    <th style="text-align:center;">操作</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="act" items="${pageBean.rows}">
                        <tr>
                            <td>${act.atitle}</td>
                            <td>${act.apply_endtime}</td>
                            <td>${act.content}</td>
                            <td>${act.createtime}</td>
                            <td>${act.acount}</td>
                            <td>${act.starttime}</td>
                            <td>${act.endtime}</td>
                            <td>${act.atype.typename}</td>
                            <td>${act.transport.typename}</td>

                            <td class="text-center">
                                    <a id="editbtn${act.id}" class="btn btn-primary">
                                        &#xe642;编辑
                                    </a>
                                    <a id="delbtn${act.id}" class="btn btn-danger"  dw-title="小明">
                                        &#xe640;删除
                                    </a>
                                <script>
                                    $("#editbtn${act.id}").click(function () {
                                        location.href="/activity?method=toEditActivity&id="+${act.id}
                                    })
                                    $("#delbtn${act.id}").click(function () {
                                        location.href="/activity?method=delActivity&id="+ ${act.id}+
                                        "&currentPage="+
                                        ${pageBean.currentPage}
                                    })
                                </script>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
            <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
                <ul class="pagination" style="text-align: center; margin-top: 10px;">
                    <!-- 上一页 -->
                    <c:if test="${pageBean.currentPage==1 }">
                        <li class="disabled">
                            <a href="javascript:void(0);" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=1 }">
                        <li>
                            <a href="${pageContext.request.contextPath}/activity?method=hasPutActivity
						&currentPage=${pageBean.currentPage-1 }"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <!-- 显示每一页 -->
                    <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
                        <c:if test="${page==pageBean.currentPage }">
                            <li class="active"><a href="javascripts:void(0);">${page }</a></li>
                        </c:if>
                        <c:if test="${page!=pageBean.currentPage }">
                            <li><a href="${pageContext.request.contextPath }/activity?method=hasPutActivity
						&currentPage=${page}">${page }</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 下一页 -->
                    <c:if test="${pageBean.currentPage==pageBean.totalPage }">
                        <li class="disabled">
                            <a href="javascript:void(0);" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/activity?method=hasPutActivity
					&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </fieldset>
</html>