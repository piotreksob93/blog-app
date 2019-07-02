<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 25.05.2019
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profil użytkownika</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 20%">
        <h2>PROFIL UŻYTKOWNIKA</h2>
        <security:authentication property="principal.username" var="username"/>
        <form:form action="/user/edit"
                   modelAttribute="user" method="post">
        <form:hidden path="id"/>
        <form:hidden path="userName"/>
        <form:hidden path="password"/>
        <form:hidden path="matchingPassword"/>
        <form:hidden path="firstName"/>
        <form:hidden path="lastName"/>
        <form:hidden path="email"/>
        <form:hidden path="stringAvatar"/>
        <form:hidden path="avatar"/>



        <c:forEach items="${user.role}" var="tempRole" varStatus="st">
            <form:hidden path="role[${st.index}].id"/>
            <form:hidden path="role[${st.index}].roleName"/>
            <c:forEach items="${tempRole.user}" varStatus="st2">
                <form:hidden path="role[${st.index}].user[${st2.index}].id"/>
            </c:forEach>

        </c:forEach>


            <%--        <c:forEach items="${user.posts}" varStatus="st">--%>
            <%--            <form:hidden path="posts[${st.index}].id"/>--%>
            <%--            <form:hidden path="posts[${st.index}].user.id"/>--%>
            <%--            <form:hidden path="posts[${st.index}].editDate"/>--%>
            <%--            <form:hidden path="posts[${st.index}].postTitle"/>--%>
            <%--            <form:hidden path="posts[${st.index}].postContent"/>--%>
            <%--        </c:forEach>--%>
        <div class="form-group" align="center">
            <c:choose>
                <c:when test="${user.stringAvatar.length()==0}">
                    <img src="${pageContext.request.contextPath}/resources/images/default-profile-image2.jpg" style="max-width: 300px;">
                </c:when>
                <c:otherwise>
                    <img src="data:image/png;base64,${user.stringAvatar}" style="max-width: 300px;" />
                </c:otherwise>
            </c:choose>

        </div>
        <div class="form-group">
            <label>Username:</label>
            <ul class="list-group">
                <li class="list-group-item">${user.userName}</li>
            </ul>
        </div>

        <div class="form-group">
            <label>Role:</label>
            <ul class="list-group">
                <c:forEach items="${user.role}" var="tempRole" varStatus="status">
                    <li class="list-group-item">${tempRole.roleName}</li>
                </c:forEach>
            </ul>

        </div>
        <div class="form-group">
            <label>First name:</label>
            <ul class="list-group">
                <li class="list-group-item">${user.firstName}</li>
            </ul>
        </div>

        <div class="form-group">
            <label>Last name:</label>
            <ul class="list-group">
                <li class="list-group-item">${user.lastName}</li>
            </ul>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <ul class="list-group">
                <li class="list-group-item">${user.email}</li>
            </ul>
        </div>


        <%-- link do panelu admina --%>
        <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
            <security:authorize access="hasRole('ROLE_ADMIN') and ${user.userName==username}">
                <a href="${pageContext.request.contextPath}/admin/panel" class="btn btn-warning">Panel administratora</a>
            </security:authorize>
        </div>

        <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
            <c:if test="${user.userName==username}">
                <button type="submit" class="btn btn-primary" style="margin-right: 1rem">Edytuj dane</button>
            </c:if>

            <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>
            </form:form>
        </div>
        <c:if test="${user.posts.size()>0}" >
            <div class="form-group">
                <h2>POSTY UŻYTKOWNIKA:</h2>
                <ul class="list-group">
                    <li class="list-group-item" style="background: #337ab7; color: white;">LP | Data dodania postu |
                        Tytuł posta
                    </li>
                    <c:forEach items="${user.posts}" var="tempPost" varStatus="status">
                        <li class="list-group-item"> ${status.index+1}) | ${tempPost.editDate}
                            | ${tempPost.postTitle}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

    </div>
</div>
</body>
</html>
