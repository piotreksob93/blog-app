<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 20.05.2019
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Strona rejestracji</title>
    <style>
        .error {
            color: red
        }
    </style>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 20%">
        <h2>REJESTRACJA:</h2>
        <form:form action="${pageContext.request.contextPath}/register/processRegistrationForm"
                   modelAttribute="blogUser">
        <div class="error">
            <c:if test="${registrationError !=null}">
                ${registrationError}
            </c:if>
        </div>
        <div class="form-group">
            <label>Username:</label>
            <form:errors path="userName" cssClass="error"/>
            <form:input path="userName" placeholder="username (*)" class="form-control form-control-sm"/>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <form:errors path="password" cssClass="error"/>
            <form:password path="password" placeholder="password (*)" class="form-control form-control-sm"/>
        </div>
        <div class="form-group">
            <label>Password:</label>
            <form:errors path="matchingPassword" cssClass="error"/>
            <form:password path="matchingPassword" placeholder="password (*)" class="form-control form-control-sm"/>
        </div>
        <div class="form-group">
            <label>First name:</label>
            <form:errors path="firstName" cssClass="error"/>
            <form:input path="firstName" placeholder="first name (*)" class="form-control form-control-sm"/>
        </div>
        <div class="form-group">
            <label>Last name:</label>
            <form:errors path="lastName" cssClass="error"/>
            <form:input path="lastName" placeholder="last name (*)" class="form-control form-control-sm"/>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <form:errors path="email" cssClass="error"/>
            <form:input path="email" placeholder="email (*)" class="form-control form-control-sm"/>
        </div>

        <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
            <button type="submit" class="btn btn-primary" style="margin-right: 1rem">Zarejestruj</button>
            </form:form>
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Strona główna</a>
        </div>

    </div>
</div>
</body>
</html>
