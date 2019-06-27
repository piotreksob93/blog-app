<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 26.06.2019
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rezultat wyszukiwania</title>
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
    <div style="width: 45%">
        <div align="center" style="padding: 5px">
            <h2>ZNALEZIONE POSTY:</h2>

            <a href="${pageContext.request.contextPath}/1" class="btn btn-primary">Strona główna</a>

            <div class="error" style="padding: 15px">
                <c:if test="${notFoundError !=null}">
                    ${notFoundError}
                </c:if>
            </div>
        </div>
        <c:forEach items="${posts}" var="tempPost">
            <div class="form-group">
                <ul class="list-group">
                    <li class="list-group-item">${tempPost.postTitle}</li>
                    <li class="list-group-item">${tempPost.postContent}</li>
                    <li class="list-group-item">${tempPost.user.userName}</li>
                </ul>
            </div>
        </c:forEach>


    </div>
</div>


</body>
</html>
