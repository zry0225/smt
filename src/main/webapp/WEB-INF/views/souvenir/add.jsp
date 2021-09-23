<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/20
  Time: 4:14 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
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
    <title>添加商品信息</title>
</head>
<body>
<div class="box">
    <h3>添加商品信息</h3>
    <form action="/souvenir/addSouvenir" method="post" enctype="multipart/form-data">
        <table class="form-table">
            <tr>
                <td>商品图片</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="" width="100px" height="100px"></p>
                    <input required="required" id="filed" type="file" name="file" style="width:25%; float:left;"/>
                </td>
            </tr>
            <tr>
                <td>商品名</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_name" placeholder="填写商品名">
                </td>
            </tr>
            <tr>
                <td>价格</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_price" placeholder="填写价格">
                </td>
            </tr>
            <tr>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <f:formatDate value="${souvenir.s_addTime}" var="addTime" pattern="yyyy-MM-dd"/>
                    <input readonly="readonly" type="text" name="s_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <f:formatDate value="${souvenir.s_uptime}" var="uptime" pattern="yyyy-MM-dd"/>
                    <input readonly="readonly" type="text" name="s_uptime" value="${uptime}">
                </td>
            </tr>
            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="s_likes" value="${souvenir.s_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="s_views" value="${souvenir.s_views}">
                </td>
            </tr>
            <tr>
                <td>备注说明</td>
                <td colspan="3" class="control">
                    <input type="text" name="s_note" placeholder="填写备注" style="width: 100%">
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/showImg.js"></script>
</body>
</html>
