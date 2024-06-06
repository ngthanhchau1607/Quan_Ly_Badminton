<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .content {
            margin-left: 250px; /* Same as the width of the sidebar */
            padding: 20px;
            width: calc(100% - 250px);
        }
        .table-responsive {
            margin-top: 20px;
        }
        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>
<jsp:include page="../left.jsp" />
<div class="content">
    <div class="container">
        <div class="actions mt-4">
            <h1>Account Management</h1>
            <div>
                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addAccountModal" data-method="post">
                    <i class="fas fa-plus"></i> Thêm tài khoản
                </a>
                <a href="exportToExcel" class="btn btn-success"><i class="fas fa-file-excel"></i> Xuất file Excel</a>
            </div>
        </div>
        <c:if test="${not empty sessionScope.message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${sessionScope.message}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${sessionScope.error}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th>Account ID</th>
                    <th>Username</th>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Date of Birth</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="account" items="${listacc}">
                    <tr>
                        <td>${account.account_id}</td>
                        <td>${account.username}</td>
                        <td>${account.fullname}</td>
                        <td>${account.email}</td>
                        <td>${account.date_of_birth}</td>
                        <td>${account.role == 1 ? 'User' : 'Admin'}</td>
                        <td>
                            <a href="deleteAccount?id=${account.account_id}" class="btn btn-danger btn-sm" title="Delete" onclick="return confirm('Are you sure you want to delete this account?');"><i class="fas fa-trash-alt"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Modal Thêm tài khoản -->
<div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog" aria-labelledby="addAccountModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addAccountModalLabel">Thêm tài khoản</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Form nhập liệu -->
                <form action="addAccount" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="fullname">Fullname:</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input type="text" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="date_of_birth">Date of Birth:</label>
                        <input type="date" class="form-control" id="date_of_birth" name="date_of_birth" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <select class="form-control" id="role" name="role">
                            <option value="1">User</option>
                            <option value="2">Admin</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Add Account</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS và jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</body>
</html>
