<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>梅嘎 | Mega</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/img/logo/logo2.png">

<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
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
<!-- <link rel="stylesheet" href="/roll/css/all.css"> -->
</head>
<body>
	<!-- header Start -->
	<header>
		<div class="header-area">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div
						class="row menu-wrapper align-items-center justify-content-between">
						<div class="header-left d-flex align-items-center">
							<!-- Logo -->
							<div class="logo">
								<a href="/product/commodity"><img
									src="/assets/img/logo/logo.png" alt=""></a>
							</div>
							<!-- Logo-2 -->
							<div class="logo2">
								<a href="/product/commodity"><img
									src="/assets/img/logo/logo2.png" alt=""></a>
							</div>
							<!-- Main-menu -->
							<div class="main-menu  d-none d-lg-block">
								<nav>
									<ul id="navigation">
										<li><a href="/product/commodity" style="font-size: 16px">首頁</a></li>
										<li><a href="/product/commodity" style="font-size: 16px">商品</a>
											<ul class="submenu" style="z-index:1">
												<li><a href="product/catagory">配件飾品</a></li>
												<li><a href="product/catagory">文具</a></li>
												<li><a href="product/catagory">包包提袋</a></li>
												<li><a href="product/catagory">衣著</a></li>
												<li><a href="product/catagory">居家生活</a></li>
												<li><a href="product/catagory">創意科技</a></li>
												<li><a href="product/catagory">其他</a></li>
											</ul></li>
										<li><a href="about.html" style="font-size: 16px">最新活動</a></li>
										<li><a href="about.html" style="font-size: 16px">討論區</a></li>
										<li><a href="/front_raiseindex.controller" style="font-size: 16px">募資</a></li>
										<li><a href="contact.html" style="font-size: 16px">聯絡我們</a></li>
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
									<li><c:choose>
											<c:when test="${not empty sessionScope.login}">
												<div class="main-menu  d-none d-lg-block">
													<nav>
														<ul id="navigation">
															<li><a href="#" style="font-size: 16px">${sessionScope.login.account}</a>
																<ul class="submenu">
																	<li><a href="">會員中心</a></li>
																	<li><a href="">我的訂單</a></li>
																	<li><a href="">優惠券</a></li>
																	<li><a href="">登出</a></li>
																</ul></li>
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
											<a href="/order/mycart"><img
												src="/assets/img/icon/card.svg" alt="" title="購物車"></a>
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


</body>

</html>