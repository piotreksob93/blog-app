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
    Jesteś zalogowany jako: <a hfer=""><security:authentication property="principal.username"/></a><br>
    Twoje role to: <security:authentication property="principal.authorities"/><br>
    <form:form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout" class="btn btn-default btn-sm">
    </form:form>
    <a href="${pageContext.request.contextPath}/post/new" class="btn btn-primary btn-sm">Nowy post</a>
</div>
<security:authentication property="principal.username" var="username"/>


<hr width="60%">
<h1 align="center">POSTY:</h1>
<div  align="center">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:if test="${currentPage==1}">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">${currentPage+1}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+2}">${currentPage+2}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">Next</a></li>
            </c:if>
            <c:if test="${currentPage==pages}">
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-2}">${currentPage-2}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">${currentPage-1}</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            </c:if>
            <c:if test="${currentPage>1 and currentPage<pages}">
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">${currentPage-1}</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">${currentPage+1}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item "><a class="page-link" href="/${currentPage+1}">Next</a></li>
            </c:if>
        </ul>
    </nav>
</div>

<c:forEach var="tempPost" items="${posts}">
    <c:url var="deleteLink" value="/post/delete">
        <c:param name="postId" value="${tempPost.id}"/>
    </c:url>
    <c:url var="editLink" value="/post/edit">
        <c:param name="postId" value="${tempPost.id}"/>
    </c:url>
    <div align="center">
        <form:form>
            <h4><strong>${tempPost.postTitle}</strong></h4>

            <textarea rows="5" style="border: solid thin; width: 35%; resize: none" class="form-control" type="text"
                      readonly>${tempPost.postContent}</textarea>

            <security:authorize access="hasRole('ROLE_ADMIN') or ${username==tempPost.user.userName}">
                <p style="margin-top: 5px;">
                    <c:if test="${username==tempPost.user.userName}">
                        <a href="${editLink}" class="btn  btn-danger"
                           onclick="if(!(confirm('Napewno chcesz edytować ten post?'))) return false"><span
                                class="glyphicon glyphicon-edit"></span>Edytuj</a>
                    </c:if>
                    <a href="${deleteLink}" class="btn  btn-danger"
                       onclick="if(!(confirm('Napewno chcesz usunąc ten post?'))) return false"><span
                            class="glyphicon glyphicon-remove"></span>Usuń</a>
                </p>
            </security:authorize>
            <p>
                <label>Dodano dnia :</label>${tempPost.editDate}
                <label style="padding-left: 80px">Autor:</label> <a hfer="">${tempPost.user.userName}</a>
            </p>
        </form:form>
        <hr style="width: 45%;">
    </div>
</c:forEach>



<div  align="center">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:if test="${currentPage==1}">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">${currentPage+1}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+2}">${currentPage+2}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">Next</a></li>
            </c:if>
            <c:if test="${currentPage==pages}">
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-2}">${currentPage-2}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">${currentPage-1}</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
            </c:if>
            <c:if test="${currentPage>1 and currentPage<pages}">
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">Previous</a></li>
                <li class="page-item"><a class="page-link" href="/1">First</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage-1}">${currentPage-1}</a></li>
                <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                <li class="page-item"><a class="page-link" href="/${currentPage+1}">${currentPage+1}</a></li>
                <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                <li class="page-item "><a class="page-link" href="/${currentPage+1}">Next</a></li>
            </c:if>
        </ul>
    </nav>
</div>

</body>
</html>
