<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Rain
  Date: 2024/6/20
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预定订单列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            margin-top: 50px;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 30px;
            color: #3a92f3;
        }
        .table-container {
            margin: 0 auto;
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: center;
            vertical-align: middle;
        }
        th {
            background-color: #3a92f3;
            color: #fff;
            width: 50px;
            border-radius: 15px 15px 0 0;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn-cancel {
            background-color: #dc3545;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<%@ include file="HomePage.jsp" %>
<div class="container">
    <div class="header">
        <h1>预定订单列表</h1>
    </div>
    <div class="table-container">
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="text-align: center">工号</th>
                <th style="text-align: center">房间号</th>
                <th style="text-align: center">预定时间</th>
                <th style="text-align: center">入住时间</th>
                <th style="text-align: center">结束时间</th>
                <th style="text-align: center">订单状态</th>
                <th style="text-align: center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orderlist}" var="order">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.roomId}</td>
                    <td>${order.nowtime}</td>
                    <td>${order.starttime}</td>
                    <td>${order.endtime}</td>
                    <td>${order.approvalstate}</td>
                    <td>
                        <button type="button" class="btn-cancel" data-toggle="modal" data-target="#cancelModal" data-orderid="${order.orderId}"
                                <c:if test="${order.approvalstate != '未审批'}">disabled</c:if>>取消</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- 模态框结构 -->
<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="cancelModalLabel">取消预订</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p STYLE="text-align: center">确定要取消这个预订吗？</p>
                <form action="#" style="text-align: center" method="post">
                    <input type="hidden" name="orderid" id="orderid">
                    <button type="submit" class="btn btn-danger">取消预订</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('#cancelModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var orderid = button.data('orderid');
        var modal = $(this);
        modal.find('#orderid').val(orderid);
    });
</script>
</body>
</html>
