<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>梅嘎 | Mega</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
        <!-- CSS here -->
        <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="/assets/css/slicknav.css">
        <link rel="stylesheet" href="/assets/css/flaticon.css">
        <link rel="stylesheet" href="/assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="/assets/css/lightslider.min.css">
        <link rel="stylesheet" href="/assets/css/price_rangs.css">
        <link rel="stylesheet" href="/assets/css/gijgo.css">
        <link rel="stylesheet" href="/assets/css/animate.min.css">
        <link rel="stylesheet" href="/assets/css/animated-headline.css">
        <link rel="stylesheet" href="/assets/css/magnific-popup.css">
        <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="/assets/css/themify-icons.css">
        <link rel="stylesheet" href="/assets/css/slick.css">
        <link rel="stylesheet" href="/assets/css/nice-select.css">
        <link rel="stylesheet" href="/assets/css/style.css">
        <link rel="stylesheet" href="/roll/css/all.css">
    </head>
    <body>
        <!-- header Start -->
        <header>
            <div class="header-area">
                <div class="main-header header-sticky">
                    <div class="container-fluid">
                        <div class="row menu-wrapper align-items-center justify-content-between">
                            <div class="header-left d-flex align-items-center">
                                <!-- Logo -->
                                <div class="logo" >
                                    <a href="/index"><img src="/assets/img/logo/logo.png" alt=""></a>
                                </div>
                                <!-- Logo-2 -->
                                <div class="logo2" >
                                    <a href="/index"><img src="/assets/img/logo/logo2.png" alt=""></a>
                                </div>
                                <!-- Main-menu -->
                                <div class="main-menu  d-none d-lg-block" >
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="/index" style="font-size:16px">首頁</a></li> 
                                            <li><a href="/index" style="font-size:16px">商品</a>
                                                <ul class="submenu">
                                                    <li><a href="product/catagory">配件飾品</a></li>
                                                    <li><a href="product/catagory">文具</a></li>
                                                    <li><a href="product/catagory">包包提袋</a></li>
                                                    <li><a href="product/catagory">衣著</a></li>
                                                    <li><a href="product/catagory">居家生活</a></li>
                                                    <li><a href="product/catagory">創意科技</a></li>
                                                    <li><a href="product/catagory">其他</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="/news/newsinfo" style="font-size:16px">最新活動</a></li>
                                            <li><a href="/forum/forum" style="font-size:16px">討論區</a></li>
                                            <li><a href="/front_raiseindex.controller" style="font-size:16px">募資</a></li>
                                            <li><a href="contact.html" style="font-size:16px">聯絡我們</a></li>
                                        </ul>
                                    </nav>
                                </div>   
                            </div>
                            <div class="header-right1 d-flex align-items-center">
                                <div class="search">
                                    <ul class="d-flex align-items-center">
                                        <li>
                                            <!-- Search Box -->
                                            <form action="#" class="form-box f-right ">
                                                <input type="text" name="Search" placeholder="搜尋...">
                                                <div class="search-icon">
                                                    <i class="ti-search"></i>
                                                </div>
                                            </form>
                                        </li>
                                        <li>
                                        <c:choose>
											<c:when test="${not empty sessionScope.login}">
											    <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="#" style="font-size:16px">${sessionScope.login.account}</a>
                                                <ul class="submenu">
                                                    <li><a href="/user">會員中心</a></li>
                                                    <li><a href="product/catagory">我的訂單</a></li>
                                                    <li><a href="product/catagory">優惠券</a></li>   
                                                    <li><a href="/logout">登出</a></li>                                               
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div> 
											</c:when>
											 <c:otherwise>
									    <a href="/login" class="account-btn" target="_blank">登入|註冊</a>
											 </c:otherwise>
									    </c:choose>                                  
                                        <li>                                 
                                            <div class="card-stor">
                                             <a href="/order/mycart" ><img src="/assets/img/icon/card.svg" alt="" title="購物車"></a>                                        
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header end -->
        
        <!-- Jquery, Popper, Bootstrap -->
<script src="/assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- Slick-slider , Owl-Carousel ,slick-nav -->
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/jquery.slicknav.min.js"></script>

<!-- One Page, Animated-HeadLin, Date Picker , price, light-slider -->
<script src="/assets/js/wow.min.js"></script>
<script src="/assets/js/animated.headline.js"></script>
<script src="/assets/js/jquery.magnific-popup.js"></script>
<script src="/assets/js/gijgo.min.js"></script>
<script src="/assets/js/lightslider.min.js"></script>
<script src="/assets/js/price_rangs.js"></script>

<!-- Nice-select, sticky,Progress -->
<script src="/assets/js/jquery.nice-select.min.js"></script>
<script src="/assets/js/jquery.sticky.js"></script>
<script src="/assets/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="/assets/js/jquery.counterup.min.js"></script>
<script src="/assets/js/waypoints.min.js"></script>
<script src="/assets/js/jquery.countdown.min.js"></script>
<script src="/assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="/assets/js/contact.js"></script>
<script src="/assets/js/jquery.form.js"></script>
<script src="/assets/js/jquery.validate.min.js"></script>
<script src="/assets/js/mail-script.js"></script>
<script src="/assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="/assets/js/plugins.js"></script>
<script src="/assets/js/main.js"></script>
</body>

</html>