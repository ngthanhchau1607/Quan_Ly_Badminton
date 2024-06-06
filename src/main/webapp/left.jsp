<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>	
<head>
    <meta charset="UTF-8">
    <title>Quản lý</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            width: 250px;
            background-color: #ffffff;
            padding: 15px;
            position: fixed;
            height: 100%;
            border-right: 1px solid #dee2e6;
        }
        .sidebar a {
            display: block;
            color: #343a40;
            padding: 10px;
            text-decoration: none;
            margin-bottom: 5px;
            border-radius: 4px;
        }
        .sidebar a:hover {
            background-color: #f8f9fa;
        }
        .sidebar a i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="managerInvoice"><i class="fas fa-file-invoice-dollar"></i> Quản lý hóa đơn</a>
        <a href="managerAccount"><i class="fas fa-user-cog"></i> Quản lý tài khoản</a>
        <a href="manageProduct"><i class="fas fa-box-open"></i> Quản lý sản phẩm</a>
        <a href="top10Products.jsp"><i class="fas fa-star"></i> Top 10 sản phẩm</a>
        <a href="top5Customers.jsp"><i class="fas fa-users"></i> Top 5 khách hàng</a>
        <a href="manageSuppliers.jsp"><i class="fas fa-truck"></i> Quản lý nhà cung cấp</a>
        <a href="totalRevenue.jsp"><i class="fas fa-chart-line"></i> Tổng doanh thu</a>
        <a href="monthlyRevenue.jsp"><i class="fas fa-calendar-alt"></i> Doanh thu tháng</a>
    </div>
</body>
</html>
