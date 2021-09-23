<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/27
  Time: 2:23 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>游记管理</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
    </style>
</head>
<body>
<div class="box">
    <h3>游记管理</h3>
    <div class="actions">
        <table class="list" border="1">
            <tr>
                <td>游记标题</td>
                <td>添加时间</td>
                <td>修改时间</td>
                <td>点赞量</td>
                <td>浏览量</td>
                <td>作者</td>
                <td>内容</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${notes.list}" var="notes">
                <tr>
                    <td>${notes.t_title}</td>
                    <f:formatDate value="${notes.t_addTime}" pattern="yyyy-MM-dd" var="addtime"/>
                    <td>${addtime}</td>
                    <f:formatDate value="${notes.t_updateTime}" pattern="yyyy-MM-dd" var="alter"/>
                    <td>${alter}</td>
                    <td>${notes.t_likes}</td>
                    <td>${notes.t_views}</td>
                    <td>${notes.u_name}</td>
                    <td>
                        <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${notes.t_content}">
                                ${notes.t_content}
                        </div>
                    </td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/notes/toEditNotes?id=${notes.t_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="详情" href="/notes/toNoteDetails?id=${notes.t_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/notes/deleteNotes?id=${notes.t_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${notes.total} 条记录，第 ${notes.pageNum }/${notes.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${notes.hasPreviousPage}">
                    <a href="/notes/notesMsg?currentPage=${notes.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${notes.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${notes.hasNextPage}">
                    <a href="/notes/notesMsg?currentPage=${notes.nextPage}">下一页</a>
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
