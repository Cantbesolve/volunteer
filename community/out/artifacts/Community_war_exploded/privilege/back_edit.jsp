<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../javascript/jquery.min.js"></script>
    <style>
        .layui-form-label{
            width:90px;
        }
    </style>

</head>
<div class="layui-container">
    <div class="layui-row">
        <div class="layui-col-lg12">
            <fieldset class="layui-elem-field">
                <legend>---
                    <c:if test="${title==null||title==''}">用户添加活动</c:if>
                    <c:if test="${title!=null&&title!=''}">${title}</c:if>
                    ---</legend>
                <div class="layui-field-box">
                    <form class="layui-form" action="/activity" method="post">
                        <input type="hidden" name="method" value="editActivity">
                        <input type="hidden" name="acode" value="${activity.acode}">
                        <input type="hidden" name="createtime" value="${activity.createtime}">

                        <input type="hidden" name="id" value="${activity.id}">
                        <div class="layui-form-item">
                            <label class="layui-form-label">活动标题</label>
                            <div class="layui-input-block" style="margin-left: 120px">
                                <input value="${activity.atitle}" type="text" name="atitle" required  lay-verify="required" placeholder="请输入活动标题" autocomplete="off" class="layui-input" style="width: 600px">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >最大报名人数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.acount}" type="number" name="acount" required  lay-verify="required" placeholder="请输入最大报名人数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >已报名人数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.hascount}" type="number" name="hascount" required  lay-verify="required" placeholder="请输入最大报名人数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">报名结束时间</label>
                            <div class="layui-input-inline">
                                <input value="${activity.apply_endtime}" type="text" name="apply_endtime" id="test5" class="layui-input" required lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">活动开始时间</label>
                            <div class="layui-input-inline">
                                <input value="${activity.starttime}" type="text" name="starttime" id="test6" required  lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">活动结束时间</label>
                            <div class="layui-input-inline">
                                <input value="${activity.endtime}" type="text" name="endtime" id="test7" required  lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label" >是否付费</label>
                            <div class="layui-input-inline">
                                <select id="ban" name="ban" lay-verify="required" >
                                    <option value=""></option>
                                    <c:if test="${activity.ban==true}">
                                        <option value="1" selected="selected">禁止</option>
                                        <option value="0">未禁止</option>
                                    </c:if>
                                    <c:if test="${activity.ban==false}">
                                        <option value="1">禁止</option>
                                        <option value="0" selected="selected">未禁止</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >是否付费</label>
                            <div class="layui-input-inline">
                                <select id="report" name="report" lay-verify="required" >
                                    <option value=""></option>
                                    <c:if test="${activity.report==true}">
                                        <option value="1" selected="selected">被举报</option>
                                        <option value="0">未被举报</option>
                                    </c:if>
                                    <c:if test="${activity.report==false}">
                                        <option value="1">被举报</option>
                                        <option value="0" selected="selected">未被举报</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >是否付费</label>
                            <div class="layui-input-inline">
                                <select id="pay" name="pay" lay-verify="required" >
                                    <option value=""></option>
                                    <c:if test="${activity.pay==true}">
                                        <option value="1" selected="selected">付费</option>
                                        <option value="0">不付费</option>
                                    </c:if>
                                    <c:if test="${activity.pay==false}">
                                        <option value="1">付费</option>
                                        <option value="0" selected="selected">不付费</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div id="show" class="layui-form-item" >
                            <label class="layui-form-label" >活动费用</label>
                            <div class="layui-input-inline">
                                <input value="${activity.apply_fee}" type="number" name="apply_fee" placeholder="请输入活动费用（非必填）" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >活动地点</label>
                            <div class="layui-input-inline">
                                <input value="${activity.site}" type="text" name="site" required  lay-verify="required" placeholder="请输入活动地点" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">活动内容</label>
                            <div class="layui-input-block">
                                <textarea  name="content" placeholder="请输入内容" required lay-verify="required" class="layui-textarea" style="width: 400px;text-align: left">${activity.content}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-inline">
                                <textarea name="remark" placeholder="请输入内容(可不填)" class="layui-textarea" style="width: 400px;">${activity.remark}</textarea>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >一星评价数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.onestar_count}" type="number" name="onestar_count" required  lay-verify="required" placeholder="请输入一星评价数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >二星评价数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.twostar_count}" type="number" name="twostar_count" required  lay-verify="required" placeholder="请输入一星评价数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >三星评价数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.threestar_count}" type="number" name="threestar_count" required  lay-verify="required" placeholder="请输入一星评价数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >四星评价数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.fourstar_count}" type="number" name="fourstar_count" required  lay-verify="required" placeholder="请输入一星评价数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >五星评价数</label>
                            <div class="layui-input-inline">
                                <input value="${activity.fivestar_count}" type="number" name="fivestar_count" required  lay-verify="required" placeholder="请输入一星评价数" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">活动类型</label>
                            <div class="layui-input-inline">
                                <select id="selectActType" name="atype" >
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">交通方式</label>
                            <div class="layui-input-inline">
                                <select id="selectTransport" name="transport">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">活动状态</label>
                            <div class="layui-input-inline">
                                <select id="status" name="status">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>


                        <input type="hidden" name="createby" value="${activity.createby.id}">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="../javascript/jquery.min.js"></script>
<script type="text/javascript" src="../layui/layui.js"></script>
<script type="text/javascript" src="../javascript/dw_form_submit.js"></script>
<script src="../layui/layer.js"></script>

<script>
    layui.use('form', function(){
        var form = layui.form,layer=layui.layer;
        //监听提交
        form.on('submit(formDemo)', function(data){
           return true;
        });
    });
</script>
<script>
    // $(function(){
        layui.use('laydate', function() {
            var laydate = layui.laydate;
            //日期时间选择器
            laydate.render({
                elem: '#test5'
                , type: 'datetime'
            });laydate.render({
                elem: '#test6'
                , type: 'datetime'
            });laydate.render({
                elem: '#test7'
                , type: 'datetime'
            });
        })

    $.ajax({
        async: false,
        url: "/activity?method=getActivityType",
        context: {},
        success: function (data) {
            $.each(data, function (index) {
                var id = data[index].id;
                var text = data[index].typename;
                var aaa = ${activity.atype.id}+"";
                var j = data[index].id+"";
                if(aaa==j){
                    $("#selectActType").append("<option value='"+id+"' selected='selected'>"+text+"</option>");
                }else{
                    $("#selectActType").append("<option value='"+id+"'>"+text+"</option>");
                }
            });
        }
    });
    $.ajax({
        async: false,
        url: "/activity?method=getActivityTransport",
        context: {},
        success: function (data) {
            $.each(data, function (index) {
                var id = data[index].id;
                var text = data[index].typename;
                var aaa = ${activity.transport.id}+"";
                var bbb = data[index].id+"";
                if(aaa==bbb){
                    $("#selectTransport").append("<option value='"+id+"' selected='selected'>"+text+"</option>");
                }else{
                    $("#selectTransport").append("<option value='"+id+"'>"+text+"</option>");
                }
            });
        }
    });

</script>
</html>