<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 21.05.2019
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Dodaj nowy post</title>
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
        <h2>Utwórz nowy post!</h2>
        <hr>
        <form:form action="${pageContext.request.contextPath}/post/save" method="post" modelAttribute="post">
            <form:hidden path="id"/>
            <div>
                <label>Tytuł</label>
                <form:errors path="postTitle" cssClass="error"/>
                <form:input path="postTitle" class="form-control form-control-sm"/>
            </div>
            <div>
                <label>Treść posta</label>
                <form:errors path="postContent" cssClass="error"/>
                <form:textarea rows="5" path="postContent" class="form-control form-control-sm" style="border: solid thin; resize: none"/>
            </div>
            <div style="display: flex; align-items: center; padding: 5px; justify-content: center;">
                <input type="submit" value="Zapisz post" class="btn btn-primary" style="margin-right: 1rem">
                </form:form>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Strona główna</a>
            </div>

    </div>
</div>


</body>
</html>
