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
<form action="/account" method="post">
    <input type="hidden" name="action" value="login">
    <input type="text" name="phoneNumber" placeholder="Phone Number">
    <input type="password" name="password" placeholder="Password">
    <button type="submit">Đăng nhập</button>
    <a href="/account?action=register">Đăng kí</a>
</form>
</body>
</html>
