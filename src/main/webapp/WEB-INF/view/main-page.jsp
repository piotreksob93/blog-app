<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Strona główna</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>


<h2 align="center">WITAJ NA STRONIE GŁÓWNEJ!</h2>

<div align="center">
    <security:authentication property="principal.username" var="username"/>
    <c:url var="userProfLink" value="/user/profile">
        <c:param name="username" value="${username}"/>
    </c:url>


    Jesteś zalogowany jako: <a href="${userProfLink}">${username}</a><br>
    Twoje role to: <security:authentication property="principal.authorities"/><br>

    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="btn btn-default btn-sm">
    </form:form>

    <a href="${pageContext.request.contextPath}/post/new" class="btn btn-primary btn-sm">Nowy post</a>
</div>


<hr width="60%">
<h1 align="center">POSTY:</h1>

<div align="center">


    <form action="/post/search" method="get">
        <div>Szukaj postu:</div>
        <input name="postTitle" placeholder="Podaj tytuł posta kóry szukasz" style="width: 20%"/>
        <button type="submit" class="btn  btn-primary"><span
                style="padding-bottom: 2px"
                class="glyphicon glyphicon-search"></span></button>
    </form>
</div>


<c:forEach var="tempPost" items="${posts}">
    <c:url var="deleteLink" value="/post/delete">
        <c:param name="postId" value="${tempPost.id}"/>
    </c:url>
    <c:url var="editLink" value="/post/edit">
        <c:param name="postId" value="${tempPost.id}"/>
    </c:url>
    <c:url var="commentLink" value="/comment/new">
        <c:param name="postId" value="${tempPost.id}"/>
    </c:url>
    <c:url var="userProfLink" value="/user/profile">
        <c:param name="username" value="${tempPost.user.userName}"/>
    </c:url>


    <div align="center">


        <form:form>

            <h4><strong>${tempPost.postTitle}</strong></h4>

            <textarea rows="5" style="border: solid thin; width: 35%; resize: none" class="form-control" type="text"
                      readonly>${tempPost.postContent}</textarea>

            <p style="margin-top: 5px;">
                <security:authorize access="hasRole('ROLE_ADMIN') or ${username==tempPost.user.userName}">

                    <c:if test="${username==tempPost.user.userName}">
                        <a href="${editLink}" class="btn  btn-danger"
                           onclick="if(!(confirm('Napewno chcesz edytować ten post?'))) return false"><span
                                class="glyphicon glyphicon-edit"></span> Edytuj</a>
                    </c:if>
                    <a href="${deleteLink}" class="btn  btn-danger"
                       onclick="if(!(confirm('Napewno chcesz usunąc ten post?'))) return false"><span
                            class="glyphicon glyphicon-remove"></span> Usuń</a>
                </security:authorize>
                <a href="${commentLink}" class="btn  btn-primary"
                   onclick="if(!(confirm('Napewno chcesz skomentować ten post?'))) return false"><span
                        class="glyphicon glyphicon-comment"></span> Skomentuj</a>
            </p>

            <p>
                <label>Dodano dnia :</label>${tempPost.editDate}
                <label style="padding-left: 80px">Autor:</label> <a href="${userProfLink}">${tempPost.user.userName}</a>
            </p>


            <%--            Comments here--%>
            <div>


                <c:if test="${tempPost.postComments.size()>2}">
                    <c:set var="commentsNumber" value="${tempPost.postComments.size()-2}"/>
                </c:if>


                <c:forEach items="${tempPost.postComments}" begin="${commentsNumber}" var="tempComment">
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
                <c:url var="commentListLink" value="/comment/list">
                    <c:param name="postId" value="${tempPost.id}"/>
                </c:url>
                <c:if test="${tempPost.postComments.size()>0}">
                    <a href="${commentListLink}">Pokaż wszystkie komentarze(${tempPost.postComments.size()})</a>
                </c:if>
            </div>
        </form:form>
        <hr style="width: 45%;">
    </div>
</c:forEach>

<jsp:directive.include file="pagination.jsp"/>


</body>
</html>
