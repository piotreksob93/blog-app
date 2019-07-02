<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 12.06.2019
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Zmiana hasła</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        .error {
            color: red
        }
    </style>
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 20%">
        <h2>ZMIANA HASŁA</h2>

        <form:form action="${pageContext.request.contextPath}/user/processPasswordChange" modelAttribute="pass" method="post">
            <form:hidden path="password"/>
            <form:hidden path="username"/>
            <div class="error">
                <c:if test="${passwordChangeError1 !=null}">
                    ${passwordChangeError1}
                </c:if>
                <c:if test="${passwordChangeError2 !=null}">
                    ${passwordChangeError2}
                </c:if>
            </div>
            <div class="form-group">
                <label>Stare hasło:</label>
                <form:errors path="oldPassword" cssClass="error"/>
                <form:password path="oldPassword" placeholder="Stare haslo (*)" class="form-control form-control-sm"/>
            </div>

            <div class="form-group">
                <label>Nowe hasło:</label>
                <form:errors path="newPassword" cssClass="error"/>
                <form:password path="newPassword" placeholder="Nowe haslo (*)" class="form-control form-control-sm"/>
            </div>
            <button type="submit" class="btn btn-primary" style="margin-right: 1rem">Zapisz hasło</button>
            <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>
        </form:form>

    </div>
</div>
</body>
</html>
