<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="APIurl" value="/dang-ky"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration</title>
</head>
<body>
<div class="main-w3layouts wrapper">
    <h1>SIMPLE BLOG</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <div class="login100-form-title" >
					<span style="text-align: center;" class="login100-form-title-1">
						<c:if test="${not empty message}">
					<div id="alert" class="alert alert-${alert}">
                            ${message}
                    </div>
                        </c:if>
					</span>
            </div>
            <form action="<c:url value='/dang-ky'/>" method="post" id="formSubmit">
                <input class="text" type="text" id="userName" name="userName" value="" placeholder="User Name" required="">

                <br>
                <br>
                <input class="text" type="password" id="password" name="password" value="" placeholder="Password" required="">

                <br>
                <br>
                <input class="text" type="text" id="fullName" name="fullName" value="" placeholder="Full Name" required="">

                <br>
                <br>
                <input class="text" type="text" id="email" name="email" value="" placeholder="Email" required=""/>
<%--                <input type="button" class="btn btn-white btn-warning btn-bold" value="Đăng Ký" id="btnAdd"/>--%>
<%--                --%>
                <input type="hidden" value="registration" name="action"/>
                <br>
                <button type="submit" id="btnAdd" class="btn btn-success">DANG KY</button>
                <br>
            </form>

            <p>Have an Account? <a href='<c:url value="/dang-nhap?action=login"/> '> Login Now!</a></p>
        </div>
    </div>
    <!-- copyright -->
    <div class="colorlibcopy-agile">
        <p>© 2020 Simple Blog Signup Form. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">Simple Team</a></p>
    </div>
    <!-- //copyright -->
    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

</body>

</html>