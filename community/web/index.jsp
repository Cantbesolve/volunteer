<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<link rel="stylesheet" href="css/styles-merged.css">
	<link rel="stylesheet" href="css/style.min.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="js/scripts.min.js"></script>
	<script src="js/main.min.js"></script>
	<script src="js/custom.js"></script>
</head>
<body>
<%--头部--%>
<jsp:include page="header.jsp"></jsp:include>
<%--主页图片--%>
<section class="probootstrap-hero" style="background-image: url(img/hero_bg_bw_1.jpg)"  data-stellar-background-ratio="0.5">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="probootstrap-slider-text probootstrap-animate" data-animate-effect="fadeIn">
					<h1 style="margin-top: -30px" class="probootstrap-heading probootstrap-animate">COMMUNITY
						<span style="margin: 10px; margin-right:50px;">慈善是高尚人格的真实标记</span></h1>
					<p class="probootstrap-animate"><a href="activitylist.jsp" class="btn btn-primary btn-lg">立即成为志愿者</a></p>
				</div>
			</div>
		</div>
	</div>
	<div class="probootstrap-service-intro">
		<div class="container">
			<div class="probootstrap-service-intro-flex">
				<div class="item probootstrap-animate" data-animate-effect="fadeIn">
					<div class="icon">
						<i class="icon-wallet"></i>
					</div>
					<div class="text">
						<h2>参加公益活动</h2>
						<p>人到了一定的年龄，从事公益事业，往往能感受到自己的价值，获得内心的平静。这种平静对于中年人是奢侈品，所谓“赠人玫瑰，手有余香”。</p>
						<p><a href="activity?method=activityPageList">了解更多</a></p>
					</div>
				</div>
				<div class="item probootstrap-animate" data-animate-effect="fadeIn">
					<div class="icon">
						<i class="icon-heart"></i>
					</div>
					<div class="text">
						<h2>爱心人士中心</h2>
						<p>要坚守公益的理念，就要坚守平常心，保有精神的明月清泉，守护心灵的空间。 </p>
						<p><a href="#">了解更多</a></p>
					</div>
				</div>
				<div class="item probootstrap-animate" data-animate-effect="fadeIn">
					<div class="icon">
						<i class="icon-graduation-cap"></i>
					</div>
					<div class="text">
						<h2>公益社区</h2>
						<p>看看孩子脸上那天真的微笑,我们又怎舍得让这份和平与安宁转瞬即逝呢?</p>
						<p><a href="loggerlist.jsp">了解更多</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%--最新活动--%>
<section class="probootstrap-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center section-heading probootstrap-animate" data-animate-effect="fadeIn">
				<h2>最新的故事，等待你来发现</h2>
				<p class="lead">世界的改变不是因为少数人做了很多，而是每个人都做了一点点。</p>
			</div>
		</div>
		<div class="row" id="newActivity">
			<c:forEach begin="1" end="4" step="1">
				<div class="col-md-3 col-sm-3 col-xs-6 col-xxs-12 probootstrap-animate" data-animate-effect="fadeIn">
					<div class="probootstrap-image-text-block probootstrap-cause">
						<figure>
							<img src="img/img_sm_1.jpg" class="img-responsive">
						</figure>
						<div class="probootstrap-cause-inner">
							<div class="progress">
								<div class="progress-bar progress-bar-s2" data-percent="1"></div>
							</div>
							<div class="row mb30">
								<div class="col-md-6 col-sm-6 col-xs-6 probootstrap-raised"><span style="font-size: 20px;color: gray;">已报名:</span> <span class="money">1人</span></div>
								<div class="col-md-6 col-sm-6 col-xs-6 probootstrap-goal"><span style="font-size: 20px;color: gray;">限:</span><span class="money">100人</span></div>
							</div>
							<h2><a href="#">关爱贫困山区儿童活动</a></h2>
							<div class="probootstrap-date"><i class="icon-calendar"></i>距离活动报名结束还有dd天hh小时</div>
							<p>生如夏花之绚烂，死如秋叶之静美。</p>
							<p><a href="privilege/activityinfo.jsp" class="btn btn-primary btn-black">立即参与!</a></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-md-12">
				<p>孩子,让我和你风雨同舟!<a href="activitylist.jsp.html">了解更多活动</a></p>
			</div>
		</div>
	</div>
