<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/27
  Time: 2:24 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>修改游记</title>
</head>
<body>
<div class="box">
    <h3>修改游记</h3>
    <form action="/notes/editNotes" method="post">
        <table class="form-table">
            <tr>
                <td>标题</td>
                <td colspan="3" class="control">
                    <input type="text" name="t_title" placeholder="填写标题" value="${notes.t_title}" style="width: 100%">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${notes.t_addTime}" pattern="yyyy-MM-dd" var="addTime"/>
                <td>添加时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name = "t_addTime" value="${addTime}">
                </td>
            </tr>
            <tr>
                <f:formatDate value="${notes.t_updateTime}" pattern="yyyy-MM-dd" var="alter"/>
                <td>修改时间</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name = "t_updateTime" value="${alter}">
                </td>
            </tr>

            <tr>
                <td>作者</td>
                <td colspan="3" class="control">
                    <input readonly ="readonly" type="text" name="u_name"  value="${notes.u_name}">
                </td>
            </tr>

            <tr>
                <td>点赞数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="t_likes" placeholder="填写点赞数" value="${notes.t_likes}">
                </td>
            </tr>
            <tr>
                <td>浏览数</td>
                <td colspan="3" class="control">
                    <input readonly="readonly" type="text" name="t_views" placeholder="填写浏览量" value="${notes.t_views}">
                </td>
            </tr>

            <tr>
                <td>游记内容</td>
                <td colspan="3" class="control">
                    <textarea style="resize: none" class="p100" name="t_content" placeholder="填写内容">${notes.t_content}</textarea>
                </td>
            </tr>
        </table>
        <div class="buttons">
            <input class="btn btn-primary va-bottom" type="submit" value="保存">&nbsp;&nbsp;
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <input type="hidden" name="t_id" value="${notes.t_id}">
        <input type="hidden" name="u_id" value="${notes.u_id}">
    </form>
</div>
</body>
</html>