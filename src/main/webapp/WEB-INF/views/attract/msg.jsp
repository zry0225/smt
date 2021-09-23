<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/22
  Time: 8:20 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <title>景区信息管理</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/font-awesome.css">
    <style>
        body{
            background-image: url("/img/bg.png");
            background-repeat: no-repeat;
            opacity: 0.9;
        }
        img{
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
    <h3>景区信息管理</h3>
    <div class="actions">
        <div class="actions">
            <div style="position: absolute;top: 45px;left: 600px">
                <a class="btn btn-primary" href="/attract/toAddAttractions">添加景区信息</a>
            </div>
        </div>
        <table class="list" border="1">
            <tr>
                <td>景区图片</td>
                <td>景区名</td>
                <td>景区星级</td>
                <td>景区联系方式</td>
                <td>景区信息</td>
                <td>备注</td>
                <td>点赞数</td>
                <td>浏览数</td>
                <td>操作</td>
            </tr>
            <c:forEach items="${attractions.list}" var="attractions">
                <tr>
                    <td><img src="<%=basePath%>img/${attractions.a_img}" alt="显示失败"></td>
                    <td>${attractions.a_name}</td>
                    <td>${attractions.a_level=="1"?"一星":attractions.a_level=="2"?"二星":
                            attractions.a_level=="3"?"三星":
                                    attractions.a_level=="4"?"四星":"五星"}</td>
                    <td>${attractions.a_phone}</td>
                    <td>
                        <div style="width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;" title="${attractions.a_information}">
                                ${attractions.a_information}
                        </div>
                          </td>
                    <td>${attractions.a_note}</td>
                    <td>${attractions.a_likes}</td>
                    <td>${attractions.a_views}</td>
                    <td>
                        <a class="fa fa-pencil" title="编辑" href="/attract/toEditAttractions?id=${attractions.a_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-info-circle" title="详情" href="/attract/toAttractionsDetails?id=${attractions.a_id}"></a>
                        &nbsp;&nbsp;
                        <a class="fa fa-remove" title="删除" href="/attract/deleteAttractions?id=${attractions.a_id}" onclick="return confirmDelete()"></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<!--分页-->
<div class="pager-info">
    <div>共有 ${attractions.total} 条记录，第 ${attractions.pageNum }/${attractions.pages} 页 </div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous disabled }">
                <c:if test="${attractions.hasPreviousPage}">
                    <a href="/attract/attractionsMsg?currentPage=${attractions.prePage}">上一页</a>
                </c:if>
            </li>
            <li class="paginate_button active"><a href="#" onclick="return false">${attractions.pageNum}</a></li>
            <li class="paginate_button next disabled">
                <c:if test="${attractions.hasNextPage}">
                    <a href="/attract/attractionsMsg?currentPage=${attractions.nextPage}">下一页</a>
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
