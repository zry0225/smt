<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/4/10
  Time: 8:22 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
    </style>
    <title>系统权限设置</title>
</head>
<body>
<div class="box">
    <h3>系统权限设置</h3>
    <div class="actions">
        <table class="list" border="1">
            <tr>
                <td>姓名</td>
                <td>角色</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${users.list}" var="user">
                    <td>${user.u_name}</td>
                    <td>${user.u_power == "普通用户"?"普通用户":"管理员"}</td>
                    <td>${user.u_state == "正常"?"正常":"异常"}</td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/power/toEditPower?id=${user.u_id}"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${users.total} 条记录，第 ${users.pageNum }/${users.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${users.hasPreviousPage}">
                    <a href="/power/show?currentPage=${users.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${users.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${users.hasNextPage}">
                    <a href="/power/show?currentPage=${users.nextPage}">下一页</a>
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