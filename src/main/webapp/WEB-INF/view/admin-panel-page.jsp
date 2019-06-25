<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 25.06.2019
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Panel Administratora</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 20%">
        <h2>PANEL ADMINISTRATORA!</h2>

        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary">Lista użytkowników</a>
        <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>
    </div>
</div>
</body>
</html>
