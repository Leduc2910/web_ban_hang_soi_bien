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
        <div class="detail-product">
            <div class="d-product">
                <div class="image">
                    <img src="https://lh3.googleusercontent.com/NVQReUdqdwDIyK23lpJzt_eFHWXLB3bm1HgwjgnUtw-4dKXLMo7eEr5iiMECANiPa_6sNHt5OXktfxiq3qdm9SmVazLezgKc=rw"
                         alt="" style="width: 100%">
                </div>
                <div class="info">
                    <span class="info-name">${product.name}</span>
                    <span class="info-brand">Thương hiệu ${product.brand}</span>
                    <span class="info-unit">Đơn vị tính ${product.unit}</span>
                    <span class="info-weight">KHỐI LƯỢNG ${product.weight} KG</span>
                    <span class="info-price"><fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${product.price}" type="currency"/></span>
                    <div class="info-button">
                        <button class="buy-now">MUA NGAY</button>
                        <button class="add-to-cart">THÊM VÀO GIỎ HÀNG</button>
                    </div>
                </div>
            </div>
            <div class="right-side">
                <div class="logo-web">
                    <img src="https://storage.googleapis.com/teko-gae.appspot.com/media/image/2021/12/3/20211203_f6358030-aafe-477b-8553-dae5fddca5c7.png"
                         alt="">
                    <span>Sói biển</span>
                </div>
                <div class="detail-web">
                    <span style="font-weight: bold;margin-bottom:10px ">Chính sách bán hàng</span>
                    <span><img
                            src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3e %3cpath fill='%23006545' fill-rule='evenodd' d='M10.646 2.34c.496-.454 1.244-.454 1.74 0l.012.013c1.52 1.482 3.3 2.232 5.599 2.36 1.103.062 1.98.974 1.996 2.076.003.227.009.43.018.622v.016c.045 2.349.1 5.272-.88 7.93-.537 1.456-1.35 2.723-2.416 3.764-1.214 1.185-2.803 2.126-4.723 2.798-.063.022-.129.04-.195.053-.093.019-.187.028-.281.028-.094 0-.188-.01-.282-.028-.066-.013-.13-.03-.193-.053-1.923-.67-3.514-1.611-4.729-2.796-1.066-1.041-1.88-2.307-2.416-3.764-.976-2.649-.92-5.567-.876-7.912v-.036c.01-.194.016-.397.019-.621.016-1.103.893-2.015 1.996-2.077 2.3-.128 4.078-.878 5.598-2.36zm.942.863c-.044-.038-.1-.038-.145 0-.867.843-1.799 1.469-2.848 1.913-1.05.445-2.194.696-3.495.769-.49.027-.88.432-.888.922-.003.234-.01.446-.018.65v.013c-.046 2.363-.097 5.042.803 7.483 1.03 2.792 3.132 4.708 6.43 5.858.012.004.024.008.037.01.035.007.07.007.103 0 .013-.002.026-.006.037-.01 3.295-1.152 5.397-3.07 6.426-5.86.903-2.448.853-5.129.808-7.495-.01-.201-.015-.414-.019-.649-.007-.49-.397-.895-.888-.922-1.301-.073-2.444-.324-3.495-.769-1.048-.444-1.98-1.07-2.848-1.913zm4.097 6.004c.276.277.276.725 0 1.001L11.1 14.793c-.276.276-.724.276-1 0L7.807 12.5c-.276-.276-.276-.724 0-1 .277-.277.725-.277 1.001 0L10.6 13.29l4.084-4.084c.276-.276.725-.276 1.001 0z'/%3e%3c/svg%3e"> Thực phẩm an toàn</span>
                    <span><img
                            src="data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3e %3cpath fill='%23006545' d='M16.112 13.458v-3.019L12.982 12v3.337l3.13-1.878zm-3.692-2.43l3-1.495-3.84-1.926-3 1.496 3.84 1.925zm-.56 4.392V12l-3.972-1.99v3.42l3.972 1.99zm5.317-6.14c.038.075.047.16.057.234v4.261c0 .197-.103.384-.272.486l-4.252 2.542c-.159.103-.364.113-.533.029L7.075 14.28c-.187-.093-.309-.29-.309-.505V9.093c.01-.084.019-.159.056-.243.01-.009.02-.009.02-.018.018-.02.027-.038.046-.056.037-.057.093-.103.159-.14.009-.01.018-.029.028-.029l4.252-2.13c.159-.075.336-.075.495 0l5.103 2.55.028.029c.066.037.122.084.159.15l.047.046c0 .01.01.019.018.028zm-13.26 8.908l-.408 2.14c-.069.354-.41.587-.766.519-.355-.067-.588-.41-.52-.765l.723-3.785c.066-.343.389-.573.735-.525l3.955.56c.358.051.607.383.557.741-.052.357-.383.607-.74.555l-2.586-.366c1.56 2.307 4.208 3.737 7.133 3.737 4.78 0 8.692-3.912 8.692-8.691 0-.361.293-.654.654-.654.361 0 .654.293.654.654 0 5.502-4.498 10-10 10-3.281 0-6.267-1.57-8.083-4.12zM20.083 5.12l.408-2.14c.069-.355.41-.587.766-.52.355.068.588.411.52.766l-.723 3.784c-.065.343-.389.574-.735.525l-3.955-.56c-.358-.05-.607-.383-.557-.74.052-.357.383-.607.74-.556l2.586.367C17.573 3.738 14.925 2.308 12 2.308 7.22 2.308 3.308 6.221 3.308 11c0 .36-.292.654-.654.654-.361 0-.654-.293-.654-.654C2 5.498 6.498 1 12 1c3.281 0 6.267 1.57 8.083 4.12z'/%3e%3c/svg%3e"> Miễn phí đổi trả 72h</span>
                    <span><img
                            src="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'> <path fill='%23006545' d='M12.822 16.756h-.777c-.362 0-.654-.293-.654-.654V5.308H2.654c-.361 0-.654-.292-.654-.654C2 4.293 2.293 4 2.654 4h9.39c.362 0 .655.293.655.654v2.208h5.07c.3 0 .561.204.634.495l.643 2.57 2.592 1.297c.222.11.362.337.362.585v4.293c0 .361-.293.654-.654.654h-2.924v.061c0 1.547-1.253 2.8-2.8 2.8s-2.8-1.253-2.8-2.8v-.061zm1.388-.424c-.052.152-.08.315-.08.485 0 .824.668 1.492 1.492 1.492s1.492-.668 1.492-1.492c0-.17-.028-.333-.08-.485l-.01-.025c-.208-.573-.757-.982-1.402-.982-.645 0-1.194.41-1.403.982-.003.009-.005.017-.009.025zm-1.031-.885c.48-.853 1.394-1.43 2.443-1.43 1.05 0 1.964.577 2.443 1.43h2.627v-3.234l-2.5-1.25c-.171-.085-.296-.241-.343-.426l-.591-2.367h-4.56v7.277h.48zm-3.996-4.292c.361 0 .654.293.654.654 0 .361-.293.654-.654.654H5.248c-.362 0-.654-.293-.654-.654 0-.361.292-.654.654-.654h3.935zm0 3.577c.361 0 .654.293.654.654 0 .362-.293.654-.654.654h-.984c-.361 0-.654-.292-.654-.654 0-.361.293-.654.654-.654h.984zM3.28 8.886c-.361 0-.654-.293-.654-.654 0-.362.293-.655.654-.655h5.903c.361 0 .654.293.654.655 0 .36-.293.654-.654.654H3.28zm12.28.776v.777h.778c.36 0 .654.293.654.654 0 .362-.293.655-.654.655h-1.431c-.362 0-.655-.293-.655-.655v-1.43c0-.362.293-.655.655-.655.36 0 .654.293.654.654z'/></svg>"> Giao hàng tận nơi</span>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper my-row" style="margin-top: 40px">
        <div class="description-product">
            <h4>Mô tả sản phẩm</h4>
            <span>${product.description}</span>
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

