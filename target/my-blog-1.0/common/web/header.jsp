<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewURL" value="/home-new"/>
<!--================Header Menu Area =================-->
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand logo_h" href='<c:url value="/trang-chu"/>'><img src="<c:url value='/template/web/img/logo.png'/>"
                                                                                       alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item active"><a class="nav-link" href='<c:url value="/trang-chu"/>'>Trang Chủ</a></li>
                        <!-- <li class="nav-item"><a class="nav-link" href="about-us.html">About</a></li> -->
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">Thể Loại</a>

                            <ul class="dropdown-menu">
                                <c:forEach var="item" items="${categories}">

                                    <c:url var="listCategoryCode" value="${NewURL}">
                                        <c:param name="type" value="list-by-category-code"/>
                                        <c:param name="page" value="1"/>
                                        <c:param name="maxPageItem" value="6"/>
                                        <c:param name="sortName" value="id"/>
                                        <c:param name="sortBy" value="asc"/>
                                        <c:param name="id" value="${item.id}"/>
                                    </c:url>
                                    <li class="nav-item" value="${item.code}"><a class="nav-link" href='${listCategoryCode}'>${item.name}</a></li>
                                </c:forEach>
                                <input type="hidden" value="" id="id" name="id"/>
                            </ul>

                        </li>

                        <c:url var="list" value="${NewURL}">
                            <c:param name="type" value="list"/>
                            <c:param name="page" value="1"/>
                            <c:param name="maxPageItem" value="6"/>
                            <c:param name="sortName" value="views"/>
                            <c:param name="sortBy" value="desc"/>
                        </c:url>

                        <li class="nav-item"><a class="nav-link" href='${list}'>Bài Xem Nhiều Nhất</a></li>
                        <li class="nav-item"><a class="nav-link" href="404.html">About Us</a></li>

                        <c:if test="${not empty USERMODEL}">
                            <li class="nav-item">
                                <a id="name-user" class="nav-link" href='<c:url value="/thong-tin-nguoi-dung?action=profile"/>'>Wellcome ${USERMODEL.fullName}</a>
                            </li>
                            <li id="logout-link" class="nav-item">
                                <a id="logout" class="nav-link" href='<c:url value="/thoat?action=logout"/>'>Log Out</a>
                            </li>
                        </c:if>
                        <c:if test="${empty USERMODEL}">
                            <li id="login-link" class="nav-item">
                                <a class="nav-link" href='<c:url value="/dang-nhap?action=login"/>'>Login</a>
                            </li>
                            <li id="sign-up-link" class="nav-item">
                                <a class="nav-link" href='<c:url value="/dang-ky?action=registration"/>'>Sign In</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<!--================Header Menu Area =================-->

<!--================Home Banner Area =================-->
<section class="banner_area">
    <div class="box_1620">
        <div class="banner_inner d-flex align-items-center">
            <div class="container">
                <div class="banner_content text-center">
                    <div class="welcome_text">
                        <h2>Welcome To Simple Blog</h2>
                    </div>

                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="<c:url value='/tim-kiem'/>" id="formSearch" method="get">
                                <input type="hidden" value="1" id="page" name="page"/>
                                <input type="hidden" value="6" id="maxPageItem" name="maxPageItem"/>
                                <input type="hidden" value="title" id="sortName" name="sortName"/>
                                <input type="hidden" value="desc" id="sortBy" name="sortBy"/>
                                <input type="text" class="input_search" id="textSearch" name="textSearch" placeholder="Tìm kiếm trong blog">
                                <input type="submit" class="main_btn" value="SEARCH">
                            </form>
                        </div>
                        <div class="fb-share-button"
                             data-href="https://www.w3schools.com/"
                             data-layout="button" data-size="large"><a target="_blank"
                             href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse"
                             class="fb-xfbml-parse-ignore">Share</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Home Banner Area =================-->