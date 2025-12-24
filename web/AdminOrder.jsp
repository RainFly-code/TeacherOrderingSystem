<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>预约管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.7.1.min.js"></script>
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
            margin-left: 200px;
            padding: 20px;
        }
        .table-container {
            margin-top: 20px;
            max-height: 500px; /* 设置表格容器的最大高度 */
            overflow-y: auto; /* 启用垂直滚动条 */
        }
        .filter-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .filter-buttons {
            display: flex;
            gap: 10px;
        }
        .filter-buttons button {
            flex-grow: 1;
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
    <h1>预约管理</h1>
    <div class="filter-options">
        <div class="filter-buttons">
            <button class="btn btn-primary" onclick="filterOrders('all')">全部预约</button>
            <button class="btn btn-success" onclick="filterOrders('通过')">审批通过</button>
            <button class="btn btn-danger" onclick="filterOrders('拒绝')">审批拒绝</button>
            <button class="btn btn-warning" onclick="filterOrders('未审批')">待审批</button>
        </div>
        <form action="AdminOrderSearchServlet">
            <input class="search-input" name="searchuserid" placeholder="请输入教职工号">
            <button class="search-btn glyphicon glyphicon-search "  type="submit" href="#"></button>
        </form>
    </div>
    <div class="table-container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>预定号</th>
                <th>工号</th>
                <th>房间号</th>
                <th>预定时间</th>
                <th>入住时间</th>
                <th>结束时间</th>
                <th>审批状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="order-table">
            <c:forEach var="orders" items="${AdminorderList}">
                <tr>
                    <td>${orders.orderId}</td>
                    <td>${orders.userId}</td>
                    <td>${orders.roomId}</td>
                    <td><span class="date-only">${orders.nowtime}</span></td>
                    <td><span class="date-only">${orders.starttime}</span></td>
                    <td><span class="date-only">${orders.endtime}</span></td>
                    <td>${orders.approvalstate}</td>
                    <td>
                        <button class="btn btn-success" onclick="confirmAction(${orders.orderId}, 'approved')">同意</button>
                        <button class="btn btn-danger" onclick="confirmAction(${orders.orderId}, 'rejected')">拒绝</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- 模态框结构 -->
<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmationModalLabel">确认操作</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                您确定要执行此操作吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirmButton">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
    function confirmAction(orderid, action) {
        // 设置模态框的标题和确认操作内容
        const modalTitle = document.getElementById('confirmationModalLabel');
        const modalBody = document.querySelector('#confirmationModal .modal-body');
        const confirmButton = document.getElementById('confirmButton');

        if (action === 'approved') {
            modalTitle.textContent = '确认同意操作';
            modalBody.textContent = '您确定要同意此预约吗？';
        } else if (action === 'rejected') {
            modalTitle.textContent = '确认拒绝操作';
            modalBody.textContent = '您确定要拒绝此预约吗？';
        }

        // 设置确认按钮的点击事件
        confirmButton.onclick = function() {
            // 执行相应的更新操作
            updateStatus(orderid, action);

            // 关闭模态框
            $('#confirmationModal').modal('hide');
        };

        // 打开模态框
        $('#confirmationModal').modal('show');
    }

    document.addEventListener("DOMContentLoaded", function() {
        // 格式化并只显示日期部分
        const dateElements = document.querySelectorAll('.date-only');
        dateElements.forEach(element => {
            const dateTime = element.textContent.trim();
            if (dateTime) {
                const date = dateTime.split(' ')[0];
                element.textContent = date;
            }
        });
    });
    function filterOrders(states) {
        // 使用AJAX根据状态筛选预约订单
        $.ajax({
            url: 'AdminOrderControlServlet',
            type: 'POST',
            data: { states: states },
            success: function(response) {
                document.open();
                document.write(response);
                document.close();
            }
        });
    }
    function updateStatus(orderid, states) {
        // 使用AJAX更新预约订单状态
        $.ajax({
            url: 'AdminOrderUpdateServlet',
            type: 'POST',
            data: { updateorderid: orderid, updatestates: states },
            success: function(response) {
                document.open();
                document.write(response);
                document.close();
            }
        });
    }
</script>
</body>
</html>
