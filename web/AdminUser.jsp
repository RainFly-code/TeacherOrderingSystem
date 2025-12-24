<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>人员管理</title>
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
    <h1>人员管理</h1>
    <div class="filter-options">
        <div class="filter-buttons">
            <button class="btn btn-success" data-toggle="modal" data-target="#addStaffModal">添加教职工</button>
        </div>
        <form action="AdminUserSearchServlet">
            <input class="search-input" name="searchuserid" placeholder="请输入教职工工号">
            <button class="search-btn glyphicon glyphicon-search " type="submit"></button>
        </form>
    </div>
    <div class="table-container">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>部门</th>
                <th>联系方式</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="user-table">
            <c:forEach var="user" items="${AdminUserList}">
                <tr>
                    <td>${user.userid}</td>
                    <td>${user.name}</td>
                    <td>${user.department}</td>
                    <td>${user.pnumber}</td>
                    <td>
                        <button class="btn btn-primary" onclick="editUser(${user.userid})">编辑</button>
                        <button class="btn btn-danger" onclick="deleteUser(${user.userid})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- 添加教职工 -->
<div class="modal fade" id="addStaffModal" tabindex="-1" role="dialog" aria-labelledby="addStaffModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addStaffModalLabel">添加教职工</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addStaffForm">
                    <div class="form-group">
                        <label for="userid">用户ID</label>
                        <input type="text" class="form-control" id="userid" name="userid" required>
                    </div>
                    <div class="form-group">
                        <label for="name">姓名</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="department">部门</label>
                        <input type="text" class="form-control" id="department" name="department">
                    </div>
                    <div class="form-group">
                        <label for="pnumber">联系方式</label>
                        <input type="text" class="form-control" id="pnumber" name="pnumber">
                    </div>
                    <button type="submit" class="btn btn-primary">添加</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="editStaffModal" tabindex="-1" role="dialog" aria-labelledby="editStaffModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editStaffModalLabel">编辑教职工</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editStaffForm">
                    <div class="form-group">
                        <label for="editUserId">工号</label>
                        <input type="text" class="form-control" id="editUserId"  name="userid" readonly>
                    </div>
                    <div class="form-group">
                        <label for="editName">姓名</label>
                        <input type="text" class="form-control" id="editName" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="editPassword">密码</label>
                        <input type="password" class="form-control" id="editPassword" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="editDepartment">部门</label>
                        <input type="text" class="form-control" id="editDepartment" name="department">
                    </div>
                    <div class="form-group">
                        <label for="editPnumber">联系方式</label>
                        <input type="text" class="form-control" id="editPnumber" name="pnumber">
                    </div>
                    <button type="submit" class="btn btn-primary">保存</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function editUser(updateuserid) {
        // AJAX 请求获取用户信息
        $.ajax({
            url: 'AdminUserEditServlet',
            method: 'POST',
            data: { updateuserid: updateuserid },
            success: function(jsonUser) {
                console.log(jsonUser); // 输出 jsonUser 对象，检查是否包含正确的属性和值
                // 填充表单数据
                $('#editUserId').val(jsonUser.userid);
                $('#editName').val(jsonUser.name);
                $('#editPassword').val(jsonUser.password);
                $('#editDepartment').val(jsonUser.department);
                $('#editPnumber').val(jsonUser.pnumber);
                // 显示编辑模态框
                $('#editStaffModal').modal('show');
            },
            error: function(error) {
                alert('获取用户信息失败');
            }
        });
    }

    function deleteUser(userid) {
        if (confirm('确定删除该用户吗？')) {
            // AJAX 请求删除用户
            $.ajax({
                url: 'AdminUserDeleteServlet',
                method: 'POST',
                data: { userid: userid },
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
        $('#addStaffForm').on('submit', function(event) {
            event.preventDefault();
            $.ajax({
                url: 'AdminUserAddServlet',
                method: 'POST',
                data: $(this).serialize(),
                success: function(data) {
                    alert('添加成功');
                    $('#addStaffModal').modal('hide');
                    location.reload();
                },
                error: function(error) {
                    alert('添加失败');
                }
            });
        });

        $('#editStaffForm').on('submit', function(event) {
            event.preventDefault();
            $.ajax({
                url: 'AdminUserUpdateServlet',
                method: 'POST',
                data: $(this).serialize(),
                success: function(data) {
                    alert('更新成功');
                    $('#editStaffModal').modal('hide');
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
