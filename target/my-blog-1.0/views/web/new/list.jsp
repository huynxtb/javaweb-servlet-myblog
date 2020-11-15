<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewURL" value="/home-new"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách bài viết</title>
</head>
<body>
<section class="news_section layout_padding">

    <form action="<c:url value='/home-new'/>" id="formSubmit" method="get">
        <div class="container">
            <div class="d-flex flex-column align-items-end">
                <div class="custom_heading-container">
                    <hr>
                    <h2>
                        Most News
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
            <input type="hidden" value="" id="id_page" name="page"/>
            <input type="hidden" value="" id="id_maxPageItem" name="maxPageItem"/>
            <input type="hidden" value="" id="id_sortName" name="sortName"/>
            <input type="hidden" value="" id="id_sortBy" name="sortBy"/>
            <input type="hidden" value="" id="id_type" name="type"/>

        </div>
    </form>
</section>

<script>

    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    var limit = 6;

    //var select = $( "#selected option:selected" ).val();

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#id_maxPageItem').val(limit);
                    $('#id_page').val(page);
                    $('#id_sortName').val('id');
                    $('#id_sortBy').val('desc');
                    $('#id_type').val('list');
                    $('#formSubmit').submit();
                }
            }
        });
    });

</script>
</body>

</html>