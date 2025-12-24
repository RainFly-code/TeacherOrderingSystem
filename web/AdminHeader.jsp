<%@ page import="Model.User" %>
<%@ page import="Model.Admin" %>
<%--
  Created by IntelliJ IDEA.
  User: Rain
  Date: 2024/6/18
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .navbar{
            margin-bottom: 0px;
            width: 100%;
            border-radius: 0;
        }
        .container-fluid{
            padding: 0px;
        }
        button{
            background: white;
            border: 0px;
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
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="images/logo.png" class="logo1" href="#">
            </div>
            <li class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <%
                        Admin admin = (Admin) session.getAttribute("admin");
                        boolean isLoggedIn = (admin != null);
                    %>
                    <%-- 在此基础上判断显示头像还是登录注册按钮 --%>
                    <% if (isLoggedIn) { %>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            管理员，您好！欢迎登陆！
                            <img class="img-circle" src="images/user.png" style="margin: -5px"  width="30px">&nbsp
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="Login.jsp">退出登录</a></li>
                        </ul>
                    </li>
                    <% } else { %>
                    <li>
                        <a href="Login.jsp">登陆/注册</a>
                    </li>
                    <% } %>
                </ul>
            </li>
        </div><!-- /.container-fluid -->
    </nav>
</div>
<script type="text/javascript">
    window.onload=function(){
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>
</html>
