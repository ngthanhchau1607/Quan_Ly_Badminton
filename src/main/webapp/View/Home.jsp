

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

<body onload="loadAmountCart()">
<!-- Topbar Start -->
<div class="container-fluid" >
    <div class="row bg-secondary py-2 px-xl-5">
        <div class="col-lg-6 d-none d-lg-block">
        </div>
        <div class="col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <a class="text-dark px-2" href="">
                    <i class="fab fa-facebook-f"></i>
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
                <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">C</span>LCPShop</h1>
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
        <div class="col-lg-3 col-6 text-right " >
            <a href="/managerCart" class="btn border">
                <i class="fas fa-shopping-cart text-primary"></i>
                <span class="badge" id="amountCart">0</span>
            </a>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Trang chủ</h6>
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
                        <a href="/home" class="nav-item nav-link active">Home</a>
                        <a href="/shop" class="nav-item nav-link">Shop</a>
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
                        <a href="/home" class="nav-item nav-link">Register</a>
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


<!-- Featured Start -->
<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
            </div>
        </div>
    </div>
</div>
<!-- Featured End -->

<!-- Categories Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Top những sản phẩm nhiều lượt mua nhất</span></h2>
    </div>
    <div class="row px-xl-5 pb-3">
        <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <img class="img-fluid w-100" src="template/img/product-1.jpg" alt="">
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                    <div class="d-flex justify-content-center">
                        <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                    <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Categories End -->


<!-- Offer Start -->
<div class="container-fluid offer pt-5">
    <div class="row px-xl-5">
        <div class="col-md-6 pb-4">
            <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                <img src="template/img/offer-1.png" alt="">
                <div class="position-relative" style="z-index: 1;">
                    <h5 class="text-uppercase text-primary mb-3">Cây vợt của tuyển thủ KentoMomota</h5>
                    <h1 class="mb-4 font-weight-semi-bold">Yonex Astrox 88d</h1>
                </div>
            </div>
        </div>
        <div class="col-md-6 pb-4">
            <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                <img src="template/img/offer-2.png" alt="">
                <div class="position-relative" style="z-index: 1;">
                    <h5 class="text-uppercase text-primary mb-3">Cây vợt của tuyển thủ Lindan</h5>
                    <h1 class="mb-4 font-weight-semi-bold">Yonex Astrox 100zz</h1>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">4 Mẫu Mới Nhất Của Vợt Cầu Lông</span></h2>
    </div>
    <div id="contentVot" class="contentVot row px-xl-5 pb-3">
        <c:forEach var="product" items="${last4productV}">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="productVot  product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="${product.image}" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${product.name}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>${product.price}</h6><h6 class="text-muted ml-2"><del>100VNĐ</del></h6>
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
    <div class="text-center mt-3">
        <button onclick="loadMoreVot()" id="loadMoreBtn" class="btn btn-primary">Load More</button>
    </div>
</div>
<!-- Products End -->


<!-- Subscribe Start -->
<div class="container-fluid bg-secondary my-5">
    <div class="row justify-content-md-center py-5 px-xl-5">
        <div class="col-md-6 col-12 py-5">
            <div class="text-center mb-2 pb-2">
                <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Đóng góp ý kiến cho chúng tôi</span></h2>
                <p>Nếu có bất cứ thắc mắc hay cần sự giúp đỡ gì hãy gửi tin qua qua mail cho chúng tôi.</p>
            </div>
            <form action="">
                <div class="input-group">
                    <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                    <div class="input-group-append">
                        <button class="btn btn-primary px-4">Subscribe</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Subscribe End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">4 Mẫu Mới Nhất Của Giày Cầu Lông</span></h2>
    </div>
    <div id="contentGiay" class="row px-xl-5 pb-3">
        <c:forEach var="product" items="${last4product}">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="productGiay card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src="${product.image}" alt="">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${product.name}</h6>
                        <div class="d-flex justify-content-center">
                            <h6>${product.price}</h6><h6 class="text-muted ml-2"><del>100VNĐ</del></h6>
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
    <div class="text-center mt-3">
        <button onclick="loadMoreGiay()" id="LoadMoreGiayBtn" class="btn btn-primary">Load More</button>
    </div>
</div>
<!-- Products End -->


<!-- Vendor Start -->
<!-- Vendor End -->


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

    function loadMoreVot() {
        var amountVot = document.getElementsByClassName("productVot").length;   //Lấy số lượng bằng name
        $.ajax({
            url: "/loadVot",
            type: "get",
            data: {
                exitsVot: amountVot
            },
            success: function (dataVot) {
                console.log("Dữ liệu từ máy chủ:", dataVot); // Ghi dữ liệu ra console
                document.getElementById("contentVot").innerHTML += dataVot;  //Nội dung id của fhtml sẽ bị thay thế
            },
            error: function (xhr) {
                //Do Something to handle error
                console.error("Lỗi khi gửi yêu cầu Ajax:", xhr.statusText);
            }
        });
    }

    function loadMoreGiay() {
        var amountGiay = document.getElementsByClassName("productGiay").length;   //Lấy số lượng bằng name
        $.ajax({
            url: "/loadGiay",
            type: "get",
            data: {
                exitsGiay: amountGiay
            },
            success: function (dataGiay) {
                console.log("Dữ liệu từ máy chủ:", dataGiay); // Ghi dữ liệu ra console
                document.getElementById("contentGiay").innerHTML += dataGiay;  //Nội dung id của fhtml sẽ bị thay thế
            },
            error: function (xhr) {
                //Do Something to handle error
                console.error("Lỗi khi gửi yêu cầu Ajax:", xhr.statusText);
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