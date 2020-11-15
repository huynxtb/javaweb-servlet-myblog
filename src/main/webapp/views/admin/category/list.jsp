<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-category"/>
<c:url var="CategoryURL" value="/admin-category"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách thể loại</title>
</head>

<body>
<div class="main-content">

    <form action="<c:url value='/admin-category'/>" id="formSubmit" method="get"> <!-- Chứa controller muốn submit về -->
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="ace-icon fa fa-home home-icon"></i>   <a href='<c:url value='/admin-home'/> '>Trang chủ</a></li>
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
                                        <a flag="info"
                                           class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                           data-toggle="tooltip" title='Thêm thể loại' href='<c:url value="/admin-category?type=edit"/>'> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
                                        </a>

                                        <button id="btnDelete" type="button"
                                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa thể loại'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
                                        </button>

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
                                            <th><input type="checkbox" id="checkAll"></th>
                                            <th>Name</th>
                                            <th>Code</th>
                                            <th>Create Date</th>
                                            <th>Create By</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="category" items="${model.listResult}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${category.id}" value="${category.id}"></td>
                                                <td>${category.name}</td>
                                                <td>${category.code}</td>
                                                <td>${category.createdDate}</td>
                                                <td>${category.createdBy}</td>
                                                <td>
                                                    <c:url var="editURL" value="/admin-category">
                                                        <c:param name="type" value="edit"/>
                                                        <c:param name="id" value="${category.id}"/>
                                                    </c:url>
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Update Category" href='${editURL}'><i
                                                            class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>
                                                </td>
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
    var limit = 4;

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

    $("#btnDelete").click(function () {
        var data = {};

        // Vào thẻ tbody -> input với tyoe là checkbox -> Kiểm tra xem đã checked chưa thì get từng value vào ids
        var ids = $('tbody input[type=checkbox]:checked').map(function () { // get tất các id đc check
            return $(this).val();
        }).get();

        data['ids'] = ids;
        deleteCategory(data);

    });

    function deleteCategory(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${CategoryURL}?type=list&maxPageItem=4&page=1&sortName=id&sortBy=asc&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${CategoryURL}?type=list&maxPageItem=4&page=1&sortName=id&sortBy=asc&message=error_system";
            }
        });
    }

</script>
</body>

</html>