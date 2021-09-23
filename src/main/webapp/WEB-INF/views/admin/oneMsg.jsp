<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/26
  Time: 8:55 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
        img {
            width: 78px;
            height: 78px;
        }
    </style>
    <title>个人信息管理</title>
</head>
<body>
<div class="box">
    <h3>个人信息管理</h3>
    <div class="actions">
        <table class="list" border="1">
            <tr>
                <td>头像</td>
                <td>姓名</td>
                <td>密码</td>
                <td>性别</td>
                <td>年龄</td>
                <td>手机</td>
                <td>qq</td>
                <td>身份证</td>
                <td>邮箱</td>
                <td>生日</td>
                <%--<td>权限</td>
                <td>状态</td>--%>
                <td>操作</td>
            </tr>
                <f:formatDate value="${user.u_bir}" var="bir" pattern="yyyy-MM-dd"/>
                <tr>
                    <td><img src="<%=basePath%>img/${user.u_img}" alt="显示失败"></td>
                    <td>${user.u_name}</td>
                    <td>${user.u_password}</td>
                    <td>${user.u_sex}</td>
                    <td>${user.u_age}</td>
                    <td>${user.u_phone}</td>
                    <td>${user.u_qq}</td>
                    <td>${user.u_pid}</td>
                    <td>${user.u_mail}</td>
                    <td>${bir}</td>
                    <%--<td>${user.u_power == "普通用户"?"普通用户":"管理员"}</td>
                    <td>${user.u_state == "正常"?"正常":"异常"}</td>--%>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/admin/toEditUser?id=${user.u_id}"></a>
                    </td>
                </tr>
        </table>
    </div>
    <div class="buttons">
        <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
    </div>
</div>

<script src="/js/jquery.js"></script>
<script>
    function confirmDelete()
    {
        if (confirm("是否确定删除")){
            return true;
        }
        return false;
    }
</script>
</body>
</html>