<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/25
  Time: 8:43 下午
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
        input{
            width: 100%;
        }
    </style>
    <title>指南详情</title>
</head>
<body>
<div class="box">
    <h3>指南详情</h3>
    <form action="" method="post">
        <table class="form-table">
            <tr>
                <td>标题</td>
                <td colspan="3" class="control">
                    <input type="text" name="g_title" readonly="readonly" value="${guide.g_title}">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${guide.g_addTime}" var="addTime" pattern="yyyy-MM-dd"/>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name = "g_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${guide.g_updateTime}" pattern="yyyy-MM-dd" var="updateTime"/>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="g_updateTime" value="${updateTime}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input  readonly="readonly" type="text" name="g_views" value="${guide.g_views}">
                </td>
            </tr>
            <tr>
                <td>指南内容</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="g_content" readonly="readonly">${guide.g_content}</textarea>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
</body>
</html>
