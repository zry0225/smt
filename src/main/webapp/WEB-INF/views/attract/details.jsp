<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/22
  Time: 10:51 下午
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
        input{
            width: 100%;
        }
    </style>
    <title>景区详情</title>
</head>
<body>
<div class="box">
    <h3>景区详情</h3>
    <form action="" method="post" enctype="multipart/form-data">
        <table class="form-table">
            <tr>
                <td>景区图片</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="<%=basePath%>img/${attraction.a_img}" width="100px" height="100px"></p>
                </td>
            </tr>
            <tr>
                <td>景区名</td>
                <td colspan="3" class="control">
                    <input type="text" name="a_name" readonly="readonly" value="${attraction.a_name}">
                </td>
            </tr>
            <tr>
                <td>星级</td>
                <td class="control">${attraction.a_level=="1"?"一星":attraction.a_level=="2"?"二星":
                        attraction.a_level=="3"?"三星":
                                attraction.a_level=="4"?"四星":"五星"}</td>
            </tr>
            <tr>
                <td>景区信息</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="a_information" readonly="readonly">${attraction.a_information}</textarea>
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td colspan="3" class="control">
                    <input style="width: 100%" type="text" name="a_note" readonly="readonly" value="${attraction.a_note}">
                </td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td colspan="3" class="control">
                    <input type="text" name="a_phone" readonly="readonly" value="${attraction.a_phone}">
                </td>
            </tr>
            <tr>
            </tr>

            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="a_likes" value="${attraction.a_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="a_views" value="${attraction.a_views}">
                </td>
            </tr>
        </table>
        <div class="buttons">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
    </form>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/showImg.js"></script>
</body>
</html>