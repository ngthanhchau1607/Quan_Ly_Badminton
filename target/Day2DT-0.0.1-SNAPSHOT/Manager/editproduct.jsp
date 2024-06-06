<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Sản Phẩm</title>
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
    </style>
</head>
<body>

<div class="sidebar">
    <!-- Your sidebar content here -->
    <!-- For example, include left.jsp -->
    <jsp:include page="../left.jsp" />
</div>

<div class="content">
    <h1>Chỉnh Sửa Sản Phẩm</h1>
    <%-- Kiểm tra và hiển thị thông báo --%>
    <% if (session.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success">
        <%= session.getAttribute("successMessage") %>
    </div>
    <% session.removeAttribute("successMessage"); %>
    <% } else if (session.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-danger">
        <%= session.getAttribute("errorMessage") %>
    </div>
    <% session.removeAttribute("errorMessage"); %>
    <% } %>

    <!-- Form chỉnh sửa sản phẩm -->
    <form method="post" action="updateProduct">
        <div class="form-group">
            <label for="productId">ID:</label>
            <input type="text" class="form-control" id="productId" name="productId" value="${product.id}" readonly>
        </div>
        <div class="form-group">
            <label for="productName">Tên Sản Phẩm:</label>
            <input type="text" class="form-control" id="productName" name="productName" value="${product.name}">
        </div>
        <div class="form-group">
            <label for="productTitle">Tiêu Đề:</label>
            <input type="text" class="form-control" id="productTitle" name="productTitle" value="${product.title}">
        </div>
        <div class="form-group">
            <label for="productImage">Link Hình Ảnh:</label>
            <input type="text" class="form-control" id="productImage" name="productImage" value="${product.image}">
        </div>
        <div class="form-group">
            <label for="productDescription">Mô Tả:</label>
            <textarea class="form-control" id="productDescription" name="productDescription" rows="4">${product.description}</textarea>
        </div>
        <div class="form-group">
            <label for="productPrice">Giá:</label>
            <input type="text" class="form-control" id="productPrice" name="productPrice" value="${product.price}">
        </div>
        <div class="form-group">
            <label for="categoryId">ID Loại Sản Phẩm:</label>
            <input type="text" class="form-control" id="categoryId" name="categoryId" value="${product.cateID}">
        </div>
        <div class="form-group">
            <label for="supplierId">ID Nhà Cung Cấp:</label>
            <input type="text" class="form-control" id="supplierId" name="supplierId" value="${product.suppid}">
        </div>
        <div class="form-group">
            <label for="productProperties">Thuộc Tính:</label>
            <input type="text" class="form-control" id="productProperties" name="productProperties" value="${product.properties}">
        </div>
        <div class="form-group">
            <label for="productImage2">Link Hình Ảnh 2:</label>
            <input type="text" class="form-control" id="productImage2" name="productImage2" value="${product.image2}">
        </div>
        <div class="form-group">
            <label for="productImage3">Link Hình Ảnh 3:</label>
            <input type="text" class="form-control" id="productImage3" name="productImage3" value="${product.image3}">
        </div>
        <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
    </form>
</div>

</body>
</html>
