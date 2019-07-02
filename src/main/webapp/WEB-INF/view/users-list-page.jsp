<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
    <title>Lista użytkowników</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 45%">
        <h2>ZAREJESTROWANI UŻYTKOWNICY!</h2>


        <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
            <security:authorize access="hasRole('ROLE_ADMIN')">
                <a href="${pageContext.request.contextPath}/admin/panel" class="btn btn-warning">Panel administratora</a>
            </security:authorize>
            <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>
        </div>



        <table class="table table-sm table-striped">
            <thead>
            <tr class="bg-primary">
                <th scope="col">#</th>
                <th scope="col">Nazwa użytkownika</th>
                <th scope="col">Imię</th>
                <th scope="col">Nazwisko</th>
                <th scope="col">Role</th>
                <th scope="col">Email</th>
                <th scope="col">Akcje</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="tempUser" varStatus="st">
                <c:url var="userRolesChangeLink" value="/admin/change">
                    <c:param name="username" value="${tempUser.userName}"/>
                </c:url>
                <tr>
                    <th scope="row">${st.index+1}</th>
                    <td>${tempUser.userName}</td>
                    <td>${tempUser.firstName}</td>
                    <td>${tempUser.lastName}</td>
                    <td>
                        <c:forEach items="${tempUser.role}" var="tempRole">
                            ${tempRole.roleName}<br>
                        </c:forEach>
                    </td>
                    <td>${tempUser.email}</td>
                    <td style="white-space: nowrap"><a href="${userRolesChangeLink}">Ustaw role</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
