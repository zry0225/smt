<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/29
  Time: 7:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>路线管理</title>
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
    <h3>路线管理</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/route/toAddRoute">添加路线</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>路线名称</td>
                <td>类型</td>
                <td>备注</td>
                <td>浏览量</td>
                <td>收藏量</td>
                <td>路线内容</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${route.list}" var="route">
                <tr>
                    <td>${route.ri_name}</td>
                    <td>${route.ri_type}</td>
                    <td><div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${route.ri_note}">
                            ${route.ri_note}
                    </div></td>
                    <td>${route.ri_views}</td>
                    <td>${route.ri_collect}</td>
                    <td>
                        <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${route.ri_content}">
                                ${route.ri_content}
                        </div>
                    </td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/route/toEditRoute?id=${route.ri_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/route/deleteRoute?id=${route.ri_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${route.total} 条记录，第 ${route.pageNum }/${route.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${route.hasPreviousPage}">
                    <a href="/route/routeMsg?currentPage=${route.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${route.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${route.hasNextPage}">
                    <a href="/route/routeMsg?currentPage=${route.nextPage}">下一页</a>
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
