<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 25.06.2019
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wybór roli użytkownika</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 20%">
        <h2>USTAW ROLE UŻYTKOWNIKA!</h2>
        <form:form action="${pageContext.request.contextPath}/admin/processRoleUpdate" method="post" modelAttribute="roleDto">

            <form:hidden path="username"/>
            <div class="form-group">
                <label>Role lista:</label>
                <ul class="list-group">
                    <form:select path="formRole" items="${roles}" class="form-control"/>
                </ul>
            </div>
            <button type="submit" class="btn btn-primary" style="margin-right: 1rem">Zapisz</button>
        </form:form>
    </div>
</div>
</body>
</html>
