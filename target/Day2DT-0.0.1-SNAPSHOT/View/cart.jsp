<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="template/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="template/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="template/css/style.css" rel="stylesheet">
</head>

<body onload="loadTotalMoney()">
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark" href="">FAQs</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Help</a>
                <span class="text-muted px-2">|</span>
                <a class="text-dark" href="">Support</a>
            </div>
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-twitter"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-linkedin-in"></i>
                </a>
                <a class="text-dark px-2" href="">
                    <i class="fab fa-instagram"></i>
                </a>
                <a class="text-dark pl-2" href="">
                    <i class="fab fa-youtube"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row align-items-center py-3 px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a href="" class="text-decoration-none">
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
            </a>
        </div>
        <div class="col-lg-6 col-6 text-left">
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for products">
                    <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-3 col-6 text-right">
            <a href="/managerCart" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge">0</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Categories</h6>
            </a>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/home" class="nav-item nav-link">Home</a>
                        <a href="/shop" class="nav-item nav-link">Shop</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                            </div>
                        </div>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <%-- Kiểm tra xem có đăng nhập hay không --%>
                        <% if (session.getAttribute("acc") == null) { %>
                        <a href="/login" class="nav-item nav-link">Login</a>
                        <a href="/shop" class="nav-item nav-link">Register</a>
                        <% } else { %>
                        <a href="/editProfile" class="nav-item nav-link">Edit Profile</a>
                        <a href="/logout" class="nav-item nav-link">Logout</a>
                        <% } %>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->


<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Shopping Cart</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Cart Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5">
        <div class="col-lg-8 table-responsive mb-5">
            <table class="table table-bordered text-center mb-0">
                <thead class="bg-secondary text-dark">
                <tr>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th> Số lượng</th>
                    <th>Tổng</th>
                    <th>Xóa</th>
                </tr>
                </thead>
                <tbody class="align-middle">
                    <c:forEach items="${listcart}" var="o">
                        <c:forEach items="${listproduct}" var="p">
                            <c:if test="${o.productID == p.id}">
                                <tr>
                                    <td class="align-middle"><img src="${p.image}" alt="" style="width: 50px;"> ${p.name}</td>
                                    <td class="align-middle">${p.price}</td>
                                    <td class="align-middle">
                                        <div class="input-group quantity mx-auto" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <a href="subAmountCart?productID=${o.productID}&amount=${o.amount}" class="btn btn-sm btn-primary btn-minus">
                                                    <i class="fa fa-minus"></i>
                                                </a>
                                            </div>
                                            <input type="text" class="form-control form-control-sm bg-secondary text-center" value="${o.amount}">
                                            <div class="input-group-btn">
                                                <a href="addAmountCart?productID=${o.productID}&amount=${o.amount}" class="btn btn-sm btn-primary btn-plus">
                                                    <i class="fa fa-plus"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle">${p.price * o.amount}</td></td>
                                    <td class="align-middle"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-lg-4">
            <div class="card border-secondary mb-5" id="contentTotalMoney">
                <div class="card-header bg-secondary border-0">
                    <h4 class="font-weight-semi-bold m-0">Thành Tiền</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">Tổng tiền hàng</h6>
                        <h6 class="font-weight-medium">150</h6>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Phí vận chuyển</h6>
                        <h6 class="font-weight-medium">10</h6>
                    </div>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="d-flex justify-content-between mt-2">
                        <h5 class="font-weight-bold">Total</h5>
                        <h5 class="font-weight-bold">$160</h5>
                    </div>
                    <button class="btn btn-block btn-primary my-3 py-3">Thanh Toán</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Cart End -->

<!-- Footer Start -->
<div class="container-fluid bg-secondary text-dark mt-5 pt-5">
    <div class="row px-xl-5 pt-5">
        <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
            <a href="" class="text-decoration-none">
                <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">C</span>LCPShopp</h1>
            </a>
            <p>Shop mang đến những sản phẩm chất lượng , chính hãng đến với các anh em lông thủ.</p>
            <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>147/1 Tân Lập 2 , Phường Hiệp Phú, Thành Phố Thủ Đức</p>
            <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>achau16072000@gmail.com</p>
            <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>0899897394</p>
        </div>
    </div>
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="template/mail/jqBootstrapValidation.min.js"></script>
<script src="template/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="template/js/main.js"></script>
<script>
    function loadTotalMoney(){
        $.ajax({
            url: "/totalMoneyCart",
            type: "get",
            data: {

            },
            success: function (responseData) {
                document.getElementById("contentTotalMoney").innerHTML = responseData;
            }
        });
    }

</script>
</body>

</html>