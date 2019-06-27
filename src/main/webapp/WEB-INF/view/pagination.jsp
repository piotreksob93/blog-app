<c:if test="${pages>1}">
    <div align="center">
            <ul class="pagination">

                <c:if test="${currentPage==1}">
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="/1">First</a></li>
                    <li class="page-item active"><a class="page-link" href="/${currentPage}">${currentPage}</a></li>
                    <li class="page-item"><a class="page-link" href="/${currentPage+1}">${currentPage+1}</a></li>
                    <c:if test="${pages>2}">
                        <li class="page-item"><a class="page-link" href="/${currentPage+2}">${currentPage+2}</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="/${pages}">Last</a></li>
                    <li class="page-item"><a class="page-link" href="/${currentPage+1}">Next</a></li>
                </c:if>
                <c:if test="${currentPage==pages}">
                    <li class="page-item"><a class="page-link" href="/${currentPage-1}">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="/1">First</a></li>
                    <c:if test="${pages>2}">
                        <li class="page-item"><a class="page-link" href="/${currentPage-2}">${currentPage-2}</a></li>
                    </c:if>
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
                <div>Strona ${currentPage} z ${pages}</div>
            </ul>
    </div>
</c:if>