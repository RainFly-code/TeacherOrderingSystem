<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>房间管理</title>
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
        .filter-options {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
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
    <h1>房间管理</h1>
    <div class="filter-options">
        <div class="filter-buttons">
            <button class="btn btn-success" data-toggle="modal" data-target="#addRoomModal">添加房间</button>
        </div>
        <form action="AdminRoomSearchServlet">
            <input class="search-input" name="searchRoomId" placeholder="请输入房间ID">
            <button class="search-btn glyphicon glyphicon-search " type="submit"></button>
        </form>
    </div>
    <div class="table-container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>房间ID</th>
                <th>楼号</th>
                <th>楼层</th>
                <th>状态</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="room-table">
            <c:forEach var="room" items="${AdminRoomList}">
                <tr>
                    <td>${room.roomid}</td>
                    <td>${room.bnumber}</td>
                    <td>${room.fnumber}</td>
                    <td>${room.state}</td>
                    <td>${room.typename}</td>
                    <td>
                        <button class="btn btn-primary" onclick="editRoom(${room.roomid})">编辑</button>
                        <button class="btn btn-danger" onclick="deleteRoom(${room.roomid})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- 添加房间 -->
<div class="modal fade" id="addRoomModal" tabindex="-1" role="dialog" aria-labelledby="addRoomModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addRoomModalLabel">添加房间</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addRoomForm">
                    <div class="form-group">
                        <label for="roomId">房间ID</label>
                        <input type="text" class="form-control" id="roomId" name="roomId" required>
                    </div>
                    <div class="form-group">
                        <label for="bnumber">楼号</label>
                        <input type="text" class="form-control" id="bnumber" name="bnumber" required>
                    </div>
                    <div class="form-group">
                        <label for="fnumber">楼层</label>
                        <input type="text" class="form-control" id="fnumber" name="fnumber" required>
                    </div>
                    <div class="form-group">
                        <label for="state">状态</label>
                        <input type="text" class="form-control" id="state" name="state">
                    </div>
                    <div class="form-group">
                        <label for="typename">类型</label>
                        <input type="text" class="form-control" id="typename" name="typename">
                    </div>
                    <button type="submit" class="btn btn-primary">添加</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 编辑房间 -->
<div class="modal fade" id="editRoomModal" tabindex="-1" role="dialog" aria-labelledby="editRoomModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editRoomModalLabel">编辑房间</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editRoomForm">
                    <div class="form-group">
                        <label for="editRoomId">房间ID</label>
                        <input type="text" class="form-control" id="editRoomId" name="roomId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="editBnumber">楼号</label>
                        <input type="text" class="form-control" id="editBnumber" name="bnumber" required>
                    </div>
                    <div class="form-group">
                        <label for="editFnumber">楼层</label>
                        <input type="text" class="form-control" id="editFnumber" name="fnumber" required>
                    </div>
                    <div class="form-group">
                        <label for="editState">状态</label>
                        <input type="text" class="form-control" id="editState" name="state">
                    </div>
                    <div class="form-group">
                        <label for="editTypename">类型</label>
                        <input type="text" class="form-control" id="editTypename" name="typename">
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function editRoom(updateRoomId) {
        // AJAX 请求获取房间信息
        $.ajax({
            url: 'AdminRoomEditServlet',
            method: 'POST',
            data: { updateroomid: updateRoomId },
            success: function(jsonRoom) {
                console.log(jsonRoom); // 输出 jsonRoom 对象，检查是否包含正确的属性和值
                // 填充表单数据
                $('#editRoomId').val(jsonRoom.roomid);
                $('#editBnumber').val(jsonRoom.bnumber);
                $('#editFnumber').val(jsonRoom.fnumber);
                $('#editState').val(jsonRoom.state);
                $('#editTypename').val(jsonRoom.typename);
                // 显示编辑模态框
                $('#editRoomModal').modal('show');
            },
            error: function(error) {
                alert('获取房间信息失败');
            }
        });
    }

    function deleteRoom(roomId) {
        if (confirm('确定删除该房间吗？')) {
            // AJAX 请求删除房间
            $.ajax({
                url: 'AdminRoomDeleteServlet',
                method: 'POST',
                data: { roomId: roomId },
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

    $(document).ready(function() {
        $('#addRoomForm').on('submit', function(event) {
            event.preventDefault();
            $.ajax({
                url: 'AdminRoomAddServlet',
                method: 'POST',
                data: $(this).serialize(),
                success: function(data) {
                    alert('添加成功');
                    $('#addRoomModal').modal('hide');
                    location.reload();
                },
                error: function(error) {
                    alert('添加失败');
                }
            });
        });

        $('#editRoomForm').on('submit', function(event) {
            event.preventDefault();
            $.ajax({
                url: 'AdminRoomUpdateServlet',
                method: 'POST',
                data: $(this).serialize(),
                success: function(data) {
                    alert('更新成功');
                    $('#editRoomModal').modal('hide');
                    location.reload();
                },
                error: function(error) {
                    alert('更新失败');
                }
            });
        });
    });
</script>
</body>
</html>
