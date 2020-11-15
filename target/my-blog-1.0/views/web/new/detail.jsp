<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewURL" value="/home-new"/>
<c:url var="CommentAPI" value="/api-web-comment"/>
<html>
<head>
    <title>Chi tiết bài viết</title>
</head>
<body>
<section class="blog_area single-post-area p_120">


    <div class="row">
        <div class="col-lg-8 posts-list">
            <div class="single-post row">
                <div class="col-lg-3  col-md-3">
                    <div class="blog_info text-right">
                        <ul class="blog_meta list">
                            <li><a href="#">${model.createdDate}<i class="lnr lnr-calendar-full"></i></a></li>
                            <li><a href="#">${model.createdBy}<i class="lnr lnr-user"></i></a></li>
                            <li><a href="#">${model.views} Views<i class="lnr lnr-eye"></i></a></li>
                            <li><a href="#comment_VIEW" id="jump_comment"><input type="button" class="btn btn-info"
                                                                                 value="Clik me go to comment"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9 blog_details">
                    <h1>${model.title}</h1>
                    <p>${model.content}</p>
                </div>
            </div>


            <!--Start Comment-->
            <div id="comment_VIEW" class="container" >
                <form action="<c:url value='/home-new'/>" id="formSubmitPage" method="get">
                    <div id="reload_CMT" class="comments-area">
                        <hr>
                        <c:if test="${empty USERMODEL}">
                            <h4 style="color:Tomato;">Hãy Đăng Nhập Để Có Thể Viết Bình Luân</h4>
                        </c:if>
                        <a href="#middle"></a>
                        <h4 style="color:#0040ff;">${commentss.totalItem} Comments</h4>
                        <c:forEach var="itemss" items="${commentss.listResult}">
                            <div class="comment-list">
                                <div class="single-comment justify-content-between d-flex">
                                    <div class="user justify-content-between d-flex">
                                        <div class="thumb">
                                            <img src="<c:url value='/template/images/doraemon_comment.gif'/> " alt="">
                                        </div>
                                        <div class="desc">
                                            <h5><a href="">${itemss.createdBy}</a></h5>
                                            <p class="date">${itemss.createdDate}</p>
                                            <p id="commentList${itemss.id}" class="comment">${itemss.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <ul class="pagination" id="pagination"></ul>
                        <input type="hidden" value="" id="cmt_id" name="id"/>
                        <input type="hidden" value="" id="cmt_page" name="page"/>
                        <input type="hidden" value="" id="cmt_maxPageItem" name="maxPageItem"/>
                        <input type="hidden" value="" id="cmt_sortName" name="sortName"/>
                        <input type="hidden" value="" id="cmt_sortBy" name="sortBy"/>
                        <input type="hidden" value="" id="cmt_ype" name="type"/>
                        <c:if test="${not empty USERMODEL}">
                            <h4 style="color:#ff4d4d;">Scroll down to write a comment</h4>
                        </c:if>
                    </div>
                    <!--End Comment-->
                </form>

                <!--Submmit Comment-->
                <c:if test="${not empty USERMODEL}">
                    <div class="comment-form">
                        <h4>Leave a Reply</h4>
                        <form id="formSubmitComment">
                            <div class="form-group">
                                <textarea style="border: 2px solid #0080ff;width: 900px;height: 175px" rows=""
                                          id="content" name="content" placeholder="Messege" onfocus="this.placeholder = ''"
                                          onblur="this.placeholder = 'Messege'" required=""></textarea>
                            </div>
                            <input type="hidden" value="${model.id}" id="id" name="newId"/>
                            <input type="button" class="btn btn-primary"
                                   value="Post Comment" id="btnAddOrUpdateComment"/>
                        </form>
                    </div>
                </c:if>
                <!--End Submit Comment-->
            </div>
        </div>
        <!--Another Content-Right-->
        <div class="col-lg-4">
            <div class="blog_right_sidebar">

                <!--Form Search-->
                <aside class="single_sidebar_widget search_widget">
                    <div class="input-group">
                        <form action="<c:url value='/tim-kiem'/>" id="formSearch" method="get">
                            <input type="hidden" value="1" id="page" name="page"/>
                            <input type="hidden" value="6" id="maxPageItem" name="maxPageItem"/>
                            <input type="hidden" value="views" id="sortName" name="sortName"/>
                            <input type="hidden" value="asc" id="sortBy" name="sortBy"/>
                            <input type="text" class="form-control" id="textSearch" name="textSearch"
                                   placeholder="Tìm kiếm trong blog">
                            <br>
                            <input type="submit" class="main_btn" value="SEARCH">
                        </form>
                    </div>
                    <div class="br"></div>
                </aside>
                <!--End Form Search-->

                <aside class="single_sidebar_widget popular_post_widget">
                    <h3 class="widget_title">Popular Posts</h3>
                    <div class="media post_item">
                        <img src="<c:url value='/template/images/popular-post/post1.jpg'/> " alt="post">
                        <div class="media-body">
                            <a href="blog-details.html">
                                <h3>Space The Final Frontier</h3>
                            </a>
                            <p>02 Hours ago</p>
                        </div>
                    </div>
                    <div class="media post_item">
                        <img src="<c:url value='/template/images/popular-post/post2.jpg'/> " alt="post">
                        <div class="media-body">
                            <a href="blog-details.html">
                                <h3>The Amazing Hubble</h3>
                            </a>
                            <p>02 Hours ago</p>
                        </div>
                    </div>
                    <div class="media post_item">
                        <img src="<c:url value='/template/images/popular-post/post3.jpg'/> " alt="post">
                        <div class="media-body">
                            <a href="blog-details.html">
                                <h3>Astronomy Or Astrology</h3>
                            </a>
                            <p>03 Hours ago</p>
                        </div>
                    </div>
                    <div class="media post_item">
                        <img src="<c:url value='/template/images/popular-post/post4.jpg'/> " alt="post">
                        <div class="media-body">
                            <a href="blog-details.html">
                                <h3>Asteroids telescope</h3>
                            </a>
                            <p>01 Hours ago</p>
                        </div>
                    </div>
                    <div class="br"></div>
                </aside>
                <aside class="single_sidebar_widget post_category_widget">
                    <h4 class="widget_title">Post Catgories</h4>
                    <ul class="list cat-list">
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Technology</p>
                                <p>37</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Lifestyle</p>
                                <p>24</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Fashion</p>
                                <p>59</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Art</p>
                                <p>29</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Food</p>
                                <p>15</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Architecture</p>
                                <p>09</p>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="d-flex justify-content-between">
                                <p>Adventure</p>
                                <p>44</p>
                            </a>
                        </li>
                    </ul>
                    <div class="br"></div>
                </aside>
                <aside class="single-sidebar-widget newsletter_widget">
                    <h4 class="widget_title">Newsletter</h4>
                    <p>
                        Here, I focus on a range of items and features that we use in life without giving them a second
                        thought.
                    </p>
                    <div class="form-group d-flex flex-row">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                            </div>
                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Enter email"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email'">
                        </div>
                        <a href="#" class="bbtns">Subcribe</a>
                    </div>
                    <p class="text-bottom">You can unsubscribe at any time</p>
                    <div class="br"></div>
                </aside>
                <aside class="single-sidebar-widget tag_cloud_widget">
                    <h4 class="widget_title">Tag Clouds</h4>
                    <ul class="list">
                        <li><a href="#">Technology</a></li>
                        <li><a href="#">Fashion</a></li>
                        <li><a href="#">Architecture</a></li>
                        <li><a href="#">Fashion</a></li>
                        <li><a href="#">Food</a></li>
                        <li><a href="#">Technology</a></li>
                        <li><a href="#">Lifestyle</a></li>
                        <li><a href="#">Art</a></li>
                        <li><a href="#">Adventure</a></li>
                        <li><a href="#">Food</a></li>
                        <li><a href="#">Lifestyle</a></li>
                        <li><a href="#">Adventure</a></li>
                    </ul>
                </aside>
            </div>
        </div>
        <!--End Another Content-Right-->
    </div>

    <%--    </div>--%>
</section>

<script>

    var urlParams = new URLSearchParams(window.location.search);     // Get các giá trị hiện có trên url
    var myParam = urlParams.get('id'); // Get value của param id trên url
    document.getElementById("cmt_id").value = myParam; // gán value myParam cho thẻ input có ID = id_cate

    var totalPages = ${commentss.totalPage};
    var currentPage = ${commentss.page};
    var limit = 5;

    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#cmt_maxPageItem').val(limit);
                    $('#cmt_page').val(page);
                    $('#cmt_sortName').val('id');
                    $('#cmt_sortBy').val('desc');
                    $('#cmt_ype').val('detail');
                    $('#formSubmitPage').submit();
                    // $('#jump_comment').onclick;
                }
            }
        });
    });

    $('#btnAddOrUpdateComment').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmitComment').serializeArray();
        $.each(formData, function (i, v) {
            data["" + v.name + ""] = v.value;
        });
        addComment(data);
        document.getElementById("jump_comment").click();
        console.log(data);
    });

    function addComment(data) {
        $.ajax({
            url: '${CommentAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                location.reload();
            },
            error: function (error) {
                window.location.href = "${NewURL}?type=list&maxPageItem=6&page=1&message=error_system";
            }
        });
    }

</script>
</body>
</html>
