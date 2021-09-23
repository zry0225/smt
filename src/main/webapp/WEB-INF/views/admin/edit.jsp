<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/19
  Time: 7:34 下午
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
<link rel="stylesheet" href="/css/font-awesome.css">
<link rel="stylesheet" href="/css/main.css">
<style>
    body{
        background-image: url("/img/bg.png");
        background-repeat: no-repeat;
        opacity: 0.7;
    }
</style>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<html>
<head>
    <title>修改用户信息</title>
</head>
<body>
<div class="box">
    <h3>修改用户信息</h3>
    <form action="/admin/editUser" method="post" enctype="multipart/form-data">
        <input hidden name="u_id" value="${user.u_id}">
        <table class="form-table">
            <tr>
                <td>头像</td>
                <td colspan="3" class="control">
                    <p><img id="imgshow" src="<%=basePath%>img/${user.u_img}" width="100px" height="100px"></p>
                    <input required="required" id="filed" type="file" name="file" style="width:25%; float:left;"/>
                    <input name="oldImg" type="hidden" value="${user.u_img}">
                </td>
            </tr>
            <tr>
                <td>姓名</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_name" placeholder="填写姓名" value="${user.u_name}">
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text"
                           name="u_password" placeholder="密码" value="${user.u_password}" style="width: 300px">
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_sex" placeholder="性别" value="${user.u_sex}">
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_age" placeholder="年龄" value="${user.u_age}">
                </td>
            </tr>
            <tr>
                <td>QQ</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_qq" placeholder="QQ" value="${user.u_qq}">
                </td>
            </tr>
            <tr>
                <td>手机号</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_phone" placeholder="手机号" value="${user.u_phone}">
                </td>
            </tr>
            <tr>
                <td>身份证</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_pid" placeholder="身份证" value="${user.u_pid}">
                </td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td colspan="3" class="control">
                    <input type="text" name="u_mail" placeholder="邮箱" value="${user.u_mail}">
                </td>
            </tr>
            <tr>
                <td>生日</td>
                <td colspan="3" class="control">
                    <f:formatDate value="${user.u_bir}" var="bir" pattern="yyyy-MM-dd"/>
                    <input type="text" name="u_bir" placeholder="生日" value="${bir}">
                </td>
            </tr>
            <%--<tr>
                <td>权限</td>
                <td colspan="3" class="control">
                    <select name="u_power">
                        <option value="普通用户" ${user.u_power == "普通用户"?"select":""}>普通用户</option>
                        <option value="管理员" ${user.u_power == "管理员"?"select":""}>管理员</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td colspan="3" class="control">
                    <select name="u_state">
                        <option value="正常" ${user.u_state == "正常" ? "selected":""}>正常</option>
                        <option value="异常" ${user.u_state == "异常" ? "selected":""}>异常</option>
                    </select>
                </td>
            </tr>--%>
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
