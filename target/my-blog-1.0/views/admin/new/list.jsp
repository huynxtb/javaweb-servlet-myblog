<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var="NewURL" value="/admin-new"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách bài viết</title>
</head>

<body>
<div class="main-content">
    <form action="<c:url value='/admin-new'/>" id="formSubmit" method="get">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href='<c:url value='/admin-home'/> '>Trang chủ</a>
                    </li>
                </ul>
                <!-- /.breadcrumb -->
                </div><!-- /.nav-search -->
            </div>
            <div class="page-content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
                            <div class="alert alert-${alert}">
                                    ${messageResponse}
                            </div>
                        </c:if>

                        <!-- Option button  -->
                        <div class="widget-box table-filter">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h3 class="header smaller lighter blue">Số Lượng Bài Viết Muốn Hiển Thị</h3>
                                    <p></p>

                                    <label>Option: </label>
                                    <div class="btn-group">
                                        <input type='button' value='2' class="btn"
                                               onclick="document.location.href='http://localhost:8080/admin-new?type=list&page=1&maxPageItem=2&sortName=id&sortBy=asc';"/>
                                        <input type='button' value='4' class="btn"
                                               onclick="document.location.href='http://localhost:8080/admin-new?type=list&page=1&maxPageItem=4&sortName=id&sortBy=asc';"/>
                                        <input type='button' value='6' class="btn"
                                               onclick="document.location.href='http://localhost:8080/admin-new?type=list&page=1&maxPageItem=6&sortName=id&sortBy=asc';"/>
                                    </div>

                                </div>
                                <!-- /.span -->
                                <div class="col-sm-6">
                                    <h3 class="header smaller lighter green">Sắp Xếp</h3>
                                    <div class="btn-toolbar">
                                        <div class="btn-group">
                                            <button data-toggle="dropdown"
                                                    class="btn btn-success btn-lg dropdown-toggle">
                                                Tăng Dần
                                                <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-success dropdown-menu-right">
                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="id"/>
                                                        <c:param name="sortBy" value="asc"/>
                                                    </c:url>
                                                    <a href='${newList}'>ID</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="views"/>
                                                        <c:param name="sortBy" value="asc"/>
                                                    </c:url>
                                                    <a href='${newList}'>View</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="title"/>
                                                        <c:param name="sortBy" value="asc"/>
                                                    </c:url>
                                                    <a href='${newList}'>Title</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="content"/>
                                                        <c:param name="sortBy" value="asc"/>
                                                    </c:url>
                                                    <a href='${newList}'>Content</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- /.btn-group -->

                                        <div class="btn-group">
                                            <button data-toggle="dropdown"
                                                    class="btn btn-success btn-lg dropdown-toggle">
                                                Giảm Dần
                                                <i class="ace-icon fa fa-angle-down icon-on-right"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-success dropdown-menu-right">
                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="id"/>
                                                        <c:param name="sortBy" value="desc"/>
                                                    </c:url>
                                                    <a href='${newList}'>ID</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="views"/>
                                                        <c:param name="sortBy" value="desc"/>
                                                    </c:url>
                                                    <a href='${newList}'>View</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="title"/>
                                                        <c:param name="sortBy" value="desc"/>
                                                    </c:url>
                                                    <a href='${newList}'>Title</a>
                                                </li>

                                                <li>
                                                    <c:url var="newList" value="${NewURL}">
                                                        <c:param name="type" value="list"/>
                                                        <c:param name="page" value="1"/>
                                                        <c:param name="maxPageItem" value="6"/>
                                                        <c:param name="sortName" value="content"/>
                                                        <c:param name="sortBy" value="desc"/>
                                                    </c:url>
                                                    <a href='${newList}'>Content</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- /.btn-group -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Option button  -->

                        <div class="widget-box table-filter">
                            <div class="table-btn-controls">
                                <div class="pull-right tableTools-container">
                                    <div class="dt-buttons btn-overlap btn-group">
                                        <a flag="info"
                                           class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
                                           data-toggle="tooltip"
                                           title='Thêm bài viết' href='<c:url value="/admin-new?type=edit"/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
                                        </a>
                                        <button id="btnDelete" type="button"
                                                class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
                                                data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
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
                                            <th>Title</th>
                                            <th>Short Description</th>
                                            <th>Views</th>
                                            <th>Create By</th>
                                            <th>Create Date</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${model.listResult}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                                <td>${item.title}</td>
                                                <td>${item.shortDescription}</td>
                                                <th>${item.views}</th>
                                                <th>${item.createdDate}</th>
                                                <th>${item.createdBy}</th>
                                                <td>
                                                    <c:url var="editURL" value="/admin-new">
                                                        <c:param name="type" value="edit"/>
                                                        <c:param name="id" value="${item.id}"/>
                                                    </c:url>
                                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                                       title="Cập nhật bài viết" href='${editURL}'><i
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
    </form>
</div>
<!-- /.main-content -->
<script>
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
                    $('#sortName').val('id');
                    $('#sortBy').val('asc');
                    $('#type').val('list');
                    $('#formSubmit').submit();
                }
            }
        });
    });

    $("#btnDelete").click(function () {
        var data = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids;
        deleteNew(data);
    });

    function deleteNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (result) {
                window.location.href = "${NewURL}?type=list&maxPageItem=6&page=1&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${NewURL}?type=list&maxPageItem=6&page=1&message=error_system";
            }
        });
    }
</script>
</body>

</html>