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
</head>
<body>

<div style="display: flex; justify-content: center; margin-top: 15px;">
    <div style="width: 35%;">
        <h2>Utwórz nowy post!</h2>
        <hr>
        <form:form action="/post/save" method="post" modelAttribute="post">
            <form:hidden path="id"/>
            <div>
                <label>Tytuł</label>
                <form:input path="postTitle" class="form-control form-control-sm"/>
            </div>
            <div>
                <label>Treść posta</label>

                <form:textarea rows="5" path="postContent" class="form-control form-control-sm" style="border: solid thin; resize: none"/>
            </div>
            <input type="submit" value="Zapisz post" class="btn btn-primary" style="margin-top: 10px;">
        </form:form>
    </div>
</div>


</body>
</html>
