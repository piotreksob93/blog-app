<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 10.06.2019
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj komentarz</title>
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
    <div style="width: 35%;">
        <h2>Dodaj nowy komentarz</h2>
        <hr>
        <form:form action="${pageContext.request.contextPath}/comment/save"
                   method="post" modelAttribute="postComment">

        <form:hidden path="id"/>

        <form:hidden path="post.id"/>
        <form:hidden path="post.postTitle"/>
        <form:hidden path="post.postContent"/>
        <form:hidden path="post.editDate"/>
<%--        <form:hidden path="post.user.id"/>--%>

        <div>
            <label>Tresc komentarza</label>
            <form:errors path="commentContent" cssClass="error"/>
            <form:textarea rows="5" path="commentContent" class="form-control form-control-sm"
                           style="border: solid thin; resize: none"/>
        </div>


        <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
            <input type="submit" value="Zapisz komentarz" class="btn btn-primary" style="margin-right: 1rem">
            </form:form>
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Strona główna</a>
        </div>

    </div>
</div>
</body>
</html>
