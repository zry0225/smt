<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/20
  Time: 12:01 下午
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

    <title>特色文创</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
        img {
            width: 100px;
            height: 100px;
        }
        .btn-primary{
            position: absolute;
            left: 287px;
        }
    </style>
</head>
<body>
<div class="box">
    <h3>特色文创</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/souvenir/toAddSouvenir">添加商品信息</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>商品图片</td>
                <td>商品名</td>
                <td>价格</td>
                <td>备注</td>
                <td>添加时间</td>
                <td>修改时间</td>
                <td>点赞数</td>
                <td>浏览数</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${souvenirs.list}" var="souvenirs">
                <f:formatDate value="${souvenirs.s_addTime}" var="addTime" pattern="yyyy-MM-dd"/>
                <f:formatDate value="${souvenirs.s_uptime}" var="upTime" pattern="yyyy-MM-dd"/>
                <tr>
                    <td><img src="<%=basePath%>img/${souvenirs.s_img}" alt="显示失败"></td>
                    <td>${souvenirs.s_name}</td>
                    <td>${souvenirs.s_price}</td>
                    <td>${souvenirs.s_note}</td>
                    <td>${addTime}</td>
                    <td>${upTime}</td>
                    <td>${souvenirs.s_likes}</td>
                    <td>${souvenirs.s_views}</td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/souvenir/toEditSouvenir?id=${souvenirs.s_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="详情" href="/souvenir/toSouvenirDetails?id=${souvenirs.s_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/souvenir/deleteSouvenir?id=${souvenirs.s_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${souvenirs.total} 条记录，第 ${souvenirs.pageNum }/${souvenirs.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${souvenirs.hasPreviousPage}">
                    <a href="/souvenir/souvenirMsg?currentPage=${souvenirs.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${souvenirs.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${souvenirs.hasNextPage}">
                    <a href="/souvenir/souvenirMsg?currentPage=${souvenirs.nextPage}">下一页</a>
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