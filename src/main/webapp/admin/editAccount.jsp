<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/4/2023
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/admin?action=editAccount" method="post">
    <input type="text" name="id" value="${account.id}" readonly>
    <input type="text" name="phoneNumber" value="${account.phoneNumber}" >
    <input type="text" name="password" value="${account.password}">
    <input type="text" name="role" value="${account.role}">
    <input type="text" name="fullName" value="${account.fullName}">
    <button type="submit">Submit</button>

</form>
</body>
</html>
