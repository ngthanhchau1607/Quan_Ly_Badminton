<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách Hóa đơn</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      margin: 0;
      font-family: Arial, sans-serif;
      display: flex;
    }
    .sidebar {
      width: 250px;
      background-color: #343a40;
      padding: 15px;
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      display: flex;
      flex-direction: column;
    }
    .sidebar a {
      color: #fff;
      text-decoration: none;
      display: block;
      margin: 10px 0;
    }
    .sidebar a:hover {
      background-color: #495057;
      padding-left: 10px;
    }
    .content {
      margin-left: 250px; /* Same as the width of the sidebar */
      padding: 10px  30px 0 30px;
      flex-grow: 1;
    }
    h1 {
      margin-bottom: 30px;
      text-align: center;
      color: #007bff;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
      padding: 10px; /* Adjusted padding for a cleaner look */
      text-align: left;
      border-bottom: 1px solid #ddd;
      white-space: nowrap; /* Prevent text wrapping for better appearance */
    }
    th {
      background-color: #007bff;
      color: white;
    }
    th, td {
      width: auto; /* Adjusted width to auto */
    }
    th:last-child, td:last-child {
      width: 5%; /* Adjusted width for delete icon column */
      text-align: center; /* Center align delete icon */
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #ddd;
    }
    .delete-icon {
      cursor: pointer;
      color: red;
      font-size: 1.2em;
    }
  </style>
</head>
<body>

<div class="sidebar">
  <jsp:include page="../left.jsp" />
</div>

<div class="content">
  <h1>Danh sách Hóa đơn</h1>

  <!-- Form tìm kiếm hóa đơn theo ngày -->
  <form method="get" action="searchInvoice">
    <div class="form-row align-items-center mb-3">
      <div class="col-sm-3 my-1">
        <label class="sr-only" for="dateXuat">Ngày Xuất</label>
        <input type="date" class="form-control" id="dateXuat" name="dateXuat" placeholder="Chọn ngày">
      </div>
      <div class="col-auto my-1">
        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
      </div>
      <div class="col-auto my-1">
        <a href="exportExcel" class="btn btn-success">Xuất Excel</a>
      </div>
    </div>
  </form>
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
  <!-- Bảng danh sách hóa đơn -->
  <div class="table-responsive">
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
      <tr>
        <th scope="col">Mã Hóa đơn</th>
        <th scope="col">Tên Tài khoản</th>
        <th scope="col">Giá</th>
        <th scope="col">Ngày Xuất</th>
        <th scope="col">Xóa</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="invoice" items="${listinvoice}">
        <tr>
          <td>HD${invoice.mahd}</td>
          <c:forEach var="account" items="${listacc}">
            <c:if test="${invoice.account_id == account.account_id}">
              <td>${account.username}</td>
            </c:if>
          </c:forEach>
          <td>${invoice.price} VND</td>
          <td>${invoice.dateXuat}</td>
          <td>
            <a href="deleteInvoice?mahd=${invoice.mahd}" class="btn btn-danger btn-sm" title="Delete" onclick="return confirm('Are you sure you want to delete this account?');"><i class="fas fa-trash-alt"></i></a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



</body>
</html>
