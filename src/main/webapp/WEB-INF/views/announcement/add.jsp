<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/24
  Time: 9:02 下午
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
    <title>添加公告</title>
</head>
<body>
<div class="box">
    <h3>添加公告</h3>
    <form action="/announce/addAnnounce" method="post" enctype="multipart/form-data">
        <table class="form-table">
            <tr>
                <td>主要图片</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="" width="100px" height="100px"></p>
                    <input required="required" id="filed" type="file" name="file" style="width:25%; float:left;"/>
                </td>
            </tr>
            <tr>
                <td>公告标题</td>
                <td colspan="3" class="control">
                    <input type="text" name="ac_title" placeholder="填写标题" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${announce.ac_addTime}" pattern="yyyy-MM-dd" var="addTime"/>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ac_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${announce.ac_alter}" pattern="yyyy-MM-dd" var="alter"/>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ac_alter" value="${alter}">
                </td>
            </tr>
            <tr>
                <td>作者</td>
                <td colspan="3" class="control">
                    <input type="text" name="ac_author" placeholder="填写作者">
                </td>
            </tr>
            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ac_likes" value="${announce.ac_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ac_views" value="${announce.ac_views}">
                </td>
            </tr>
            <tr>
                <td>公告内容</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="ac_context" placeholder="填写公告内容"></textarea>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input onclick="clickMe();" class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/showImg.js"></script>
</body>
</html>