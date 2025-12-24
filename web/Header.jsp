<%@ page import="Model.User" %>
<%@ page import="Service.TypeService" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Rain
  Date: 2024/6/18
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Home Page</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.7.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <style>
        .paddtop{
            padding-top: 10px;
        }
        .row{
            margin: 0;
        }
        .navbar{
            margin-bottom: 0px;
            width: 100%;
            border-radius: 0;
        }
        .container-fluid{
            padding: 0px;
        }
        .search-btn{
            float: left;
            display: inline-block;
            color: black;
            position: absolute;
            top: 43%;
            left: 170px;
            z-index: 2;
        }
        button{
            background: white;
            border: 0px;
        }
        .search-input{
            float: right;
            border: 0px;
            border-radius: 8px;
            width: 200px;
            height: 28px;
            padding-left: 5px;
            padding-right: 20px;
            outline: none;
            margin-top: 11px;
        }
        .daohang{
            background: rgb(140, 185, 232);
        }
        .navbar-default .navbar-nav > li > a {
            color: #ffffff;
            font-size: 17px;
        }
        .logo1{
            padding-top: 0px;
            padding-left: 10px;
        }
        .navbar-right .dropdown-menu {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <nav class="navbar navbar-default daohang">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="images/logo.png" class="logo1" href="#">
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <li class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="RoomServlet?typename=all">全部房间</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">房间分类 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%
                                TypeService typeService = new TypeService();      //创建一个typeService，用于获取商品类型并显示
                                List<String> typeList = typeService.GetAllType();
                                request.setAttribute("typeList",typeList);
                            %>
                            <c:forEach items="${typeList}" var="t">
                                <li><a class="list" href="RoomServlet?typename=${t}">${t}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li><a href="AllOrderServlet">我的预定</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <form action="SearchServlet">
                            <input class="search-input" name="keyword" placeholder="请输入搜索房间信息">
                            <button class="search-btn glyphicon glyphicon-search "  type="submit" href="#"></button>
                        </form>
                    </li>
                    <%
                        User user = (User) session.getAttribute("user");
                        boolean isLoggedIn = (user != null);
                    %>
                    <%-- 在此基础上判断显示头像还是登录注册按钮 --%>
                    <% if (isLoggedIn) { %>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img class="img-circle" src="images/user.png" style="margin: -5px"  width="30px">&nbsp
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="UserDetail.jsp">个人信息</a></li>
                            <li><a href="UserFeedback.jsp">反馈</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Login.jsp">退出登录</a></li>
                        </ul>
                    </li>
                    <% } else { %>
                    <li>
                        <a href="Login.jsp" data-target="#login-modal">登陆/注册</a>
                    </li>
                    <% } %>
                </ul>
        </div><!-- /.container-fluid -->
    </nav>
</div>
</body>
</html>
