<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/26
  Time: 7:39 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>通讯录管理</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
        .btn-primary{
            position: absolute;
            left: 330px;
        }
    </style>
</head>
<body>
<div class="box">
    <h3>通讯录管理</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/link/toAddLink">添加链接</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>网站名</td>
                <td>链接</td>
                <td>添加时间</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${link.list}" var="link">
                <tr>
                    <td>${link.l_webName}</td>
                    <td>${link.l_url}</td>
                    <f:formatDate value="${link.l_addTime}" pattern="yyyy-MM-dd" var="addtime"/>
                    <td>${addtime}</td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/link/toEditLink?id=${link.l_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/link/deleteLink?id=${link.l_id}" onclick="return confirmDelete()"></a>
                        &nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${link.total} 条记录，第 ${link.pageNum }/${link.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${link.hasPreviousPage}">
                    <a href="/link/linkMsg?currentPage=${link.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${link.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${link.hasNextPage}">
                    <a href="/link/linkMsg?currentPage=${link.nextPage}">下一页</a>
                </c:if>
            </li>
        </ul>
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
