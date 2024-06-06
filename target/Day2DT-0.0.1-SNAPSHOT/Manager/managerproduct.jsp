<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh sách Sản phẩm</title>
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
    .product-image {
      max-width: 100px; /* Limit image size */
    }
    .description {
      max-width: 300px; /* Limit description width */
      white-space: normal; /* Allow text wrapping */
    }
  </style>
  <style>
    /* CSS cho dropdown */
    .dropdown-container {
      display: inline-block;
      position: relative;
    }

    .dropdown-container select {
      width: 100px; /* Đặt width cho dropdown */
      padding: 6px 12px; /* Padding cho dropdown */
      font-size: 14px; /* Kích thước chữ trong dropdown */
      border: 1px solid #ced4da; /* Viền của dropdown */
      border-radius: 4px; /* Bo tròn các góc của dropdown */
      background-color: #fff; /* Màu nền của dropdown */
    }

    .dropdown-container::before {
      content: '\f107'; /* Unicode của biểu tượng dấu mũi tên xuống */
      font-family: 'Font Awesome 5 Free'; /* Font Awesome */
      position: absolute;
      right: 10px; /* Dịch chuyển vị trí của biểu tượng */
      top: calc(50% - 3px);
      color: #007bff;
      pointer-events: none;
    }

  </style>
</head>
<body>
<meta charset="UTF-8">
<div class="sidebar">
  <jsp:include page="../left.jsp" />
</div>

<div class="content">
  <h1>Danh sách Sản phẩm</h1>

  <div class="d-flex justify-content-between align-items-center mb-3">
    <!-- Dropdown số lượng sản phẩm hiển thị -->
    <div class="dropdown-container mr-2">
      <label for="product-per-page">Hiển thị:</label>
      <select id="product-per-page" onchange="changeProductPerPage()" class="form-control form-control-sm">
        <option value="">-- Chọn --</option> <!-- Option trống -->
        <option value="8">8</option>
        <option value="20">20</option>
        <option value="all">Tất cả</option>
      </select>
    </div>

    <!-- Icon Thêm sản phẩm -->
    <div>
      <button class="btn btn-primary btn-sm" onclick="addProduct()">
        <i class="fas fa-plus"></i> Thêm sản phẩm
      </button>
    </div>
  </div>
  <!-- Bảng danh sách sản phẩm -->
  <div class="table-responsive">
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
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Tên</th>
        <th scope="col">Hình ảnh</th>
        <th scope="col">Tiêu đề</th>
        <th scope="col">Mô tả</th>
        <th scope="col">Giá</th>
        <th scope="col">CateID</th>
        <th scope="col">Xóa</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="product" items="${listproduct}">
        <tr>
          <td>${product.id}</td>
          <td>${product.name}</td>
          <td><img src="${product.image}" class="product-image" alt="Product Image"></td>
          <td>${product.title}</td>
          <td class="description">${product.description}</td>
          <td>${product.price} VND</td>
          <td>${product.properties}</td>
          <td>
            <i class="fas fa-edit edit-icon" onclick="editProduct(${product.id})"></i>
            <i class="fas fa-trash-alt delete-icon" onclick="deleteProduct(${product.id})"></i>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<!-- Modal Thêm sản phẩm -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addProductModalLabel">Thêm sản phẩm</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Form nhập liệu -->
        <form action="addProduct" method="post">
          <div class="form-group">
            <label for="productName">Tên sản phẩm:</label>
            <input type="text" class="form-control" id="productName" name="productName" required>
          </div>
          <div class="form-group">
            <label for="productImage">Hình ảnh:</label>
            <input type="text" class="form-control" id="productImage" name="productImage" required>
          </div>
          <div class="form-group">
            <label for="productPrice">Giá:</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" required>
          </div>
          <div class="form-group">
            <label for="productTitle">Tiêu đề:</label>
            <input type="text" class="form-control" id="productTitle" name="productTitle" required>
          </div>
          <div class="form-group">
            <label for="productDescription">Mô tả:</label>
            <textarea class="form-control" id="productDescription" name="productDescription" required></textarea>
          </div>
          <div class="form-group">
            <label for="productCateID">CateID:</label>
            <input type="number" class="form-control" id="productCateID" name="productCateID" required>
          </div>
          <div class="form-group">
            <label for="productSuppID">Supplier ID:</label>
            <input type="number" class="form-control" id="productSuppID" name="productSuppID" required>
          </div>
          <div class="form-group">
            <label for="productProperties">Thuộc tính:</label>
            <input type="text" class="form-control" id="productProperties" name="productProperties" required>
          </div>
          <div class="form-group">
            <label for="productImage2">Hình ảnh 2:</label>
            <input type="text" class="form-control" id="productImage2" name="productImage2">
          </div>
          <div class="form-group">
            <label for="productImage3">Hình ảnh 3:</label>
            <input type="text" class="form-control" id="productImage3" name="productImage3">
          </div>
          <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  function deleteProduct(productId) {
    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
      window.location.href = 'deleteProduct?id=' + productId;
    }
  }
</script>


<script>
  function addProduct() {
    $('#addProductModal').modal('show');
  }

  function editProduct(productId) {
    window.location.href = 'editProduct?id=' + productId;
  }
</script>

<script>
  function changeProductPerPage() {
    var selectedValue = document.getElementById("product-per-page").value;
    if (selectedValue === "all") {
      window.location.href = 'manageProduct?perPage=all';
    } else {
      window.location.href = 'manageProduct?perPage=' + selectedValue;
    }
    document.getElementById("product-per-page").value = selectedValue;
  }
</script>


</body>
</html>
