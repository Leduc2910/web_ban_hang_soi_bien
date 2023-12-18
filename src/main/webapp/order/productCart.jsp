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
                            <a class="dropdown-item my-dropdown-item" href="/product?action=category&id=${category.id}">
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
            <c:choose>
                <c:when test="${account != null}">
                    <div class="navbar-login">
                        <button class="login_icon dropdown-login" type="button" data-toggle="dropdown"
                                style="color: #a0a3ad;">
                            <i class="fa-regular fa-circle-user"></i>
                        </button>
                        <div class="dropdown-menu" style="top:20px">
                            <a class="dropdown-item my-dropdown-item fix-dropdown" href="#">
                                <i class="fa-regular fa-circle-user"></i>
                                <span>Thông tin tài khoản</span>
                            </a>
                            <a class="dropdown-item my-dropdown-item fix-dropdown" href="#" style="margin-top: 10px">
                                <i class="fa-regular fa-clipboard"></i>
                                <span>Quản lý đơn hàng</span>
                            </a>
                            <c:if test="${account.role == 1}">
                                <a class="dropdown-item my-dropdown-item fix-dropdown" href="/admin?action=home"
                                   style="margin-top: 10px">
                                    <i class="fa-solid fa-list-check"></i>
                                    <span>Quản lý</span>
                                </a>
                            </c:if>
                            <div class="dropdown-item my-dropdown-item fix-dropdown">
                                <a type="submit" class="btn btn-success my-btn" style="margin-top: 10px"
                                   href="/account?action=logout">Đăng xuất</a>
                            </div>
                        </div>
                        <div class="login-text">
                            <span style="margin-bottom: 3px">Xin chào,</span>
                            <span style="color: black">${account.fullName}</span>
                        </div>
                    </div>
                </c:when>
                <c:otherwise> <a class="navbar-login" href="/account?action=login">
                    <div class="login_icon">
                        <i class="fa-regular fa-circle-user"></i>
                    </div>
                    <div class="login-text">
                        <span style="margin-bottom: 3px">Đăng nhập</span>
                        <span>Đăng ký</span>
                    </div>
                </a></c:otherwise>
            </c:choose>
            <div class="navbar-notification">
                <i class="fa-regular fa-bell"></i>
            </div>
            <a class="navbar_cart" href="/order?action=cart">
                <div class="cart-icon">
                    <i class="fa-solid fa-cart-shopping"></i>
                </div>
                <div class="cart-text">
                    <span style="margin-bottom: 3px">Giỏ hàng của bạn</span>
                    <span>(${count}) sản phẩm</span>
                </div>
            </a>
        </div>
    </div>
    <div class="href-product my-row">
        <a href="/home?action=home">Trang chủ</a> > <b>Giỏ hàng</b>
    </div>
    <div class="wrapper my-row">
        <div class="wrapper-cart">
            <div class="wrapper-cart-top">
                <span>Giỏ hàng</span>
                <form action="/order?action=deleteAllOrderItem" method="post">
                    <button type="submit" href="/order?action=deleteAllOrderItem">Xóa tất cả</button>
                </form>
            </div>
            <div class="wrapper-cart-bot">
                <div class="cart-bot-left">
                    <div class="car-left-top">
                        <div class="c-brand">Sói Biển</div>
                        <div class="c-price">Đơn giá</div>
                        <div class="c-quantity">Số lượng</div>
                        <div class="c-total">Thành Tiền</div>
                    </div>
                    <div class="cart-left-bot">
                        <c:forEach items="${lstOrderItem}" var="orderItem">
                            <c:forEach items="${lstProduct}" var="product">
                                <c:if test="${orderItem.idProduct == product.id}">
                                    <div class="cart-product">
                                        <a class="product-img" href="/product?action=detail&id=${product.id}"><img
                                                src="${product.image}"
                                                alt=""></a>
                                        <a class="c-product-info" href="/product?action=detail&id=${product.id}">
                                            <div class="cp-name">${product.name}</div>
                                            <div class="cp-unit">Đơn vị tính: ${product.unit}</div>
                                        </a>
                                        <span class="c-product-price">
                                            <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${product.price}" type="currency"/></span>
                                        <div class="c-product-quatity">
                                            <form action="/order?action=editQuantityItem&id=${orderItem.id}" method="post">
                                                <div class="pq-select">
                                                    <input class="pq-changeQuantity" name="sub" value="-" type="submit">
                                                    <input type="text" value="${orderItem.quantity}"
                                                           style="text-align: center"
                                                           id="quantityCart" disabled>
                                                    <input class="pq-changeQuantity" name="add" value="+" type="submit">
                                                </div>
                                            </form>
                                            <form action="/order?action=deleteOrderItem" method="post">
                                                <input type="hidden" name="id" value="${product.id}">
                                                <button type="submit" class="pq-delete">Xóa</button>
                                            </form>

                                        </div>
                                        <span class="c-product-total"><fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${orderItem.totalPrice}" type="currency"/></span>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>

                    </div>
                </div>
                <div class="cart-bot-right">
                    <div class="top-voucher">
                        <div class="voucher-option">
                            <h6>Khuyến mãi</h6>
                            <a href=""><i class="fa-solid fa-ticket"></i> Chọn hoặc nhập khuyến mãi </a>
                        </div>
                        <div class="voucher-info">Đơn hàng chưa đủ điều kiện áp dụng khuyến mãi. Vui lòng mua thêm để áp
                            dụng
                        </div>
                    </div>
                    <div class="bill-total">
                        <h6>Thanh toán</h6>
                        <div class="bill-temporary">
                            <div class="into-money">
                                <span>Thành tiền</span>
                                <span style="font-weight: bold">
                                    <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${order.totalPrice}" type="currency"/></span>
                            </div>
                                <div class="bill-confirm">
                                    <a type="submit" class="btn" href="/order?action=checkout">TIẾP TỤC</a>
                                </div>
                        </div>
                    </div>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
<script src="<c:url value='/javascript/main.js'/>"></script>
</body>
</html>

