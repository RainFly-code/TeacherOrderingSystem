<%--
  Created by IntelliJ IDEA.
  User: Rain
  Date: 2024/6/23
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教工个人信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.7.1.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
<%@ include file="Header.jsp" %>
<div class="container" >
    <h2>反馈</h2>
    <form id="staffFeedbackForm">
        <div class="form-group">
            <div class="form-group">
            <label for="userId">工号</label>
            <input type="text" class="form-control" id="userId" name="userid" value="${user.userid}" readonly>
            </div>
            <div class="form-group">
            <label for="feedback">反馈内容</label>
            <input type="text" class="form-control" id="feedback" name="feedback" placeholder="请输入反馈信息" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">提交</button>
    </form>
</div>

<script>
    $(document).ready(function() {
        $('#staffFeedbackForm').on('submit', function(event) {
            event.preventDefault();
            $.ajax({
                url: 'FeedbackServlet',
                method: 'POST',
                data: $(this).serialize(),
                success: function(data) {
                    alert('反馈成功');
                    $('#staffFeedbackForm').modal('hide');
                    location.reload();
                },
                error: function(error) {
                    alert('反馈失败');
                }
            });
        });
    });
</script>
</body>
</html>
