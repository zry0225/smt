<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/25
  Time: 8:14 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/main.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.7;
        }
    </style>
    <title>添加指南</title>
</head>
<body>
<div class="box">
    <h3>添加指南</h3>
    <form action="/guide/addGuide" method="post">
        <table class="form-table">
            <tr>
                <td>指南标题</td>
                <td colspan="3" class="control">
                    <input type="text" name="g_title" placeholder="填写标题" style="width: 100%;">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${guide.g_addTime}" pattern="yyyy-MM-dd" var="addTime"/>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="g_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${guide.g_updateTime}" pattern="yyyy-MM-dd" var="alter"/>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="g_updateTime" value="${alter}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="g_views" value="${guide.g_views}">
                </td>
            </tr>
            <tr>
                <td>指南内容</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="g_content" placeholder="填写指南内容"></textarea>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
</body>
</html>
