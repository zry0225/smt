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
    </style>
    <title>修改景区信息</title>
</head>
<body>
<div class="box">
    <h3>修改景区信息</h3>
    <form action="/attract/editAttractions" method="post" enctype="multipart/form-data">
        <table class="form-table">
            <tr>
                <td>景区图片</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="<%=basePath%>img/${attractions.a_img}" width="100px" height="100px"></p>
                    <input required="required" id="filed" type="file" name="file" style="width:25%; float:left;"/>
                    <input name="oldImg" type="hidden" value="${attractions.a_img}">
                </td>
            </tr>
            <tr>
                <td>景区名</td>
                <td colspan="3" class="control">
                    <input type="text" name="a_name" placeholder="填写景区名" value="${attractions.a_name}">
                </td>
            </tr>
            <tr>
                <td>星级</td>
                <td colspan="3" class="control">
                    <select name="a_level">
                        <option value="1" ${attractions.a_level == "1" ? "selected":""}>1星</option>
                        <option value="2" ${attractions.a_level == "2" ? "selected":""}>2星</option>
                        <option value="3" ${attractions.a_level == "3" ? "selected":""}>3星</option>
                        <option value="4" ${attractions.a_level == "4" ? "selected":""}>4星</option>
                        <option value="5" ${attractions.a_level == "5" ? "selected":""}>5星</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>景区信息</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="a_information" placeholder="填写景区信息">${attractions.a_information}</textarea>
                </td>
            </tr>
            <tr>
            <td>备注</td>
            <td colspan="3" class="control">
                <input style="width: 100%" type="text" name="a_note" placeholder="填写备注" value="${attractions.a_note}">
            </td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td colspan="3" class="control">
                    <input type="text" name="a_phone" placeholder="填写联系方式" value="${attractions.a_phone}">
                </td>
            </tr>
            <tr>
        </tr>

            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="a_likes" placeholder="填写点赞数" value="${attractions.a_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="a_views" placeholder="填写浏览量" value="${attractions.a_views}">
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <input type="hidden" name="a_id" value="${attractions.a_id}">
    </form>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/showImg.js"></script>
</body>
</html>