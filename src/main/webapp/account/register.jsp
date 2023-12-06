<%--
  Created by IntelliJ IDEA.
  User: mihdu
  Date: 04/12/2023
  Time: 7:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/account?action=register" method="post">
    <input type="text" name="fullName" placeholder="Full Name">
    <input type="text" name="phoneNumber" placeholder="Phone Number">
    <input type="text" name="password" placeholder="Password">
    <button type="submit">Đăng ký</button>
</form>
</body>
</html>
