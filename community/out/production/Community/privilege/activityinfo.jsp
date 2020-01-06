
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <link rel="stylesheet" href="../css/styles-merged.css">
    <link rel="stylesheet" href="../css/style.min.css">
    <link rel="stylesheet" href="../css/custom.css">


    <script src="../js/vendor/html5shiv.min.js"></script>
    <script src="../js/vendor/respond.min.js"></script>
    <script src="../js/starScore.js"></script>
    <script src="../javascript/jquery.min.js"></script>
    <style>
        *{
            margin:0;
            padding:0;
        }
        .starts{
            padding-left: 40%;
            padding-top:100px;
        }
        .starts ul{
            float:left;
        }
        .starts ul li{
            list-style: none;
            width:32px;
            height:21px;
            float:left;
            background:url(../images/stark2.png) no-repeat;

        }
        .starts ul li.on{
            background:url(../images/stars2.png) no-repeat;
        }
        .starts ul span{
            display:inline;
            float:left;
            padding-left:10px;
            height:21px;
            line-height:21px;
        }
    </style>

</head>
<%--完成--%>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<%--活动内容--%>
<section class="probootstrap-hero probootstrap-hero-inner" style="background-image: url(../img/hero_bg_bw_1.jpg)"  data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="probootstrap-slider-text probootstrap-animate" data-animate-effect="fadeIn">
                    <h1 class="probootstrap-heading probootstrap-animate">动态显示活动名称</h1>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="probootstrap-section">
    <div class="container">
        <div class="row probootstrap-gutter60">
            <%--活动简图--%>
            <div class="col-md-4 col-sm-4 probootstrap-animate" data-animate-effect="fadeIn">
                <div class="probootstrap-image-text-block probootstrap-cause">
                    <figure>
                        <img src="../img/img_sm_1.jpg" alt="Free Bootstrap Template by sc.chinaz.com" class="img-responsive">
                    </figure>
                    <div class="probootstrap-cause-inner">
                        <div class="progress">
                            <div class="progress-bar progress-bar-s2" data-percent="99"></div>
                        </div>

                        <div class="row mb30">
                            <div class="col-md-6 col-sm-6 col-xs-6 probootstrap-raised">Raised: <span class="money">$49,112</span></div>
                            <div class="col-md-6 col-sm-6 col-xs-6 probootstrap-goal">Goal: <span class="money">$50,000</span></div>
                        </div>

                        <h2><a href="#">Help Children To Get Food</a></h2>
                        <div class="probootstrap-date"><i class="icon-calendar"></i> 2 hours remaining</div>

                        <p><a href="#" class="btn btn-primary btn-black">Donate Now!</a></p>

                    </div>
                        <div class="starts" style="margin-top: -35px;">
                            <ul id = "pingStar" style="margin-top: -50px; margin-left:-135px;float: left;">
                                <li rel = "1" title = "特别差，给1分"></li>
                                <li rel = "2" title = "很差，给2分"></li>
                                <li rel = "3" title = "一般，给3分"></li>
                                <li rel = "4" title = "很好，给4分"></li>
                                <li rel = "5" title = "非常好，给5分"></li>
                                <span id="dir">请打分～～～</span>
                            </ul>
                            <input type="hidden" value="" id = "startP" />
                        </div>
                        <button id="tijiao" class="btn btn-primary" style="margin-left: 0;"  onclick="tijiao()">提交</button>
                        <script>
                            function tijiao(){
                                var score = $('#startP').val();
                                score = score==null||score==''?0:score;
                                $.post("/activity?method=vote&score="+score,
                                    function(data){
                                        alert("已提交！"+score+"星")
                                        $('#tijiao').html("已提交");
                                        $('#tijiao').prop("disabled",true);
                                    });
                            }
                            window.onload = function(){
                                var s = document.getElementById("pingStar");
                                m = document.getElementById("dir"),
                                    n = s.getElementsByTagName("li"),
                                    input = document.getElementById("startP");//保存所选值
                                clearAll = function(){
                                    for(var i = 0;i < n.length;i++){
                                        n[i].className = "";
                                    }
                                };
                                for(var i = 0;i < n.length;i++){
                                    n[i].onclick = function(){
                                        var q = this.getAttribute("rel");
                                        clearAll();
                                        input.value = q;
                                        for(var i = 0;i < q;i++){
                                            n[i].className = "on";
                                        }
                                        m.innerHTML = this.getAttribute("title");
                                    };
                                    n[i].onmouseover = function(){
                                        var q = this.getAttribute("rel");
                                        clearAll();
                                        for(var i = 0;i < q;i++){
                                            n[i].className = "on";
                                        }
                                        m.innerHTML = this.getAttribute("title");
                                    };
                                    n[i].onmouseout = function(){
                                        clearAll();
                                        for(var i = 0;i < input.value;i++){
                                            n[i].className = "on";
                                        }

                                    }
                                }
                            }

                        </script>
                </div>
            </div>
            <%--活动详情--%>
            <div class="col-md-8 col-sm-8 probootstrap-animate">
                <h2>动态展示</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloribus illo praesentium tempora, laboriosam. Ipsum nisi, atque quos quaerat veritatis fugit esse maiores id minus, rem similique dolorum culpa aliquid odit quasi obcaecati vero quod soluta magnam tempore, eligendi eveniet ex numquam dicta. Autem maiores soluta, beatae eius est, consectetur eveniet ipsum architecto, eligendi eos quod qui. Voluptatem, ad modi facilis.</p>
                <p>Veniam reiciendis vel in consequatur fugiat eum culpa fuga, ratione consequuntur vitae blanditiis! Consequuntur iste amet ipsa, totam et velit sapiente culpa fugiat. Ex iste dignissimos voluptatibus, consectetur. Placeat nobis, exercitationem incidunt quidem aut aperiam earum eos! Laborum consequatur debitis aspernatur illo minus minima veritatis obcaecati sed maiores quasi eaque libero hic maxime, in, quibusdam corrupti quas facilis neque dignissimos.</p>
                <div class="row">
                    <div class="col-md-12">
                        <p><a href="../img/img_sq_6.jpg" class="image-popup"><img src="../img/img_sq_6.jpg" alt="Free Bootstrap Template by sc.chinaz.com" class="img-responsive"></a></p>
                    </div>
                </div>
                <button id="baoming" class="btn btn-primary" onclick="baoming()">报名</button>

            </div>
        </div>
    </div>
</section>
<div class="container">

</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="../js/scripts.min.js"></script>
<script src="../js/main.min.js"></script>
<script src="../js/custom.js"></script>
<script>
        function baoming(){
            alert("已报名！");
            $.post("/activity?method=baoming",
                function(data){
                    $('#baoming').html("已报名");
                    $('#baoming').attr("disabled",true);
                });
        }
</script>
</body>
</html>
