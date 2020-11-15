<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Dashboard</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form action="<c:url value='/admin-tim-kiem'/>" id="formSearch" method="get">
                    <input type="hidden" value="1" id="page" name="page"/>
                    <input type="hidden" value="6" id="maxPageItem" name="maxPageItem"/>
                    <input type="hidden" value="title" id="sortName" name="sortName"/>
                    <input type="hidden" value="desc" id="sortBy" name="sortBy"/>
                    <input type="text" class="input_search" id="textSearch" name="textSearch" placeholder="Tìm kiếm trong blog">
                    <input type="submit" class="main_btn" value="SEARCH">
                </form>
            </div><!-- /.nav-search -->

        </div>

        <div class="page-content">

            <div class="page-header">
                <h1>
                    Dashboard
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="alert alert-block alert-success">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>

                        <i class="ace-icon fa fa-check green"></i>

                        Xin chào,
                        <strong class="green">
                            ${USERMODEL.fullName}
                        </strong>
                        Chúc bạn một ngày vui vẻ! Nhớ hoàn thành các task của team nhá!!!
                    </div>

                    <div class="row">
                        <div class="space-6"></div>

                        <div class="col-sm-7 infobox-container">
                            <div class="infobox infobox-green">
                                <div class="infobox-icon">
                                    <i class="ace-icon fa fa-comments"></i>
                                </div>

                                <div class="infobox-data">
                                    <span class="infobox-data-number">${comments.totalItem}</span>
                                    <div class="infobox-content">Comments</div>
                                </div>

                            </div>

                            <div class="infobox infobox-blue">
                                <div class="infobox-icon">
                                    <i class="ace-icon fa fa-file-text"></i>
                                </div>

                                <div class="infobox-data">
                                    <span class="infobox-data-number">${model.totalItem}</span>
                                    <div class="infobox-content">News</div>
                                </div>

                            </div>

                            <div class="infobox infobox-pink">
                                <div class="infobox-icon">
                                    <i class="ace-icon fa fa-tasks"></i>
                                </div>

                                <div class="infobox-data">
                                    <span class="infobox-data-number">${categorys.totalItem}</span>
                                    <div class="infobox-content">Category</div>
                                </div>
                            </div>

                            <div class="infobox infobox-red">
                                <div class="infobox-icon">
                                    <i class="ace-icon fa fa-users"></i>
                                </div>

                                <div class="infobox-data">
                                    <span class="infobox-data-number">${users.totalItem}</span>
                                    <div class="infobox-content">Users</div>
                                </div>
                            </div>

                            <div class="space-6"></div>

                            <div class="infobox infobox-green infobox-small infobox-dark">
                                <div class="infobox-progress">
                                    <div class="easy-pie-chart percentage" data-percent="61" data-size="39">
                                        <span class="percent"></span>
                                    </div>
                                </div>

                                <div class="infobox-data">
                                    <div class="infobox-content"></div>
                                    <div class="infobox-content"></div>
                                </div>
                            </div>

                            <div class="infobox infobox-blue infobox-small infobox-dark">
                                <div class="infobox-chart">
                                    <span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
                                </div>

                                <div class="infobox-data">
                                    <div class="infobox-content"></div>
                                    <div class="infobox-content"></div>
                                </div>
                            </div>

                            <div class="infobox infobox-grey infobox-small infobox-dark">
                                <div class="infobox-icon">

                                </div>

                                <div class="infobox-data">
                                    <div class="infobox-content"></div>
                                    <div class="infobox-content"></div>
                                </div>
                            </div>
                        </div>

                        <div class="vspace-12-sm"></div>

                        <div class="col-sm-5">
                            <div class="widget-box">
                                <div class="widget-header widget-header-flat widget-header-small">
                                    <h5 class="widget-title">
                                        <i class="ace-icon fa fa-signal"></i>
                                        Share & Like on Social Media
                                    </h5>

                                    <div class="widget-toolbar no-border">
                                        <div class="inline dropdown-hover">
                                            <button class="btn btn-minier btn-primary">
                                                This Week
                                                <i class="ace-icon fa fa-angle-down icon-on-right bigger-110"></i>
                                            </button>

                                            <ul class="dropdown-menu dropdown-menu-right dropdown-125 dropdown-lighter dropdown-close dropdown-caret">
                                                <li class="active">
                                                    <a href="#" class="blue">
                                                        <i class="ace-icon fa fa-caret-right bigger-110">&nbsp;</i>
                                                        This Week
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#">
                                                        <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                        Last Week
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#">
                                                        <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                        This Month
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#">
                                                        <i class="ace-icon fa fa-caret-right bigger-110 invisible">&nbsp;</i>
                                                        Last Month
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">
                                        <div id="piechart-placeholder"></div>

                                        <div class="hr hr8 hr-double"></div>

                                        <div class="clearfix">
                                            <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-facebook-square fa-2x blue"></i>
																&nbsp; likes
															</span>
                                                <h4 class="bigger pull-right">1,255</h4>
                                            </div>

                                            <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-facebook-square fa-2x purple"></i>
																&nbsp; shares
															</span>
                                                <h4 class="bigger pull-right">941</h4>
                                            </div>

                                            <div class="grid3">
															<span class="grey">
																<i class="ace-icon fa fa-instagram fa-2x red"></i>
																&nbsp; insta
															</span>
                                                <h4 class="bigger pull-right">1,050</h4>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-main -->
                                </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <div class="hr hr32 hr-dotted"></div>

                    <div class="hr hr32 hr-dotted"></div>

                    <div class="row">
                        <div class="col-sm-6">
                            <div class="widget-box transparent" id="recent-box">
                                <div class="widget-header">
                                    <h4 class="widget-title lighter smaller">
                                        <i class="ace-icon fa fa-rss orange"></i>RECENT
                                    </h4>

                                    <div class="widget-toolbar no-border">
                                        <ul class="nav nav-tabs" id="recent-tab">
                                            <li class="active">
                                                <a data-toggle="tab" href="#task-tab">Tasks</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main padding-4">
                                        <div class="tab-content padding-8">
                                            <div id="task-tab" class="tab-pane active">
                                                <h4 class="smaller lighter green">
                                                    <i class="ace-icon fa fa-list"></i>
                                                    Task Table
                                                </h4>

                                                <ul id="tasks" class="item-list">
                                                    <li class="item-red clearfix">
                                                        <label class="inline">
                                                            <input type="checkbox" class="ace" />
                                                            <span class="lbl"> Fixing bugs</span>
                                                        </label>

                                                        <div class="pull-right action-buttons">
                                                            <a href="#" class="blue">
                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                            </a>

                                                            <span class="vbar"></span>

                                                            <a href="#" class="red">
                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                            </a>

                                                            <span class="vbar"></span>

                                                            <a href="#" class="green">
                                                                <i class="ace-icon fa fa-flag bigger-130"></i>
                                                            </a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-main -->
                                </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                        </div><!-- /.col -->

                        <div class="col-sm-6">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title lighter smaller">
                                        <i class="ace-icon fa fa-comment blue"></i>
                                        Admin Conversation
                                    </h4>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <div class="dialogs">

                                            <div class="itemdiv dialogdiv">
                                                <div class="user">
                                                    <img alt="Alexa's Avatar" src="<c:url value='/template/images/doraemon_comment.gif'/> " />
                                                </div>

                                                <div class="body">
                                                    <div class="time">
                                                        <i class="ace-icon fa fa-clock-o"></i>
                                                        <span class="green">4 sec</span>
                                                    </div>

                                                    <div class="name">
                                                        <a href="#">Alexa</a>
                                                    </div>
                                                    <div class="text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo massa sed ipsum porttitor facilisis.</div>

                                                    <div class="tools">
                                                        <a href="#" class="btn btn-minier btn-info">
                                                            <i class="icon-only ace-icon fa fa-share"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <form>
                                            <div class="form-actions">
                                                <div class="input-group">
                                                    <input placeholder="Type your message here ..." type="text" class="form-control" name="message" />
                                                    <span class="input-group-btn">
																	<button class="btn btn-sm btn-info no-radius" type="button">
																		<i class="ace-icon fa fa-share"></i>
																		Send
																	</button>
																</span>
                                                </div>
                                            </div>
                                        </form>
                                    </div><!-- /.widget-main -->
                                </div><!-- /.widget-body -->
                            </div><!-- /.widget-box -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->
</body>
</html>