<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员页面</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.7.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
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
        .card-body h5 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .card-body p {
            font-size: 1rem;
            color: #555;
        }
        .info-box {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        .info-box .info-card {
            width: 23%;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 20px;
            border-radius: 15px;
        }
        .info-box .info-card h5 {
            font-size: 2rem;
            margin: 10px 0;
        }
        .info-box .info-card p {
            font-size: 1rem;
            margin: 0;
        }
        .chart-container {
            position: relative;
            height: 400px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%@ include file="AdminHeader.jsp" %>
<div class="container mt-4">
    <div class="info-box">
        <div class="info-card">
            <h5 id="occupiedRooms">0</h5>
            <p>入住房间</p>
        </div>
        <div class="info-card">
            <h5 id="availableRooms">0</h5>
            <p>剩余房间</p>
        </div>
        <div class="info-card">
            <h5 id="roomsUnderMaintenance">0</h5>
            <p>待维修房间</p>
        </div>
        <div class="info-card">
            <h5 id="roomsToCheckIn">0</h5>
            <p>待入住房间</p>
        </div>
    </div>
    <div class="chart-container">
        <canvas id="lineChart"></canvas>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">预约变化</div>
                <div class="card-body">
                    <canvas id="reservationChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">退房变化</div>
                <div class="card-body">
                    <canvas id="checkoutChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">入住分布</div>
                <div class="card-body">
                    <canvas id="checkinDistributionChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    // 示例数据，可以根据实际数据进行动态更新
    const data = {
        occupiedRooms: 102,
        availableRooms: 43,
        roomsUnderMaintenance: 5,
        roomsToCheckIn: 10,
        lineChartData: {
            labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            datasets: [
                {
                    label: '入住人数',
                    data: [12, 19, 3, 5, 2, 3, 7],
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                },
                {
                    label: '退房人数',
                    data: [2, 3, 20, 5, 1, 4, 3],
                    borderColor: 'rgb(255, 99, 132)',
                    tension: 0.1
                }
            ]
        },
        reservationChartData: {
            labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            datasets: [{
                label: '预约变化',
                data: [65, 59, 80, 81, 56, 55, 40],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        },
        checkoutChartData: {
            labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            datasets: [{
                label: '退房变化',
                data: [28, 48, 40, 19, 86, 27, 90],
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        checkinDistributionChartData: {
            labels: ['经济型', '标准型', '豪华型', '套房'],
            datasets: [{
                label: '入住分布',
                data: [12, 19, 3, 5],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)'
                ],
                borderWidth: 1
            }]
        }
    };

    // 更新信息卡片的数据
    document.getElementById('occupiedRooms').textContent = data.occupiedRooms;
    document.getElementById('availableRooms').textContent = data.availableRooms;
    document.getElementById('roomsUnderMaintenance').textContent = data.roomsUnderMaintenance;
    document.getElementById('roomsToCheckIn').textContent = data.roomsToCheckIn;

    // 渲染图表
    const lineChartCtx = document.getElementById('lineChart').getContext('2d');
    new Chart(lineChartCtx, {
        type: 'line',
        data: data.lineChartData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const reservationChartCtx = document.getElementById('reservationChart').getContext('2d');
    new Chart(reservationChartCtx, {
        type: 'bar',
        data: data.reservationChartData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const checkoutChartCtx = document.getElementById('checkoutChart').getContext('2d');
    new Chart(checkoutChartCtx, {
        type: 'bar',
        data: data.checkoutChartData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const checkinDistributionChartCtx = document.getElementById('checkinDistributionChart').getContext('2d');
    new Chart(checkinDistributionChartCtx, {
        type: 'doughnut',
        data: data.checkinDistributionChartData,
        options: {
            responsive: true
        }
    });
</script>
</body>
</html>
