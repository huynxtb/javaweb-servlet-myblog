<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách bình luận</title>
</head>

<body>
<div class="main-content">

    <form action="<c:url value='/admin-comment'/>" id="formSubmit" method="get"> <!-- Chứa controller muốn submit về -->
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i><a href='<c:url value='/admin-home'/> '>Trang chủ</a></li>

                </ul>
                <!-- /.breadcrumb -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">

                        <div class="widget-box table-filter">
                            <div class="table-btn-controls">
                                <div class="pull-right tableTools-container">
                                    <div class="dt-buttons btn-overlap btn-group">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Content</th>
                                            <th>New ID</th>
                                            <th>Create By</th>
                                            <th>Create Date</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="comment" items="${model.listResult}">
                                            <tr>
                                                <td>${comment.content}</td>
                                                <td>${comment.newId}</td>
                                                <td>${comment.createdBy}</td>
                                                <td>${comment.createdDate}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <ul class="pagination" id="pagination"></ul>
                                    <input type="hidden" value="" id="page" name="page"/>
                                    <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
                                    <input type="hidden" value="" id="sortName" name="sortName"/>
                                    <input type="hidden" value="" id="sortBy" name="sortBy"/>
                                    <input type="hidden" value="" id="type" name="type"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</div>
<!-- /.main-content -->


<script>

    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};// page hiện tại đang đứng
    var limit = 5;

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,// số nút hiện trên thanh paging
            startPage: currentPage,
            onPageClick: function (event, page) {// page => page muốn chuyển đến. VD: page đang đứng là 4 -> 4. CLick 5 -> 5 => startPage = 5
                if (currentPage != page) {
                    $('#maxPageItem').val(limit); // tổng số item hiển thị trên 1 page
                    $('#page').val(page);
                    $('#sortName').val('id');
                    $('#sortBy').val('asc');
                    $('#type').val('list');
                    $('#formSubmit').submit(); // Submit action form vào url admin-user khi có sự kiện
                }
            }
        });
    });


</script>
</body>

</html>