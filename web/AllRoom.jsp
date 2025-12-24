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
    <title>allroom</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>" type="text/css" media="all" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .header div {
            width: 23%;
            text-align: center;
            padding: 15px;
            color: #fff;
            border-radius: 5px;
        }
        .header div.orange {
            background-color: #FFA500;
        }
        .header div.blue {
            background-color: #87CEEB;
        }
        .header div.green {
            background-color: #32CD32;
        }
        .header div.red {
            background-color: #FF6347;
        }
        .content {
            display: flex;
            justify-content: space-between;
        }
        .instructions {
            width: 18%;
            margin-right: 20px;
        }
        .instructions h3 {
            margin-bottom: 10px;
        }
        .instructions p {
            margin: 0 0 10px 0;
        }
        .table-container {
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
            text-align: center;
        }
        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }
        th, td {
            padding: 20px;
            text-align: center;
            line-height: 1.5;
        }
        th {
            background-color: #f2f2f2;
        }
        .lc {
            padding-top: 35px;
        }
        .state-available {
            background-color: #d4edda;
        }
        .state-occupied {
            background-color: #f8d7da;
        }
        .state-maintenance {
            background-color: #fff3cd;
        }
        .state-other {
            background-color: #e2e3e5;
        }
        .btn-reserve {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn-reserve:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .btn-reserve:hover:enabled {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="Header.jsp" %>
<div class="container">
    <div class="content">
        <div class="instructions">
            <h1>房间列表</h1>
            <div class="lc">
                <h3>预订流程</h3>
                <p>1. 选择可预订房间</p>
                <p>2. 点击预定按钮</p>
                <p>3. 选择入住时间</p>
                <p>4. 等待管理员审批</p>
                <p>5. 审批通过后，查看订单。</p>
                <p>6. 前往大厅办理入住。</p>
                <br>
                <hr>
                <h3>退房流程</h3>
                <p>1.腾空个人物品，家具电器恢复摆放原样。</p>
                <p>2.前往大厅办理退房</p>
            </div>
        </div>

        <div class="table-container">
            <div class="header">
                <div class="orange">${count1}间<br>房间总间数</div>
                <div class="blue">${count2}间<br>可预订间数</div>
                <div class="green">${count3}间<br>维修间数</div>
                <div class="red">${count4}间<br>已入住间数</div>
            </div>
            <table>
                <thead>
                <tr>
                    <th class="text-center">房间号</th>
                    <th class="text-center">房间楼号</th>
                    <th class="text-center">房间楼层</th>
                    <th class="text-center">当前状态</th>
                    <th class="text-center">房间类型</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${roomList}" var="roomlist">
                    <tr class="<c:choose>
                                <c:when test='${roomlist.state == "可预订"}'>state-available</c:when>
                                <c:when test='${roomlist.state == "已入住"}'>state-occupied</c:when>
                                <c:when test='${roomlist.state == "维修中"}'>state-maintenance</c:when>
                                <c:otherwise>state-other</c:otherwise>
                              </c:choose>">
                        <td>${roomlist.roomid}</td>
                        <td>${roomlist.bnumber}</td>
                        <td>${roomlist.fnumber}</td>
                        <td>${roomlist.state}</td>
                        <td>${roomlist.typename}</td>
                        <td>
                            <button type="button" class="btn-reserve" data-toggle="modal" data-target="#reserveModal" data-roomid="${roomlist.roomid}"
                                    <c:if test="${roomlist.state != '可预订'}">disabled</c:if>>预订</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- 模态框结构 -->
<div class="modal fade" id="reserveModal" tabindex="-1" role="dialog" aria-labelledby="reserveModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reserveModalLabel">选择预订时间</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="OrderServlet" method="post">
                    <input type="hidden" name="roomid" id="roomid">
                    <div class="form-group">
                        <label for="startDate">开始时间</label>
                        <input type="date" class="form-control" id="startDate" name="starttime" required>
                    </div>
                    <div class="form-group">
                        <label for="endDate">结束时间</label>
                        <input type="date" class="form-control" id="endDate" name="endtime" required>
                    </div>
                    <button type="submit" class="btn btn-primary">提交预订</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 预订成功模态框结构 -->
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="successModalLabel">预订成功</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>您的房间预订已成功！</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script>
    $('#reserveModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var roomid = button.data('roomid');
        var modal = $(this);
        modal.find('#roomid').val(roomid);
    });

    // 如果预订成功，显示成功模态框
    <c:if test="${reservationSuccess}">
    $(document).ready(function(){
        $('#successModal').modal('show');
    });
    </c:if>
</script>
</body>
</html>
