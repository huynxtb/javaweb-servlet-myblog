<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>

    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- Custom Theme files -->
    <link href="<c:url value='/template/registration/css/style.css'/> " rel="stylesheet" type="text/css" media="all"/>
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- //web font -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link href="<c:url value='/template/registration/css/alert-css.css'/> " rel="stylesheet" type="text/css"
          media="all"/>
    <style>
        .error{
            outline: 1px solid red;
        }
    </style>

</head>
<body>

<dec:body/>


<script>
    $(document).ready(function(){
        $('#formSubmit input[type="text"]').blur(function(){
            if(!$(this).val()){
                $(this).addClass("error");
            } else{
                $(this).removeClass("error");
            }
        });
    });

    $(document).ready(function(){
        $('#formSubmit input[type="password"]').blur(function(){
            if(!$(this).val()){
                $(this).addClass("error");
            } else{
                $(this).removeClass("error");
            }
        });
    });

</script>
</body>
</html>