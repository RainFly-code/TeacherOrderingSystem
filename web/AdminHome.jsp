<%@ page import="Service.RoomService" %>
<%@ page import="Service.OrderService" %>
<%@ page import="java.util.List" %>
<%@ page import="Service.ChartService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员页面</title>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
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
            margin-left: 170px;
            padding: 40px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            padding-top: 50px;
            margin-bottom: 20px;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            border-radius: 15px 15px 0 0;
            text-align: center;
            padding: 10px;
            font-size: 20px;
        }
        .card-body {
            padding: 20px;
            text-align: center;
        }
        .card-metric {
            padding: 20px;
            text-align: center;
            background-color: #fff;
            border-radius: 15px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgb(31, 121, 255);
        }
        .card-metric h4 {
            margin-bottom: 10px;
            font-size: 24px;
            color: #007bff;
        }
        .card-metric p {
            font-size: 18px;
            color: #333;
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
    <!-- 仪表盘 -->
        <div class="container">
            <%
                RoomService roomService = new RoomService();
                int count = roomService.GetAllCount();
                int count1 = roomService.getAllOccupiedCount();
                int count2 = count - count1;
                int count3 = roomService.getAllRepairCount();
                int count4 = roomService.getAllOrderCount();
                request.setAttribute("count1",count1);
                request.setAttribute("count2",count2);
                request.setAttribute("count3",count3);
                request.setAttribute("count4",count4);
            %>
            <div class="row">
                <div class="col-md-3">
                    <div class="card-metric">
                        <h4>入住房间</h4>
                        <p>${count1}</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-metric">
                        <h4>剩余房间</h4>
                        <p>${count2}</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-metric">
                        <h4>待维修</h4>
                        <p>${count3}</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card-metric">
                        <h4>待入住</h4>
                        <p>${count4}</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">预约变化</div>
                        <div class="card-body">
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">入住分布</div>
                        <div class="card-body">
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<%

%>
<script>
    // 折线图
    <%
    ChartService chartService = new ChartService();
    List<String> datelist = chartService.SelectDate();
    List<Integer> numberlist = chartService.SelectCount();
    request.setAttribute("datelist",datelist);
    request.setAttribute("numberlist",numberlist);
    %>
    var lineChartData = <%= datelist.toString().replace("[", "['").replace("]", "']").replace(", ", "', '") %>;
    var lineChartCount = <%= numberlist.toString() %>;
    var ctx = document.getElementById('lineChart').getContext('2d');
    var lineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: lineChartData,
            datasets: [{
                label: '预约人数',
                data: lineChartCount,
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                fill: false
            }]
        }
    });
    // 柱状图
    <%
    List<Integer> DistriRoom = chartService.SelectDistriRoom();
    request.setAttribute("DistriRoom",DistriRoom);
    %>
    var ctx = document.getElementById('barChart').getContext('2d');
    var lineDistriRoom = <%= DistriRoom.toString() %>;
    var barChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['一号楼', '二号楼', '三号楼', '四号楼', '五号楼', '六号楼'],
            datasets: [{
                label: '入住房间数',
                data: lineDistriRoom,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        }
    });
</script>
</body>
</html>
