<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Rain
  Date: 2024/6/19
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords"
          content="Trendz Login Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
</head>

<body>
<!-- /login-section -->

<section class="w3l-forms-23">

    <div class="forms23-block-hny">
        <div class="wrapper">
            <h1>华北水利水电大学教工宿舍预约系统</h1>
            <div class="d-grid forms23-grids">
                <div class="form23">
                    <div class="main-bg">
                        <h6 class="sec-one">管理员登陆</h6>
                        <div class="speci-login first-look">
                            <img src="images/user.png" alt="" class="img-responsive">
                        </div>
                    </div>
                    <div class="bottom-content">
                        <form action="AdminLoginServlet" method="post">
                            <input type="text" name="adminId" class="input-form" placeholder="管理员账号"
                                   required="required" title="管理员账号" />
                            <input type="password" name="password" class="input-form"
                                   placeholder="管理员密码" required="required " title="请输入管理员密码" />
                            <span class="error">${adminerrors}</span>
                            <button type="submit" class="loginhny-btn btn">登陆</button>
                        </form>
                        <p><a href="Login.jsp">教工登陆</a></p>
                    </div>
                </div>
            </div>
            <div class="w3l-copy-right text-center">

            </div>
        </div>
    </div>
</section>
<!-- //login-section -->
</body>

</html>
