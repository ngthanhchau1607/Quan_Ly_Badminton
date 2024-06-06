<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<body onload="loadAmountCart()">
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
                <span class="badge" id="amountCart">0</span>
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
                <h6 class="m-0">Sản phẩm</h6>
            </a>
        </div>
        <div class="col-lg-9 custom-height">
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
                        <a href="shop.html" class="nav-item nav-link active">Shop</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="/managerCart" class="dropdown-item">Shopping Cart</a>
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
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: 410px;">
                        <img class="img-fluid" src="template/img/caulong1.jpeg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">Giảm giá 10% cho đơn hàng đầu tiên</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">BADMINTON</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="height: 410px;">
                        <img class="img-fluid" src="template/img/caulong2.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">Giảm giá 10% cho đơn hàng đầu tiên</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">BADMINTON</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Navbar End -->

<!-- Page Header Start -->

<!-- Page Header End -->


<!-- Shop Start -->
<div  class="container-fluid pt-5">
    <div class="row px-xl-5">
        <!-- Shop Sidebar Start -->
        <div class="col-lg-3 col-md-12">
            <!-- Price Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                <form>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input onchange="searchprice1()" type="radio" id="price-1" name="price" class="custom-control-input">
                        <label class="custom-control-label" for="price-1">50.00 - 70.00</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input onchange="searchprice2()" type="radio" id="price-3" name="price" class="custom-control-input">
                        <label class="custom-control-label" for="price-3">70.00 - 90.00</label>
                    </div>
                    <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                        <input onchange="searchprice3()" type="radio" id="price-5" name="price" class="custom-control-input">
                        <label class="custom-control-label" for="price-5">90.00 - 100.00</label>
                    </div>
                </form>
            </div>
            <!-- Price End -->

            <!-- Color Start -->
            <div class="border-bottom mb-4 pb-4">
                <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                <form>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-1">
                        <label class="custom-control-label" for="color-1">Black</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-2">
                        <label class="custom-control-label" for="color-2">White</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-3">
                        <label class="custom-control-label" for="color-3">Red</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="color-4">
                        <label class="custom-control-label" for="color-4">Blue</label>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="color-5">
                        <label class="custom-control-label" for="color-5">Green</label>
                    </div>
                </form>
            </div>
            <!-- Color End -->

            <!-- Size Start -->
            <!-- Size End -->
        </div>
        <!-- Shop Sidebar End -->


        <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form action="">
                            <div class="input-group">
                                <input oninput="searchByName(this)" value="${txtS}" type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                </div>
                            </div>
                        </form>
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                Sort by
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item"  onclick="searchcate1()" >Vợt</a>
                                <a class="dropdown-item" onclick="searchcate2()" >Giày</a>
                                <a class="dropdown-item" onclick="searchcate3()" >Áo</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content" class="row">
                    <c:forEach items="${listProduct}" var="product">
                        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                            <div class="card product-item border-0 mb-4">
                                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                    <img class="img-fluid w-100" src="${product.image}" alt="">
                                </div>
                                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                    <h6 class="text-truncate mb-3">${product.name}</h6>
                                    <div class="d-flex justify-content-center">
                                        <h6>${product.price}</h6><h6 class="text-muted ml-2"><del>100.00</del></h6>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-between bg-light border">
                                    <a href="detail?pid=${product.id}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Shop Product End -->



        <!-- Pagination Start -->
        <div class="col-12 pb-1">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center mb-3">
                    <c:if test="${tag != 1}">
                        <li class="page-item">
                            <a class="page-link" href="shop?index=${tag-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${endPage}" var="i">
                        <li class="page-item ${tag == i ? 'active' : ''}">
                            <a class="page-link" href="shop?index=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${tag != endPage}">
                        <li class="page-item">
                            <a class="page-link" href="shop?index=${tag+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        <!-- Pagination End -->
    </div>
</div>
<!-- Shop End -->


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
<script src="template/lib/easing/easing.min.js"></script>
<script src="template/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="template/mail/jqBootstrapValidation.min.js"></script>
<script src="template/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="template/js/main.js"></script>
<script>
    function searchprice1(){
        $.ajax({
            url: "/searchprice1",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchprice2(){
        $.ajax({
            url: "/searchpriceloaigiua",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchprice3(){
        $.ajax({
            url: "/searchpriceloai3",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>

<script>
    function searchcate1(){
        $.ajax({
            url: "/searchcatevot",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchcate2(){
        $.ajax({
            url: "/searchcategiay",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchcate3(){
        $.ajax({
            url: "/searchcateao",
            type: "get",
            data: {

            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>
<script>
    function searchByName(param){
        var txtSearch = param.value;
        $.ajax({
            url: "/searchbyname",
            type: "get",
            data: {
                txt: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>

<script>

    function loadAmountCart(){
        $.ajax({
            url: "/loadAllAmountCart",
            type: "get",
            data: {

            },
            success: function (responseData) {
                document.getElementById("amountCart").innerHTML = responseData;
            }
        });
    }
</script>

</body>
</html>