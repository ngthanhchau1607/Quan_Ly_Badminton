<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách Nhà cung cấp</title>
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
  <h1>Danh sách Nhà cung cấp</h1>

  <!-- Bảng danh sách nhà cung cấp -->
  <div class="table-responsive">
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Tên</th>
        <th scope="col">SĐT</th>
        <th scope="col">Email</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">CateID</th>
        <th scope="col">Xóa</th>
      </tr>
      </thead>
      <tbody>
      <!-- Ví dụ mẫu -->
      <tr>
        <td>1</td>
        <td>Nhà cung cấp A</td>
        <td>0123456789</td>
        <td>nccA@example.com</td>
        <td>123 Đường A, Quận B, TP. C</td>
        <td>123</td>
        <td><i class="fas fa-trash-alt delete-icon" onclick="deleteSupplier(1)"></i></td>
      </tr>
      <c:forEach var="supplier" items="${listsupplier}">
        <tr>
          <td>${supplier.id}</td>
          <td>${supplier.name}</td>
          <td>${supplier.phone}</td>
          <td>${supplier.email}</td>
          <td>${supplier.address}</td>
          <td>${supplier.cateID}</td>
          <td><i class="fas fa-trash-alt delete-icon" onclick="deleteSupplier(${supplier.id})"></i></td>
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
<script>
  function deleteSupplier(supplierId) {
    if (confirm('Bạn có chắc chắn muốn xóa nhà cung cấp này?')) {
      // Redirect to the delete URL with the supplier ID
      window.location.href = 'deleteSupplier?id=' + supplierId;
    }
  }
</script>

</body>
</html>
