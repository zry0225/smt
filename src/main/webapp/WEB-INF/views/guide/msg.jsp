<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/25
  Time: 7:47 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>指南管理</title>
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
    <h3>指南管理</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/guide/toAddGuide">添加指南</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>标题</td>
                <td>添加时间</td>
                <td>修改时间</td>
                <td>浏览量</td>
                <td>内容</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${guide.list}" var="guide">
                <tr>
                    <td> <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${guide.g_title}">
                            ${guide.g_title}
                    </div></td>
                    <f:formatDate value="${guide.g_addTime}" pattern="yyyy-MM-dd" var="addtime"/>
                    <td>${addtime}</td>
                    <f:formatDate value="${guide.g_updateTime}" pattern="yyyy-MM-dd" var="alter"/>
                    <td>${alter}</td>
                    <td>${guide.g_views}</td>
                    <td>
                        <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${guide.g_content}">
                                ${guide.g_content}
                        </div>
                    </td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/guide/toEditGuide?id=${guide.g_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="详情" href="/guide/toGuideDetails?id=${guide.g_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/guide/deleteGuide?id=${guide.g_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${guide.total} 条记录，第 ${guide.pageNum }/${guide.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${guide.hasPreviousPage}">
                    <a href="/guide/guideMsg?currentPage=${guide.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${guide.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${guide.hasNextPage}">
                    <a href="/guide/guideMsg?currentPage=${guide.nextPage}">下一页</a>
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
