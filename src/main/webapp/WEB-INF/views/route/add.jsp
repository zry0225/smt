<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/29
  Time: 7:15 下午
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
    <title>添加路线</title>
</head>
<body>
<div class="box">
    <h3>添加路线</h3>
    <form action="/route/addRoute" method="post">
        <table class="form-table">
            <tr>
                <td>路线名</td>
                <td colspan="3" class="control">
                    <input type="text" name="ri_name" placeholder="填写路线名" style="width: 100%;">
                </td>
            </tr>

            <tr>
                <td>类型</td>
                <td colspan="3" class="control">
                    <input type="text" name="ri_type" placeholder="填写类型">
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="ri_note" placeholder="填写备注">${route.ri_note}</textarea>
                </td>
            </tr>
            <tr>
                <td>浏览量</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ri_views" value="${route.ri_views}">
                </td>
            </tr>
            <tr>
                <td>收藏量</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="ri_collect" value="${route.ri_collect}">
                </td>
            </tr>
            <tr>
                <td>路线内容</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="ri_content" placeholder="填写路线内容"></textarea>
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