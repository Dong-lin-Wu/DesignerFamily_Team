<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>header</title>
        </head>
        <body>

            <div class="header">
                <div class="header-left">
                  
                </div>
                <div class="header-right">
                    <div class="dashboard-setting user-notification">
                        <div class="dropdown">
                            <a class="dropdown-toggle no-arrow" href="javascript:;" data-toggle="right-sidebar">
                                <i class="dw dw-settings2"></i>
                            </a>
                        </div>
                    </div>
                    <div class="user-notification">
                        <div class="dropdown">
                            <a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
                                <i class="icon-copy dw dw-notification"></i>
                                <span class="badge notification-active"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <div class="notification-list mx-h-350 customscroll">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/img.jpg" alt="">
                                                <h3>John Doe</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/photo1.jpg" alt="">
                                                <h3>Lea R. Frith</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/photo2.jpg" alt="">
                                                <h3>Erik L. Richards</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/photo3.jpg" alt="">
                                                <h3>John Doe</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/photo4.jpg" alt="">
                                                <h3>Renee I. Hansen</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="/vendors/images/img.jpg" alt="">
                                                <h3>Vicki M. Coleman</h3>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="user-info-dropdown">
                        <div class="dropdown">
                            <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                                <span class="user-icon">
                                    <c:choose>
                                        <c:when test="${empty sessionScope.login.photo}">
                                            <img src="/assets/img/logo/logo2.png">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${sessionScope.login.photo}">
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                                <span class="user-name" style="font-size:20px">${sessionScope.login.account}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                <a href="/user" class="dropdown-item"><i class="dw dw-user1"></i> 會員中心</a>
                                <a href="/logout" class="dropdown-item">
                                    <i class="dw dw-logout"></i> 登出
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-sidebar">
                <div class="sidebar-title">
                    <h3 class="weight-600 font-16 text-blue">
                        版面設定
                    </h3>
                    <div class="close-sidebar" data-toggle="right-sidebar-close">
                        <i class="icon-copy ion-close-round"></i>
                    </div>
                </div>
                <div class="right-sidebar-body customscroll">
                    <div class="right-sidebar-body-content">
                        <h4 class="weight-600 font-18 pb-10">上方導覽列背景顏色</h4>
                        <div class="sidebar-btn-group pb-30 mb-10">
                            <a href="javascript:void(0);" class="btn btn-outline-primary header-white active">白色</a>
                            <a href="javascript:void(0);" class="btn btn-outline-primary header-dark">深色</a>
                        </div>

                        <h4 class="weight-600 font-18 pb-10">左方導覽列背景顏色</h4>
                        <div class="sidebar-btn-group pb-30 mb-10">
                            <a href="javascript:void(0);" class="btn btn-outline-primary sidebar-light ">白色</a>
                            <a href="javascript:void(0);" class="btn btn-outline-primary sidebar-dark active">深色</a>
                        </div>

                        <h4 class="weight-600 font-18 pb-10">左方導覽列下拉式選單圖示</h4>
                        <div class="sidebar-radio-group pb-10 mb-10">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebaricon-1" name="menu-dropdown-icon"
                                    class="custom-control-input" value="icon-style-1" checked="">
                                <label class="custom-control-label" for="sidebaricon-1"><i
                                        class="fa fa-angle-down"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebaricon-2" name="menu-dropdown-icon"
                                    class="custom-control-input" value="icon-style-2">
                                <label class="custom-control-label" for="sidebaricon-2"><i
                                        class="ion-plus-round"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebaricon-3" name="menu-dropdown-icon"
                                    class="custom-control-input" value="icon-style-3">
                                <label class="custom-control-label" for="sidebaricon-3"><i
                                        class="fa fa-angle-double-right"></i></label>
                            </div>
                        </div>

                        <h4 class="weight-600 font-18 pb-10">左方導覽列下拉式選單選項圖示</h4>
                        <div class="sidebar-radio-group pb-30 mb-10">
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-1" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-1" checked="">
                                <label class="custom-control-label" for="sidebariconlist-1"><i
                                        class="ion-minus-round"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-2" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-2">
                                <label class="custom-control-label" for="sidebariconlist-2"><i class="fa fa-circle-o"
                                        aria-hidden="true"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-3" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-3">
                                <label class="custom-control-label" for="sidebariconlist-3"><i
                                        class="dw dw-check"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-4" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-4" checked="">
                                <label class="custom-control-label" for="sidebariconlist-4"><i
                                        class="icon-copy dw dw-next-2"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-5" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-5">
                                <label class="custom-control-label" for="sidebariconlist-5"><i
                                        class="dw dw-fast-forward-1"></i></label>
                            </div>
                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" id="sidebariconlist-6" name="menu-list-icon"
                                    class="custom-control-input" value="icon-list-style-6">
                                <label class="custom-control-label" for="sidebariconlist-6"><i
                                        class="dw dw-next"></i></label>
                            </div>
                        </div>

                        <div class="reset-options pt-30 text-center">
                            <button class="btn btn-danger" id="reset-settings">復原</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="left-side-bar">
                <div class="brand-logo">
                    <a href="/index">
                        <img src="/assets/logow.png" alt="" class="">
                     
                    </a>
                    <div class="close-sidebar" data-toggle="left-sidebar-close">
                        <i class="ion-close-round"></i>
                    </div>
                </div>
                <div class="menu-block customscroll">
                    <div class="sidebar-menu">
                        <ul id="accordion-menu">
                            <li>
                                <a href="/admin" class="dropdown-toggle no-arrow">
                                    <span class="micon dw dw-house-1"></span><span class="mtext" style="font-size:20px">首頁</span>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle">
                                    <span class="micon icon-copy fa fa-user-o"></span><span class="mtext" style="font-size:20px">成員</span>
                                </a>
                                <ul class="submenu">
                                    <li><a href="/member/members" style="font-size:20px">成員清單</a></li>
                                    <li><a href="/member/designers" style="font-size:20px">設計師清單</a></li>
                                    <li><a href="/member/members.insert" style="font-size:20px">新增管理員</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="/product" class="dropdown-toggle no-arrow">
                                    <span class="micon icon-copy dw dw-shop" aria-hidden="true"></span><span
                                        class="mtext" style="font-size:20px">商品</span>
                                </a>
                            </li>
                            <li>
                                <a href="/order" class="dropdown-toggle no-arrow">
                                    <span class="micon icon-copy dw dw-shopping-cart" aria-hidden="true"></span><span
                                        class="mtext" style="font-size:20px">訂單</span>
                                </a>
                            </li>
                            <li>
                                <a href="/news" class="dropdown-toggle no-arrow">
                                    <span class="micon icon-copy fa fa-newspaper-o" aria-hidden="true"></span><span
                                        class="mtext" style="font-size:20px">活動</span>
                                </a>
                            </li>
                            <li>
                                <a href="/forum/forum_backend.controller" class="dropdown-toggle no-arrow">
                                    <span class="micon icon-copy dw dw-chat-2" aria-hidden="true"></span><span
                                        class="mtext" style="font-size:20px">討論區</span>
                                </a>
                            </li>
                            <li>
                                <a href="/raiseindex.controller" class="dropdown-toggle no-arrow">
                                    <span class="micon icon-copy dw dw-sprout-1" aria-hidden="true"></span><span
                                        class="mtext" style="font-size:20px">募資</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="mobile-menu-overlay"></div>
        </body>

        </html>