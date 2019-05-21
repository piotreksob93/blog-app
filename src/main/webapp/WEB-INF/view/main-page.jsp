<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 20.05.2019
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Strona główna</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>

<h2 align="center">WITAJ NA STRONIE GŁÓWNEJ!</h2>
<div align="center">
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="btn btn-default btn-sm">
    </form:form>
    <form:form action="${pageContext.request.contextPath}/post/new" method="get">
        <input type="submit" value="Nowy post" class="btn btn-primary btn-sm">
    </form:form>
</div>
<hr width="60%">
<h1 align="center">POSTY:</h1>

<c:forEach var="tempPost" items="${posts}">
    <div align="center">
        <form:form>

            <h4><strong>${tempPost.postTitle}</strong></h4>
            <textarea rows="3" style="border: solid thin; width: 35%; resize: none" class="form-control" type="text" readonly>${tempPost.postContent}</textarea>
            <p><label >Ostatnio edytowano:</label>${tempPost.editDate}<label style="padding-left: 100px">Autor:</label> ${tempPost.user.userName}</p>
        </form:form>
        <hr style="width: 45%;">
    </div>
</c:forEach>

</body>
</html>
