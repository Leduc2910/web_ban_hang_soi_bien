<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container-fluid container-fix">
    <div class="header">
        <div class="col-md-6">
            <span style="font-size: 26px; padding-left: 16px; color: #545151">Admin page - ${fullName}</span>
        </div>
        <div class="col-md-6">
            <div class="nav-item dropdown dropdown-right">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa-solid fa-user" style="color: #2968d6; font-size: 20px"></i>
                </a>
                <div class="dropdown-menu"><a class="dropdown-item" href="/home?action=home">Back to Home Page</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="/account?action=logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="leftbar">
            <div class="function-search">
                <div class="search">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                               style="height: 40px; width: 230px">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="font-size: 16px">
                            Search
                        </button>
                    </form>
                </div>
            </div>
            <div class="function">
                <div class="item"><a href="/admin?action=home"><i class="fa-solid fa-house"></i>Home</a>
                </div>
                <div class="item"><a href="/admin?action=managerCategory"><i class="fa-solid fa-list"></i>Category
                </a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fa-solid fa-cube"></i>Product<i
                        class="fa-solid fa-angle-left dropdown" style="margin-left: 230px"></i></a>
                    <div class="sub-menu">
                        <a href="/admin?action=managerProduct" class="sub-item">List product</a>
                        <a href="/admin?action=addProduct" class="sub-item">Add product</a>
                    </div>
                </div>
                <div class="item"><a href="/admin?action=managerAccount"><i
                        class="fa-solid fa-user-group"></i>Account</a>
                </div>
                <div class="item"><a href="/admin?action=managerOrder"><i class="fa-solid fa-list-check"></i>Order</a>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="row row-fix">
                <div class="col-12">
                    <h1><span style="font-weight: normal; font-size: smaller">Edit</span> Order</h1>
                    <hr>
                </div>
                <div class="col-12 mt-3">
                    <form action="/admin?action=editOrder&id=${orderDetail.id}" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-7">
                                <div class="wrapper-orderitem" style="max-height: 680px; overflow: auto">
                                    <hr style="width: 100%">
                                    <div class="orderitem-head">
                                        <div class="head-blank"></div>
                                        <div class="head-name">Name</div>
                                        <div class="head-quantity">Quantity</div>
                                    </div>
                                    <c:forEach items="${lstOrderItem}" var="orderItem">
                                        <c:forEach items="${lstProduct}" var="product">
                                            <c:if test="${orderItem.idProduct == product.id}">
                                                <hr style="width: 100%">
                                                <div class="orderitem-product">
                                                    <div class="product-image"><img
                                                            src="${product.image}"
                                                            alt=""></div>
                                                    <div class="product-name">${product.name}</div>
                                                    <div class="product-quantity">${orderItem.quantity}</div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group col-md-5">
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputName">Full Name</label>
                                        <input type="text" class="form-control" id="inputName" name="fullName"
                                               value="${orderDetail.fullName}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputPhone">Phone Number</label>
                                        <input type="text" class="form-control" id="inputPhone" name="phoneNumber"
                                               value="${orderDetail.phoneNumber}" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputAddress">Address</label>
                                        <textarea type="text" class="form-control" id="inputAddress" name="address"
                                                  style="height: 80px; resize: none">${orderDetail.address}</textarea>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputStatus">Status</label>
                                        <select id="inputStatus" class="form-control" name="status">
                                            <c:choose>
                                                <c:when test="${orderDetail.statusOrder == 0}">
                                                    <option value="1">Đã hoàn thành</option>
                                                    <option value="0" selected>Chờ giao hàng</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="1" selected>Đã hoàn thành</option>
                                                    <option value="0">Chờ giao hàng</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputTotalPrice">Total Price</label>
                                        <input type="text" class="form-control" id="inputTotalPrice" name="totalPrice" value="${orderDetail.totalPrice}" readonly>
                                    </div>
                                </div>
                                <div class="form-row mt-12">
                                    <div class=" col-md-5">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                        <a href="/admin?action=managerOrder" class="btn btn-secondary">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/javascript/main.js"></script>
</body>
</html>