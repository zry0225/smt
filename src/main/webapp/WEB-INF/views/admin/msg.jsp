<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/20
  Time: 10:14 上午
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
        #xlsx{
            position: relative;
            left: 860px;
            top: 20px;
        }
    </style>
    <title>用户信息管理</title>
</head>
<body>
<div class="box">
    <h3>用户信息管理</h3>
    <div class="download">
        <a href="/admin/downLoadXlsx"><button type="button" class="btn btn-primary" id="xlsx">导出XLSX文件</button></a>
    </div>
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
                <td>操作</td>
            </tr>
            <c:forEach items="${users.list}" var="user">
                <f:formatDate value="${user.u_bir}" var="bir" pattern="yyyy-MM-dd"/>
                <tr>
                    <td><img src="<%=basePath%>img/${user.u_img}" alt="显示失败"></td>
                    <td>${user.u_name}</td>
                    <td>
                        <div style="width:70px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${user.u_password}">
                                ${user.u_password}
                        </div>
                    </td>
                    <td>${user.u_sex}</td>
                    <td>${user.u_age}</td>
                    <td>
                        <div style="width:70px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${user.u_phone}">
                                ${user.u_phone}
                        </div>
                    </td>
                    <td>
                        <div style="width:70px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${user.u_qq}">
                                ${user.u_qq}
                        </div>
                    </td>
                    <td>
                        <div style="width:70px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${user.u_pid}">
                                ${user.u_pid}
                        </div>
                    </td>
                    <td>
                        <div style="width:70px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${user.u_mail}">
                                ${user.u_mail}
                        </div>
                    </td>
                    <td>${bir}</td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/admin/toEditUser?id=${user.u_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="修改" href="/admin/toDetails?id=${user.u_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/admin/deleteUser?id=${user.u_id}" onclick="return confirmDelete();"></a>
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
                    <a href="/admin/userMsg?currentPage=${users.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${users.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${users.hasNextPage}">
                    <a href="/admin/userMsg?currentPage=${users.nextPage}">下一页</a>
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