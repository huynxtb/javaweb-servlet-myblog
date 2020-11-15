<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href='<c:url value='/admin-home'/> ' class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Page Admin
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
                <li class="green">
                    <a title='Thêm bài viết' href='<c:url value="/admin-new?type=edit"/>'>
                        <i class="ace-icon fa fa-plus icon-animated-vertical"></i>
                    </a>
                </li>
                <li class="purple">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-exclamation-triangle"></i>8 Notifications
                        </li>
                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                <li>
                                    <a href="#">
                                        <div class="clearfix"><span class="pull-left"><i
                                                class="btn btn-xs no-hover btn-pink fa fa-comment"></i>New Comments</span>
                                            <span class="pull-right badge badge-info">+12</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="btn btn-xs btn-primary fa fa-user"></i>
                                        Bob just signed up as an editor ...
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="clearfix"><span class="pull-left"><i
                                                class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>New Orders</span>
                                            <span class="pull-right badge badge-success">+8</span></div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														Followers
													</span>
                                            <span class="pull-right badge badge-info">+11</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">
                                See all notifications
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle" aria-expanded="false">

                        <span class="user-info">
									<small>Welcome,</small>
									${USERMODEL.fullName}
								</span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>
                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href='<c:url value="/admin-home?action=profile"/>'>
                                <i class="ace-icon fa fa-user"></i>
                                Profile
                            </a>
<%--                            <a href='<c:url value="/admin-category?type=list&page=1&maxPageItem=4&sortName=id&sortBy=asc"/>'>--%>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href='<c:url value="/thoat?action=logout"/>'>
                                <i class="ace-icon fa fa-power-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>


