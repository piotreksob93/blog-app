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

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">

    <!-- Bootstrap core CSS -->
    <link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
</head>
<body>

<h2 align="center">WITAJ NA STRONIE GŁÓWNEJ!</h2>
<div align="center">
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="btn btn-default btn-sm">
    </form:form>
    <form:form action="${pageContext.request.contextPath}/post/new" method="post">
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
