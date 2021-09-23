<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/20
  Time: 2:38 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.7;
        }
    </style>
    <title>修改商品信息</title>
</head>
<body>
<div class="box">
    <h3>修改商品信息</h3>
    <form action="/souvenir/editSouvenir" method="post" enctype="multipart/form-data">
        <table class="form-table">
            <tr>
                <td>商品图片</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="<%=basePath%>img/${souvenir.s_img}" width="100px" height="100px"></p>
                    <input required="required" id="filed" type="file" name="file" style="width:25%; float:left;"/>
                    <input value="${souvenir.s_img}" type="hidden" name="oldImg">
                </td>
            </tr>
            <tr>
                <td>商品名</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_name" placeholder="填写商品名" value="${souvenir.s_name}">
                </td>
            </tr>
            <tr>
                <td>价格</td>
                <td colspan="3" class="control">
                    <input type="text" name = "s_price" placeholder="填写价格" value="${souvenir.s_price}">
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_note" placeholder="填写备注" value="${souvenir.s_note}">
                </td>
            </tr>
            <tr>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <f:formatDate value="${souvenir.s_addTime}" pattern="yyyy-MM-dd" var="addTime"/>
                    <input readonly="readonly" type="text" name="s_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <f:formatDate value="${souvenir.s_uptime}" pattern="yyyy-MM-dd" var="upTime"/>
                    <input readonly="readonly" type="text" name="s_uptime" value="${upTime}">
                </td>
            </tr>
            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_likes" readonly="readonly" value="${souvenir.s_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_views" readonly="readonly" value="${souvenir.s_views}">
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <input type="hidden" name="s_id" value="${souvenir.s_id}">
    </form>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/showImg.js"></script>
</body>
</html>