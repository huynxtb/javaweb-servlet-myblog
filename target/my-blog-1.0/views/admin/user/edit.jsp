<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-web-user"/>
<c:url var="UserURL" value="/admin-home"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">User Profile</li>
            </ul>
        </div>

        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${not empty messageResponse}">
                        <div class="alert alert-${alert}">
                                ${messageResponse}
                        </div>
                    </c:if>
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="clearfix">
                        <div class="pull-left alert alert-success no-margin">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>

                            <i class="ace-icon fa fa-umbrella bigger-120 blue"></i>Please fill your information into the form !
                        </div>
                    </div>
                    <div class="hr dotted"></div>
                    <div>
                        <div id="user-profile-1" class="user-profile row">
                            <div class="col-xs-12 col-sm-3 center">
                                <div>
                                            <span class="profile-picture">
													<img id="avatar" class="editable img-responsive" alt="Alex's Avatar" src="<c:url value='/template/admin/assets/avatars/avatar_doraemon.gif'/> " />
												</span>
                                    <div class="space-4"></div>
                                    <div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
                                        <div class="inline position-relative">
                                            <a href="#" class="user-title-label dropdown-toggle" data-toggle="dropdown">
                                                <i class="ace-icon fa fa-circle light-green"></i> &nbsp;
                                                <span class="white">${USERMODEL.fullName}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="space-6"></div>
                                <div class="profile-contact-info">
                                    <div class="profile-contact-links align-left">
                                        <a href="#" class="btn btn-link">
                                            <i class="ace-icon fa fa-plus-circle bigger-120 green"></i> Add as a friend
                                        </a>
                                        <a href="#" class="btn btn-link">
                                            <i class="ace-icon fa fa-envelope bigger-120 pink"></i> Send a message
                                        </a>
                                    </div>
                                    <div class="space-6"></div>
                                </div>
                                <div class="hr hr12 dotted"></div>
                                <div class="hr hr16 dotted"></div>
                            </div>
                            <div class="col-xs-12 col-sm-9">
                                <div class="space-12"></div>
                                <form id="formSubmit">
                                <div class="profile-user-info profile-user-info-striped">
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Username </div>
                                        <div class="profile-info-value">
                                            <span class="editable">${USERMODEL.userName}</span>
                                        </div>
                                    </div>
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Full Name </div>
                                        <input type="text" class="form-control" id="fullName" name="fullName"
                                               value="${USERMODEL.fullName}"/>
                                    </div>
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Email </div>
                                        <input type="text" class="form-control" id="email" name="email"
                                               value="${USERMODEL.email}"/>
                                    </div>
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Joined </div>
                                        <div class="profile-info-value">
                                            <span class="editable" >${USERMODEL.createdDate}</span>
                                        </div>
                                    </div>
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Last Modified </div>
                                        <div class="profile-info-value">
                                            <span class="editable" >${USERMODEL.modifiedDate}</span>
                                        </div>
                                    </div>
                                    <div class="profile-info-row">
                                        <div class="profile-info-name"> Password </div>
                                        <input type="password" class="form-control" id="password" name="password"
                                               value="${USERMODEL.password}"/>
                                    </div>
                                </div>
                                    <input type="hidden" value="${USERMODEL.id}" id="id" name="id"/>
                                </form>
                                <hr>
                                <input type="button" class="btn btn-white btn-warning btn-bold"
                                       value="Update Your Profile" id="btnUpdateUser"/>
                                <div class="space-20"></div>
                                <div class="hr hr2 hr-double"></div>
                                <div class="space-6"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.well -->
            </div>
            <!-- /.span -->
        </div>
        <!-- /.user-profile -->
    </div>
</div>
<script>

    $('#btnUpdateUser').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        updateUser(data);
    });

    function updateUser(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if (window.confirm('Update success! Click "OK" to re-login to see the result...'))
                {
                    window.location.href='/dang-nhap?action=re-login';
                }
            },
            error: function (error) {
                window.location.href = "${UserURL}?action=profile&message=error_system";
            }
        });
    }

</script>
</body>
</html>
