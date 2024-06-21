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
    <title>房间列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <!-- 引入自定义CSS -->
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
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
            color: #007bff;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .card img {
            border-radius: 15px 15px 0 0;
        }
        .card-body {
            text-align: center;
            padding: 20px;
        }
        .card-body h5 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .card-body p {
            font-size: 1rem;
            color: #555;
        }
        .btn-reserve {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-reserve:hover {
            background-color: #0056b3;
        }
        .btn-reserve:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }
        .modal-header, .modal-footer {
            border: none;
        }
        .state-available {
            color: #28a745; /* 绿色 */
        }
        .state-occupied {
            color: #dc3545; /* 红色 */
        }
        .state-maintenance {
            color: #ffc107; /* 黄色 */
        }
        .card-title {
            font-size: 2rem;
        }
    </style>
</head>
<body>
<%@ include file="HomePage.jsp" %>
<div class="container">
    <div class="header">
        <h1>${typename} 房间列表</h1>
    </div>
    <div class="row">
        <c:forEach items="${roomList}" var="roomlist">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title <c:choose>
                                <c:when test='${roomlist.state == "可预订"}'>state-available</c:when>
                                <c:when test='${roomlist.state == "已入住"}'>state-occupied</c:when>
                                <c:when test='${roomlist.state == "维修中"}'>state-maintenance</c:when>
                                <c:otherwise></c:otherwise>
                              </c:choose>">
                            房间号: ${roomlist.roomid}</h4>
                        <h5 class="card-text">楼号: ${roomlist.bnumber}</h5>
                        <h5 class="card-text">楼层: ${roomlist.fnumber}</h5>
                        <h5 class="card-text">状态: ${roomlist.state}</h5>
                        <h5 class="card-text">类型: ${roomlist.typename}</h5>
                        <button type="button" class="btn-reserve" data-toggle="modal" data-target="#reserveModal" data-roomid="${roomlist.roomid}"
                                <c:if test="${roomlist.state != '可预订'}">disabled</c:if>>预订</button>
                    </div>
                </div>
            </div>
        </c:forEach>
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
<script>
    $('#reserveModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var roomid = button.data('roomid');
        var modal = $(this);
        modal.find('#roomid').val(roomid);
    });
</script>
</body>
</html>
