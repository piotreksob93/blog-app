<%--
  Created by IntelliJ IDEA.
  User: Piotrek
  Date: 21.05.2019
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Komentarze posta</title>
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
    <div style="width: 100%;">


        <security:authentication property="principal.username" var="username"/>

        <c:url var="userProfLink" value="/user/profile">
            <c:param name="username" value="${post.user.userName}"/>
        </c:url>

        <div align="center">
            <form:form>
                <h4><strong>${post.postTitle}</strong></h4>

                <textarea rows="5" style="border: solid thin; width: 35%; resize: none" class="form-control" type="text"
                          readonly>${post.postContent}</textarea>

                <p>
                    <label>Dodano dnia :</label>${post.editDate}
                    <label style="padding-left: 80px">Autor:</label> <a href="${userProfLink}">${post.user.userName}</a>
                </p>


                <%--            Comments here--%>
                <div>
                    <c:forEach items="${post.postComments}" var="tempComment">
                        <c:url var="userProfLink2" value="/user/profile">
                            <c:param name="username" value="${tempComment.user.userName}"/>
                        </c:url>
                        <c:url var="commentDeleteLink" value="/comment/delete">
                            <c:param name="commentId" value="${tempComment.id}"/>
                        </c:url>
                        <c:url var="commentEditLink" value="/comment/edit">
                            <c:param name="commentId" value="${tempComment.id}"/>
                        </c:url>

                        <div class="container" style="padding-bottom: 10px; width: 25%;">
                            <a href="${userProfLink2}">${tempComment.user.userName}</a>
                                ${tempComment.editDate}
                            <p style="border: black solid thin;">${tempComment.commentContent}</p>
                            <security:authorize
                                    access="hasRole('ROLE_ADMIN') or ${username==tempComment.user.userName}">
                                <c:if test="${username==tempComment.user.userName}">
                                    <a href="${commentEditLink}" class="btn  btn-danger btn-sm"
                                       onclick="if(!(confirm('Napewno chcesz edytować ten komentarz?'))) return false"><span
                                            style="padding-bottom: 2px"
                                            class="glyphicon glyphicon-edit"></span></a>
                                </c:if>

                                <a href="${commentDeleteLink}" class="btn  btn-danger btn-sm"
                                   onclick="if(!(confirm('Napewno chcesz usunąc ten komentarz?'))) return false"><span
                                        style="padding-bottom: 2px"
                                        class="glyphicon glyphicon-remove"></span></a>
                            </security:authorize>
                        </div>
                    </c:forEach>
                </div>
            </form:form>
            <hr style="width: 45%;">
            <a href="${pageContext.request.contextPath}/" class="btn btn-primary">Strona główna</a>
        </div>


    </div>

</div>


</body>
</html>
