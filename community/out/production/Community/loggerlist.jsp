<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
    <script src="js/vendor/html5shiv.min.js"></script>
    <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<jsp:include page="header.jsp"></jsp:include>
<%--首页图片--%>
<section class="probootstrap-hero probootstrap-hero-inner" style="background-image: url(img/hero_bg_bw_1.jpg)"  data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="probootstrap-slider-text probootstrap-animate" data-animate-effect="fadeIn">
                    <h1 class="probootstrap-heading probootstrap-animate">公益活动 &amp;活动列表  <br><span>等待你的参与,让你的Drop点燃我！</span></h1>
                </div>
            </div>
        </div>
    </div>
</section>
<%--日志列表--%>
<section class="probootstrap-section">
    <div class="container">
        <jsp:include page="demo.jsp"></jsp:include>
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
                        <a href="${pageContext.request.contextPath}/logger?method=loggerList
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
                        <li><a href="${pageContext.request.contextPath }/logger?method=loggerList
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
                        <a href="${pageContext.request.contextPath}/logger?method=loggerList
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