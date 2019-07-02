<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pioter
  Date: 29.06.2019
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ustaw avatar</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<div align="center">
    <h2>Wybierz plik do zapisania (max 2mb)</h2>
    <p class="error">
        <%
            if (request.getParameter("fileSizeError")!=null){
                out.println("Przekroczono maksymalny rozmiar pliku do wgrania");
            }
        %>
    </p>

    <form:form action="${pageContext.request.contextPath}/user/processAvatarSave?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
        <p>
            <input type="file" name="avatar" size="50"/>
        </p>
        <p>
            <input type="hidden" name="id" value="<%= request.getParameter("userId") %>">
        </p>
        <p>
            <input type="submit" value="Zapisz plik" class="btn btn-primary"/>
        </p>
    </form:form>
</div>

</body>
</html>
