<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Page Not Found</title>
    <link href="https://fonts.googleapis.com/css?family=Muli:400" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="<c:url value='/template/Error404/css/font-awesome.min.css'/> " />
    <link type="text/css" rel="stylesheet" href="<c:url value='/template/Error404/css/style-404.css'/> " />

    <link type="text/css" rel="stylesheet" href="<c:url value='/template/sakura/css/sakura.css'/> " />
</head>

<body>

<div id="notfound">
    <div class="notfound-bg"></div>
    <div class="notfound">
        <div class="notfound-404">
            <h1>404</h1>
        </div>
        <h3>Simple Team</h3>
        <h2>Oops! Page Not Found</h2>
        <div class="notfound-social">
            <a href="https://www.facebook.com/ForrestNguyenxh"><i class="fa fa-facebook"></i></a>
            <a href="mailto:forrestnguyenxh@gmail.com"><i class="fa fa-envelope"></i></a>
            <a href="tel://0399059205"><i class="fa fa-phone"></i></a>
            <!-- <a href="#"><i class="fa fa-google-plus"></i></a> -->
        </div>
        <a href="<c:url value='/trang-chu'/> ">Back To Homepage</a>
    </div>
</div>
<script src="<c:url value='/template/sakura/js/sakura.min.js'/> " text="text/javascript"></script>
<script src="<c:url value='/template/sakura/js/jsSakura.js'/> " text="text/javascript"></script>
</body>

</html>