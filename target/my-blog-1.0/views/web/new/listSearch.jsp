<%@include file="/common/taglib.jsp" %>
<c:url var="NewURL" value="/home-new"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tìm kiếm</title>
</head>

<body>

<section class="news_section layout_padding">
    <form action="<c:url value='/tim-kiem'/>" id="formSearch" method="get">
        <div class="container">
            <div class="d-flex flex-column align-items-end">
                <div class="custom_heading-container">
                    <hr>
                    <h2>
                        Danh sách bài viết bạn có thể đang tìm
                    </h2>

                </div>
            </div>

            <div class="row">

                <c:forEach var="item" items="${model.listResult}">
                    <div class="col-md-4">
                        <div class="box">
                            <div class="img-box">
                                <img src="<c:url value='/template/web/img/java.png'/>" alt="">
                            </div>
                            <div class="action-box">
                                <div class="action">
                                    <c:url var="details" value="${NewURL}">
                                        <c:param name="type" value="detail"/>
                                        <c:param name="id" value="${item.id}"/>
                                    </c:url>
                                    <a href='${details}'><i aria-hidden="true"></i>
                                            <%-- <img  title='${model.views}' src="<c:url value='/template/images/view.png'/>" alt=""> --%>
                                    </a>
                                    <a href="">
                                        <img title='share on facebook' src="<c:url value='/template/images/share.png'/>" alt="">
                                    </a>
                                </div>
                            </div>

                            <div class="detail-box">
                                <h4>
                                        ${item.title}
                                </h4>
                                <p>
                                        ${item.shortDescription}
                                </p>
                                <p>
                                        ${item.views} Views
                                </p>
                                <div>
                                    <a href='/home-new?type=detail&id=${item.id}&page=1&maxPageItem=5&sortName=id&sortBy=desc'><i aria-hidden="true"></i> Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <br>
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="textSearch" name="textSearch"/>
            <input type="hidden" value="" id="page" name="page"/>
            <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
            <input type="hidden" value="" id="sortName" name="sortName"/>
            <input type="hidden" value="" id="sortBy" name="sortBy"/>
        </div>
    </form>
</section>

<script>

    var urlParams = new URLSearchParams(window.location.search);     // Get các giá trị hiện có trên url
    var myParam = urlParams.get('textSearch'); // Get value của param id trên url
    document.getElementById("textSearch").value = myParam; // gán value myParam cho thẻ input có ID = id_cate

    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    var limit = 6;

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('title');
                    $('#sortBy').val('desc');
                    $('#formSearch').submit();
                }
            }
        });
    });

</script>
</body>

</html>