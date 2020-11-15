<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
</head>
<body>

<!--================Portfolio Details Area =================-->
<section class="portfolio_details_area p_120">
    <div class="container">
        <h5 style="color: green"><b>${USERONLINE}</b> Online</h5>
        <div class="portfolio_details_inner">
            <div class="row">
                <div class="col-md-6">
                    <div class="left_img">
                        <img class="img-fluid" src="<c:url value='/template/images/info/xuanhuy.png'/> " alt="">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="portfolio_right_text">
                        <h4>Nguyen Xuan Huy</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                        <ul class="list">
                            <li><span>Rating</span>: <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></li>
                            <li><span>Client</span>:  admin</li>
                            <li><span>Website</span>:  xuanhuydev.com</li>
                            <li><span>Completed</span>:  17 Aug 2020</li>
                        </ul>
                        <ul class="list social_details">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.</p>
            <p>Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>
        </div>
    </div>
</section>
<!--================End Portfolio Details Area =================-->

<!--================Instagram Area =================-->
<section class="instagram_area">
    <div class="container box_1620">
        <div class="insta_btn">
            <a class="btn theme_btn" href="#">Follow us on instagram</a>
        </div>
        <div class="instagram_image row m0">
            <a href="#"><img src="img/instagram/ins-1.jpg" alt=""></a>
            <a href="#"><img src="img/instagram/ins-2.jpg" alt=""></a>
            <a href="#"><img src="img/instagram/ins-3.jpg" alt=""></a>
            <a href="#"><img src="img/instagram/ins-4.jpg" alt=""></a>
            <a href="#"><img src="img/instagram/ins-5.jpg" alt=""></a>
            <a href="#"><img src="img/instagram/ins-6.jpg" alt=""></a>
        </div>
    </div>
</section>
<!--================End Instagram Area =================-->

</body>
</html>