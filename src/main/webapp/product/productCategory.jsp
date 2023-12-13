<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Công ty cổ phần Sói Biển Trung Thực</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value='/css/home.css'/>"/>
</head>
<body>

<div class="my-container">
    <div class="header">
        <div class="banner">
            <img src="https://lh3.googleusercontent.com/V94Qr7sGhQCOk4CWQplwsJTMKmgs6ZJz8ncUrck4_0GbXSRiBsm7uIOaJpE-KDhIJPA_3axl2DTQTPP2YhYZgYS3IBPk1UomYw=rw-w1920"
                 alt="" style="width: 100%;">
        </div>
        <div class="contact">
            <div class="contact-link my-row">
                <a href="">Hệ thống cửa hàng</a>
                <a href="">Chính sách giao hàng</a>
                <a href="">Chính sách đổi trả</a>
                <a href=""><i class="fa-solid fa-headphones" style="margin-right: 5px"></i> Gọi mua hàng 1900 63 63
                    26</a>
            </div>
        </div>
    </div>
    <div class="background-navbar">
        <div class="my-navbar my-row">
            <div class="navbar-logo">
                <a href="/home?action=home">
                    <img src="https://lh3.googleusercontent.com/9NoSES-TeQyrWrHiOL6nPT8sz78TmXNFrKu2OnzlRgtg6CVxTTTXtdGDUv12LbyZ8e0M9d9_Zm5ctZVjuWTGf8hBiuJ5cehu=rw-w128"
                         alt=""></a>
            </div>
            <div class="navbar-listProduct">
                <div class="navbar-dropdown">
                    <button class="btn my-dropdown dropdown-toggle dropdown " type="button" data-toggle="dropdown"
                            aria-expanded="false">
                        <i class="fa-solid fa-bars" style="margin-right: 5px"></i> Danh mục sản phẩm
                    </button>
                    <div class="dropdown-menu">
                        <c:forEach items="${listCategory}" var="category">
                            <a class="dropdown-item my-dropdown-item" href="#">
                                <img src="${category.image}">
                                <span>${category.name}</span>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="navbar-search">
                <div id="search">
                    <input type="text" placeholder="Nhập từ khóa cần tìm">
                    <button><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>
            <a class="navbar-login" href="/account?action=login">
                <div class="login_icon">
                    <i class="fa-regular fa-circle-user"></i>
                </div>
                <div class="login-text">
                    <span style="margin-bottom: 3px">Đăng nhập</span>
                    <span>Đăng ký</span>
                </div>
            </a>
            <div class="navbar-notification">
                <i class="fa-regular fa-bell"></i>
            </div>
            <div class="navbar_cart">
                <div class="cart-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                </div>
                <div class="cart-text">
                    <span style="margin-bottom: 3px">Giỏ hàng của bạn</span>
                    <span>(0) sản phẩm</span>
                </div>
            </div>
        </div>
    </div>
    <div class="href-product my-row">
        <a href="/home?action=home">Trang chủ</a> > ${product.name}
    </div>
    <div class="wrapper my-row">
        <div class="leftside">

        </div>
        <div class="middle">
            <div class="middle-top">
                <span style="font-weight: bold; font-size: 13px">Sắp xếp theo</span>
                <div>
                    <button>Khuyến mãi giá tốt</button>
                </div>
                <div>
                    <button>Giá tăng dần</button>
                </div>
                <div>
                    <button>Giá giảm dần</button>
                </div>
                <div>
                    <button>Sản phẩm mới nhất</button>
                </div>
                <div>
                    <button>Sản phẩm bán chạy nhất</button>
                </div>
            </div>
            <div class="middle-bot">
                <div class="middle-bot-product">
                    <a href=""><img src="https://lh3.googleusercontent.com/3Rt7Pe_nmWSrHOG_-iT1aoWEhUZzFa2CFAq4OvwbXtflT6I-A9xPoKimhRDkiRdJU76sGMPmarT2QUA-4QC_KnUB7JovgWE=w230-rw" alt=""></a>
                    <span class="p-brand">Đang cập nhật</span>
                    <span class="p-name">Name product</span>
                    <span class="p-unit">Đơn vị tính: túi</span>
                    <span class="p-price">18.000 đ</span>
                    <button class="product-btn">Thêm vào giở hàng</button>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <div class="text-left">
            <h4>CÔNG TY CỔ PHẦN SÓI BIỂN TRUNG THỰC</h4>
            <h6>Mã số doanh nghiệp: 0107522785 do Sở Kế hoạch và Đầu Tư Thành phố Hà Nội cấp ngày 29/07/2016 </h6>
        </div>
        <div class="text-center">
            <h4>Địa chỉ trụ sở chính:</h4>
            <h6>Địa chỉ: Tầng 3, Tòa nhà 24T3 Thanh Xuân Complex, Số 6 Lê Văn Thiêm, Phường Thanh Xuân Trung, Quận Thanh
                Xuân, Thành phố Hà Nội, Việt Nam</h6>
        </div>
        <div class="text-right">
            <img src="https://shopfront-cdn.tekoapis.com/common/da-dang-ky.png" alt="">
            <img src="https://shopfront-cdn.tekoapis.com/common/da-dang-ky.png" alt="">
        </div>
    </div>
</div>
</body>
</html>

