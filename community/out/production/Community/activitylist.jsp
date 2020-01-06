<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <meta name="description" content="">
    <meta name="keywords" content="">
<script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <script src="js/vendor/html5shiv.min.js"></script>
    <script src="js/vendor/respond.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%--列表显示--%>
<section class="probootstrap-section" style="top:65px;">
    <div class="container">
        <div class="row">
            <c:forEach items="${pageBean.rows}" var="ac" varStatus="i">
                <div class="col-md-2 col-sm-3 col-xs-6 col-xxs-12 probootstrap-animate" data-animate-effect="fadeIn">
                    <div class="probootstrap-image-text-block probootstrap-cause">
                        <figure>
                            <img src="img/img_sm_1.jpg" alt="Free Bootstrap Template by sc.chinaz.com" class="img-responsive">
                        </figure>
                        <div class="probootstrap-cause-inner">
                            <div class="progress">
                                <div id="xxx"+${i.index} class="progress-bar progress-bar-s2" data-percent="${(ac.hascount*100-(ac.hascount*100%ac.acount))/ac.acount}"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6 probootstrap-raised"><span style="font-size: 10px;color: gray;">已报名:</span> <span style="font-size: 15px">${ac.hascount}人</span></div>
                                <div class="col-md-6 col-sm-6 col-xs-6 probootstrap-goal"><span style="font-size: 10px;color: gray;">限:</span><span style="font-size: 15px">${ac.acount}人</span></div>
                            </div>
                            <a href="privilege/activityinfo.jsp" style="font-size: 12px">${ac.atitle}</a>
                            <div style="margin-bottom: 0px;" ><i class="icon-calendar"></i> <span style="font-size: 13px;"><c:if test="${ac.endTimeStr==null}">距离结束还有XX天HH小时</c:if>${ac.endTimeStr}</span></div>
                            <a href="privilege/activityinfo.jsp" class="btn btn-primary btn-black" style="margin-bottom: -10px">立即参加</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
                        <a href="${pageContext.request.contextPath}/activity?method=activityPageList
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
                        <li><a href="${pageContext.request.contextPath }/activity?method=activityPageList
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
                        <a href="${pageContext.request.contextPath}/activity?method=activityPageList
					&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp"></jsp:include>
<script src="js/scripts.min.js"></script>
<script src="js/main.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>