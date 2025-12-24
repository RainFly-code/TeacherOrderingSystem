<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>反馈信息管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .sidebar {
            width: 180px;
            height: 100vh;
            background-color: #343a40;
            padding: 20px;
            position: absolute;
        }
        .sidebar h2 {
            text-align: center;
            color: white;
            margin-bottom: 20px;
            font-size: 22px;
            border-bottom: 1px solid #67faaa;
            padding-bottom: 10px;
        }
        .sidebar a {
            color: #fff;
            display: block;
            padding: 15px;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #3a92f3;
            color: white;
        }
        .main-content {
            margin-left: 200px;
            padding: 20px;
        }
        .table-container {
            margin-top: 20px;
            max-height: 500px;
            overflow-y: auto;
        }
        .search-input {
            border-radius: 5px;
            height: 30px;
            margin-top: 20px;
            flex-grow: 1;
            max-width: 200px;
        }
        .btn.disabled, .btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        .filter-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
<div class="sidebar">
    <h2>管理员控制台</h2>
    <a href="AdminHome.jsp">仪表盘</a>
    <a href="AdminOrderControlServlet">预约管理</a>
    <a href="AdminUserServlet?Adminuserid=0">人员管理</a>
    <a href="AdminRoomServlet?Adminroomid=0">房间管理</a>
    <a href="AdminFeedbackServlet?Adminfeedbackid=0">反馈信息管理</a>
</div>

<div class="main-content">
    <h1>反馈信息管理</h1>
    <div class="filter-options">
        <div class="filter-buttons">
        </div>
        <form action="AdminFeedbackSearchServlet">
            <input class="search-input" name="searchId" placeholder="请输入工号">
            <button class="search-btn glyphicon glyphicon-search " type="submit"></button>
        </form>
    </div>
    <div class="table-container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>反馈ID</th>
                <th>用户ID</th>
                <th>内容</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="feedback-table">
            <c:forEach var="feedback" items="${feedbackList}">
                <tr>
                    <td>${feedback.feedbackid}</td>
                    <td>${feedback.userid}</td>
                    <td>${feedback.content}</td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteFeedback(${feedback.feedbackid})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script>
    function deleteFeedback(feedbackId) {
        if (confirm('确定删除该反馈信息吗？')) {
            // AJAX 请求删除反馈信息
            $.ajax({
                url: 'AdminFeedbackDeleteServlet',
                method: 'POST',
                data: { feedbackid: feedbackId },
                success: function(data) {
                    alert('删除成功');
                    location.reload();
                },
                error: function(error) {
                    alert('删除失败');
                }
            });
        }
    }
</script>
</body>
</html>
