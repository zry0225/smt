<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/24
  Time: 10:36 下午
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

    <title>新闻管理</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }

        img{
            height: 100px;
            width: 100px;
        }
        .btn-primary{
            position: absolute;
            left: 315px;
        }
    </style>
</head>
<body>
<div class="box">
    <h3>新闻管理</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/new/toAddNew">添加新闻</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>主要图片</td>
                <td>公告标题</td>
                <td>添加时间</td>
                <td>修改时间</td>
                <td>点赞量</td>
                <td>浏览量</td>
                <td>作者</td>
                <td>内容</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${news.list}" var="news">
                <tr>
                    <td><img src="<%=basePath%>img/${news.n_mainImg}" alt="显示失败"></td>
                    <td> <div style="width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${news.n_title}">
                            ${news.n_title}
                    </div></td>
                    <f:formatDate value="${news.n_addTime}" pattern="yyyy-MM-dd" var="addtime"/>
                    <td>${addtime}</td>
                    <f:formatDate value="${news.n_alter}" pattern="yyyy-MM-dd" var="alter"/>
                    <td>${alter}</td>
                    <td>${news.n_likes}</td>
                    <td>${news.n_views}</td>
                    <td>${news.n_author}</td>
                    <td>
                        <div style="width:100px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${news.n_content}">
                                ${news.n_content}
                        </div>
                    </td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/new/toEditNew?id=${news.n_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="详情" href="/new/toNewDetails?id=${news.n_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/new/deleteNew?id=${news.n_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${news.total} 条记录，第 ${news.pageNum }/${news.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${news.hasPreviousPage}">
                    <a href="/new/newMsg?currentPage=${news.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${news.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${news.hasNextPage}">
                    <a href="/new/newMsg?currentPage=${news.nextPage}">下一页</a>
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
