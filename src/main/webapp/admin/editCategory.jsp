<%--
  Created by IntelliJ IDEA.
  User: mihdu
  Date: 02/12/2023
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/admin?action=editCategory" method="post">
    <input type="text" name="id" value="${category.id}" readonly>
    <input type="text" name="name" value="${category.name}">
    <button>nhấn</button>

</form>
</body>
</html>
