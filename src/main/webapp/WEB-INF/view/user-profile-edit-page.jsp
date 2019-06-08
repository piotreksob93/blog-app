<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 28.05.2019
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edycja profilu</title>
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
        <h2>EDYTUJ PROFIL UŻYTKOWNIKA:</h2>
        <form:form action="/user/processUserUpdate" modelAttribute="user" method="post">
            <form:hidden path="id"/>
            <form:hidden path="userName"/>
            <form:hidden path="password"/>
            <c:forEach items="${user.role.toArray()}" varStatus="st">
                <form:hidden path="role[${st.index}].id"/>
                <form:hidden path="role[${st.index}].roleName"/>
            </c:forEach>
            <c:forEach items="${user.posts}" varStatus="st">
                <form:hidden path="posts[${st.index}].id"/>
                <form:hidden path="posts[${st.index}].user.id"/>
                <form:hidden path="posts[${st.index}].editDate"/>
                <form:hidden path="posts[${st.index}].postTitle"/>
                <form:hidden path="posts[${st.index}].postContent"/>
            </c:forEach>

            <div class="form-group">
                <label>First name:</label>
                <form:errors path="firstName" cssClass="error"/>
                <form:input path="firstName" placeholder="Imię (*)" class="form-control form-control-sm"/>
            </div>
            <div class="form-group">
                <label>Last name:</label>
                <form:errors path="lastName" cssClass="error"/>
                <form:input path="lastName" placeholder="Nazwisko (*)" class="form-control form-control-sm"/>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <form:errors path="email" cssClass="error"/>
                <form:input path="email" placeholder="Email (*)" class="form-control form-control-sm"/>
            </div>
            <div class="form-group">
                <label>Role:</label>
                <ul class="list-group">
                    <c:forEach items="${user.role}" var="tempRole" varStatus="status">
                        <li class="list-group-item">${tempRole.roleName}</li>
                    </c:forEach>
                </ul>
            </div>
            <button type="submit" class="btn btn-primary" style="margin-right: 1rem">Zapisz</button>
            <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>
        </form:form>

    </div>
</div>
</body>
</html>
