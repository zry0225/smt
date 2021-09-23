<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/4/10
  Time: 8:52 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

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
    .power{
        width: 200px;
    }
</style>
<html>
<head>
    <title>修改权限</title>
</head>
<body>
<div class="box">
    <h3>系统权限设置</h3>
    <form action="/power/editPower" method="post">
        <input hidden name="u_id" value="${user.u_id}">
        <table class="form-table">

            <tr>
                <td>姓名</td>
                <td colspan="3" class="control">
                    <input class="power" type="text" name="u_name" readonly="readonly" value="${user.u_name}">
                </td>
            </tr>
            <tr>
                <td>权限</td>
                <td colspan="3" class="control">
                    <select name="u_power" class="power">
                        <option value="普通用户" ${user.u_power == "普通用户"?"select":""}>普通用户</option>
                        <option value="管理员" ${user.u_power == "管理员"?"select":""}>管理员</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>状态</td>
                <td colspan="3" class="control">
                    <select name="u_state" class="power">
                        <option value="正常" ${user.u_state == "正常" ? "selected":""}>正常</option>
                        <option value="异常" ${user.u_state == "异常" ? "selected":""}>异常</option>
                    </select>
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
</body>
</html>
