<%--
  Created by IntelliJ IDEA.
  User: zhangruiyan
  Date: 2021/3/19
  Time: 9:10 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>龙门石窟景区 - 后台管理</title>
    <link rel="stylesheet" href="/css/Role.css">
    <link rel="stylesheet" href="/css/font-awesome.css">

</head>
<body>
<div class="header" style="background-image: url('/img/head.jpg')">
    <h1><a href="#">龙门石窟景区-管理员系统</a></h1>
    <div class="user">
        <a href="/admin/getUserById?id=1<%--${user_id}--%>" target="pageBox">张三</a>
        <a href="#">退出</a>
    </div>
</div>
<div class="main">
    <ul class="left-side" style="background-image: url('/img/head.jpg');background-repeat: repeat-y">
        <li class="menu-title active">
            <a href="#">
                <i class="fa fa-sitemap" aria-hidden="true"></i>&nbsp;&nbsp;景区管理
            </a>
        </li>
        <li class="sub-menu">
            <ul>
                <li class="active">
                    <a href="/route/routeMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;浏览路线管理
                    </a>
                </li>

                <li>
                    <a href="/guide/guideMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;旅游指南管理
                    </a>
                </li>
                <li>
                    <a href="/souvenir/souvenirMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;旅游商品管理
                    </a>
                </li>
                <li>
                    <a href="/attract/attractionsMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;景点介绍管理
                    </a>
                </li>
                <li>
                    <a href="/notes/notesMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;游记管理
                    </a>
                </li>

            </ul>

        </li>
        <li class="menu-title">
            <a href="#">
                <i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;&nbsp;系统管理
            </a>
        </li>


        <li class="sub-menu">
            <ul>

                <li>
                    <a href="/analysis/analysisMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;客情分析
                    </a>
                </li>
                <li>
                    <a href="/admin/userMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;用户管理
                    </a>
                </li>
                <li>
                    <a href="/link/linkMsg" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;通讯录管理
                    </a>
                </li>

                <li>
                    <a href="/power/show" target="pageBox">
                        <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;系统设置
                    </a>
                </li>
            </ul>

        <li class="menu-title">
            <a href="#">
                <i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;&nbsp;资讯管理
            </a>
        </li>
        <li class="sub-menu">
            <ul class="menu">
        <li>
            <a href="/announce/announceMsg" target="pageBox">
                <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;公告管理
            </a>
        </li>
        <li>
            <a href="/new/newMsg" target="pageBox">
                <i class=" fa fa-circle-thin"></i>&nbsp;&nbsp;新闻管理
            </a>
        </li>
            </ul>
    </ul>
    <div class="right-side">
        <iframe name="pageBox" src="/admin/userMsg"></iframe>
        <div class="footer">
            龙门石窟智慧景区 ©2021 中原工学院
        </div>
    </div>
</div>
<script src="/js/jquery.js"></script>
<script src="/js/admin.js"></script>
</body>
</html>