</section>
<%--评分高活动--%>
<section class="probootstrap-section" style="top: -110px;">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center section-heading probootstrap-animate" data-animate-effect="fadeIn">
				<h2>最感人的故事，等待你的加入</h2>
				<p class="lead">世界的改变不是因为少数人做了很多，而是每个人都做了一点点。</p>
			</div>
		</div>
		<div class="row" id="hotActivity">
			<c:forEach begin="1" end="4" step="1">
				<div class="col-md-3 col-sm-3 col-xs-6 col-xxs-12 probootstrap-animate" data-animate-effect="fadeIn">
					<div class="probootstrap-image-text-block probootstrap-cause">
						<figure>
							<img src="img/img_sm_1.jpg" class="img-responsive">
						</figure>
						<div class="probootstrap-cause-inner">
							<div class="progress">
								<div class="progress-bar progress-bar-s2" data-percent="1"></div>
							</div>
							<div class="row mb30">
								<div class="col-md-6 col-sm-6 col-xs-6 probootstrap-raised"><span style="font-size: 20px;color: gray;">已报名:</span> <span class="money">1人</span></div>
								<div class="col-md-6 col-sm-6 col-xs-6 probootstrap-goal"><span style="font-size: 20px;color: gray;">限:</span><span class="money">100人</span></div>
							</div>
							<h2><a href="#">关爱贫困山区儿童活动</a></h2>
							<div class="probootstrap-date"><i class="icon-calendar"></i>距离活动报名结束还有dd天hh小时</div>
							<p>生如夏花之绚烂，死如秋叶之静美。</p>
							<p><a href="privilege/activityinfo.jsp" class="btn btn-primary btn-black">立即参与!</a></p>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="row">
			<div class="col-md-12">
				<p>孩子,让我和你风雨同舟!<a href="activitylist.jsp.html">了解更多活动</a></p>
			</div>
		</div>
	</div>
</section>
<%--公益名人堂--%>
<section class="probootstrap-section probootstrap-bg probootstrap-section-dark" style="background-image: url(img/hero_bg_bw_1.jpg);top: -100px;"  data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center section-heading probootstrap-animate" data-animate-effect="fadeIn">
				<h2>日志点赞人气王</h2>
				<p class="lead"></p>
			</div>
		</div>
		<div class="row">
			<c:forEach begin="1" end="4" step="1">
				<div class="col-md-3">
					<div class="probootstrap-donors text-center probootstrap-animate">
						<figure class="media">
							<img src="img/person_6.jpg" class="img-responsive">
						</figure>
						<div class="text">
							<h3>赵本山</h3>
							<p class="donated"> <span class="money">$500.00</span></p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<%--精彩点赞评论--%>
<section class="probootstrap-section probootstrap-section-colored" >
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center section-heading probootstrap-animate">
				<h2>评论点赞人气王</h2>
				<p class="lead">生如夏花之绚烂，死如秋叶之静美。</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 probootstrap-animate">
				<div class="owl-carousel owl-carousel-testimony owl-carousel-fullwidth">
					<div class="item">

						<div class="probootstrap-testimony-wrap text-center">
							<figure>
								<img src="img/person_1.jpg" alt="Free Bootstrap Template by sc.chinaz.com">
							</figure>
							<blockquote class="quote">&ldquo;Design must be functional and functionality must be translated into visual aesthetics, without any reliance on gimmicks that have to be explained.&rdquo; <cite class="author"> &mdash; <span>Mike Fisher</span></cite></blockquote>
						</div>

					</div>
					<div class="item">
						<div class="probootstrap-testimony-wrap text-center">
							<figure>
								<img src="img/person_2.jpg" alt="Free Bootstrap Template by sc.chinaz.com">
							</figure>
							<blockquote class="quote">&ldquo;Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn’t really do it, they just saw something. It seemed obvious to them after a while.&rdquo; <cite class="author"> &mdash;<span>Jorge Smith</span></cite></blockquote>
						</div>
					</div>
					<div class="item">
						<div class="probootstrap-testimony-wrap text-center">
							<figure>
								<img src="img/person_3.jpg" alt="Free Bootstrap Template by sc.chinaz.com">
							</figure>
							<blockquote class="quote">&ldquo;I think design would be better if designers were much more skeptical about its applications. If you believe in the potency of your craft, where you choose to dole it out is not something to take lightly.&rdquo; <cite class="author">&mdash; <span>Brandon White</span></cite></blockquote>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<%--成功精彩故事--%>
<section class="probootstrap-half">
	<div class="image">
		<div class="image-bg">
			<img src="img/img_sq_5_big.jpg" >
		</div>
	</div>
	<div class="text">
		<div class="probootstrap-animate">
			<h3>看看我们的成果</h3>
			<p>你的负担将变成礼物，你受的苦将照亮你的路。你微微地笑着，不同我说什么话。而我觉得，为了这个，我已等待得很久了。有一个夜晚我烧毁了所有的记忆,从此我的梦就透明了,有一个早晨我扔掉了所有的昨天,从此我的脚步就轻盈了。Let life be beautiful like summer flowers and death like autumn leaves——生如夏花之绚烂，死如秋叶之静美。天空没有翅膀的痕迹，而我已飞过。</p>
			<p><a href="activitylist.jsp" class="btn btn-primary btn-lg">了解更多</a></p>
		</div>
	</div>
</section>
<%--尾部--%>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>