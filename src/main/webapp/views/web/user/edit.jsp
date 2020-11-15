<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/api-web-user"/>
<c:url var="APIdelAcc" value="/api-web-del-account"/>
<c:url var="UserURL" value="/trang-chu"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
<!--================Home Blog Area =================-->

<div class="container d-flex align-items-center flex-column">
    <!-- Masthead Avatar Image-->
    <br>
    <hr>
    <img class="masthead-avatar mb-5" src="<c:url value='/template/web/img/avt-user.gif'/> " alt="" />
    <!-- Masthead Heading-->
    <form id="formSubmit">
        <div class="profile-user-info profile-user-info-striped">
            <div class="profile-info-row">
                <div class="profile-info-name"> Username </div>
                <div class="profile-info-value">
                    <span class="editable">${USERMODEL.userName}</span>
                </div>
            </div>
            <br>
            <div class="profile-info-row">
                <div class="profile-info-name"> Full Name </div>
                <input type="text" class="form-control" id="fullName" name="fullName"
                       value="${USERMODEL.fullName}"/>
            </div>
            <br>
            <div class="profile-info-row">
                <div class="profile-info-name"> Email </div>
                <input type="text" class="form-control" id="email" name="email"
                       value="${USERMODEL.email}"/>
            </div>
            <br>
            <div class="profile-info-row">
                <div class="profile-info-name"> Joined </div>
                <div class="profile-info-value">
                    <span class="editable" >${USERMODEL.createdDate}</span>
                </div>
            </div>
            <br>
            <div class="profile-info-row">
                <div class="profile-info-name"> Last Modified </div>
                <div class="profile-info-value">
                    <span class="editable" >${USERMODEL.modifiedDate}</span>
                </div>
            </div>
            <br>
            <div class="profile-info-row">
                <div class="profile-info-name"> Password </div>
                <input type="password" class="form-control" id="password" name="password"
                       value="${USERMODEL.password}"/>
            </div>
        </div>
        <input type="hidden" value="${USERMODEL.id}" id="id" name="id"/>
    </form>
    <br>
    <input type="button" class="btn btn-white btn-warning btn-bold"
           value="Update Your Profile" id="btnUpdateUser"/>
    <hr>
    <input type="button" class="btn btn-white btn-danger btn-bold"
           value="Xoá Tài Khoản" id="btnDelAcc"/>
    <br>
    <hr>
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

    // ===================================================================================================================================================

    $('#btnDelAcc').click(function (e) {
        e.preventDefault();
        if (window.confirm('Oop~~ Bạn có chắc là muốn xoá tài khoản này không?'))
        {
            var data = {};
            var formData = $('#formSubmit').serializeArray();
            $.each(formData, function (i, v) {
                data["" + v.name + ""] = v.value;
            });
            delUser(data);
        }
    });

    function delUser(data) {
        $.ajax({
            url: '${APIdelAcc}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if (window.confirm('Tài khoản đã được xoá! Cám ơn bạn đã ghé thăm Blog'))
                {
                    window.location.href='/trang-chu?action=logout';
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