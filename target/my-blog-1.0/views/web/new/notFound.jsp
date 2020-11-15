<%@include file="/common/taglib.jsp" %>
<c:url var="NewURL" value="/home-new"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách tìm kiếm</title>
</head>

<body>

<section class="news_section layout_padding">
    <div class="not_found_search">
        <p>&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
            &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
            &ensp; &ensp; Không tìm thấy&ensp;<em><strong>
                <script>
                    var urlParams = new URLSearchParams(window.location.search);
                    var myParam = urlParams.get('textSearch');
                    document.write(myParam);
                </script>
            </strong></em>&ensp;trong tài liệu nào.
        </p>
        <p>&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
            &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;  &ensp; &ensp; &ensp; &ensp; &ensp;
            &ensp; &ensp; &ensp;Ðề xuất:</p>
        <ul>
            <li>&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp;* Xin bạn chắc chắn rằng tất cả các từ đều đúng chính tả.
            </li>
            <li>&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp;* Hãy thử những từ khóa khác.
            </li>
            <li>&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp;
                &ensp; &ensp; &ensp;* Hãy thử những từ khóa chung hơn.
            </li>
        </ul>
    </div>
    <hr>
    <img id="pikachu_gif_img" src="<c:url value='/template/images/pikachu_sad.gif'/>" alt="">

</section>

</body>

</html>