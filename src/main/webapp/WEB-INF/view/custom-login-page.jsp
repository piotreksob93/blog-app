<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 20.05.2019
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Strona logowania</title>
    <style>
        .failed {
            color: red;
        }
        .success{
            color: green;
        }
    </style>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div align="center" style="width: 20%">
        <h2>LOGOWANIE!</h2>
        <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post">
            <c:if test="${param.error != null}">
                <i class="failed">Podałeś niewałaściwe dane logowania</i>
            </c:if>
            <c:if test="${param.logout !=null}">
                <i class="success">Pomyślnie wylogowano</i>
            </c:if>
            <p>
                <label>Username:</label><input type="text" name="username" class="form-control form-control-sm"/>
            </p>
            <p>
                <label>Passowrd:</label><input type="password" name="password" class="form-control form-control-sm"/>
            </p>
            <input type="submit" value="Zaloguj" class="btn btn-info"/>
            <a href="${pageContext.request.contextPath}/register/showRegistrationPage" class="btn btn-info">Zarejestruj się</a>
        </form:form>
    </div>
</div>


</body>
</html>
