<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>梅嘎 | Mega</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<style>
nav {
	text-align: center;
}

.wrapper {
	position: relative;
	width: 1000px;
	height: 350px;
	overflow: hidden;
	margin: 0 auto;
}

ul#o {
	margin: 0;
	padding: 0;
	position: absolute;
}

li#l {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul.slides {
	width: 9000px;
	left: 0px;
	transition: all .5s;
}

ul.slides li {
	width: 1000px;
	height: 350px;
	overflow: hidden;
	/*            left:500px; */
	/*            top:350px; */
	float: left;
}

ul.slides li img {
	width: 100%;
	height: 325px;
	/*            object-fit: fill; */
}

.dot {
	bottom: 10px;
	width: 100%;
	display: flex;
	justify-content: center;
}

.dot li {
	border: 1px solid #fff;
	/* border-radius: 50%; */
	margin: 0 5px;
	width: 24px;
	height: 10px;
}

.dot li:hover {
	background: #fff;
}

.slide_btn {
	display: flex;
	justify-content: center;
	align-items: center;
	top: 0;
	bottom: 0;
	width: 30px;
	color: #fff;
	position: absolute;
	font-size: 24px;
}

#prevSlide {
	left: 0;
}

#nextSlide {
	right: 0;
}

.slide_btn i {
	color: black;
	transition: .5s;
}

.slide_btn:hover i {
	color: balck;
}
</style>
</head>
<body>
	<%@ include file="../userheader.jsp"%>
	<main>
		<section class="properties new-arrival fix">

<!-- 				<div class="container" style="width: 100%"> -->
<!-- 					<nav> -->
<%-- 						<c:forEach var="n" items="${newsinfo}"> --%>
<%-- 							<a href="/news/detail/${n.newsId}" role="button" --%>
<!-- 								style="padding-left: 12px; color: black" class="det"><i -->
<%-- 								class="fa-solid fa-otter"></i> ${n.newsTitle}</a> --%>
<%-- 						</c:forEach> --%>
<!-- 					</nav> -->
<!-- 				</div> -->

			<!--  輪播開始  -->
			<div class="wrapper">
				<ul class="slides" id="o">
					<c:forEach var="n1" items="${newsinfo1}">

						<li id="l"><figure>
								<a href="/news/newsdetail/${n1.newsId}" class="det"> 
								<img src="${n1.newsPicBase64 }" title="${n1.newsTitle}"></a>

								<figcaption
									style="color: black; text-align: center; object-fit: contain">${n1.newsTitle}</figcaption>

							</figure></li>
					</c:forEach>
				</ul>

				<div id="prevSlide" class="slide_btn">
					<i class="fa-solid fa-caret-left"></i>
				</div>
				<div id="nextSlide" class="slide_btn">
					<i class="fa-solid fa-caret-right"></i>
				</div>
			</div>
			<!--	輪播結束 -->


			<!-- 						<div class="container"> -->
			<%-- 							<c:forEach var="n" items="${newsinfo}"> --%>
			<!-- 								<div> -->
			<%-- 									<a href="/news/detail/${n.newsId}" class="det"><img --%>
			<%-- 										src="${n.newsPicBase64}" width="65%" class="d-block w-100"></a> --%>
			<!-- 								</div> -->
			<!-- 								<div style="text-align: center"> -->
			<%-- 									<a href="/news/detail/${n.newsId}" style="color: black" --%>
			<%-- 										class="det">${n.newsTitle}</a> --%>
			<%-- 									<p style="font-size: 14px">${n.newsSubtitle}</p> --%>
			<!-- 								</div> -->
			<%-- 							</c:forEach> --%>
			<!-- 						</div> -->

			<!-- 搜尋欄 -->
			<div>
			<form action="/news/newsinfo/query" method="get" class="d-flex form1" style="width: 300px; margin: 5px 15px; float: right">
				<input class="form-control me-2" type="search" placeholder="搜尋···" aria-label="Search" name="keyword">
				<button class="btn btn-dark" type="submit" style="width:100px ; padding:0px 15px">送出</button>
			</form>
			</div>

			<!-- bootstrap-card -->
			<div class="container" style="margin-top: 80px">
				<div class="row row-cols-1 row-cols-md-2 g-4" style="width: 80%;margin:0px auto">
					<c:forEach var="n" items="${newsinfo2}">
						<div class="col">
							<div class="card" style="width:390px">
								<a href="/news/newsdetail/${n.newsId}" class="det"> <img
									src="${n.newsPicBase64}" class="card-img-top" alt=""></a>
								<div class="card-body">
									<h4 class="card-date"><fmt:formatDate value="${n.newsDate}" pattern="yyyy-MM-dd" /></h4>
									<h5 class="card-title">${n.newsTitle}</h5>
									<p class="card-text">${n.newsSubtitle}</p>
								</div>
							</div><br>
						</div>
					</c:forEach>
				</div>
			</div>

		</section>
	</main>

	<%@ include file="../userfooter.jsp"%>

	<script>
// 		$('.det').on("click", function(e) {

// 			e.preventDefault();
// 			var href = $(this).attr('href');
// 			// 		 var tr= $(this).parent().parent().parent();
// 			// 		 var id= tr.children(":first-child").text();

// 			console.log(href);
// 			Swal.fire({
// 				html : '<iframe src = '+href+' width="750px" height="500px">',
// 				width : "800px"
// 			})
// 		})

		//輪播
		let slideNum = 0;
		let slideCount = $(".slides li").length;
		let lastIndex = slideCount - 1;
		console.log(slideCount);
		console.log($(".dot li"));
		$(".dot li").eq(0).css("background-color", "white");

		function show() {//建立一個function 可以被呼叫使用

			$(".dot li").eq(slideNum).css("background-color", "#fff")
					.siblings().css("background-color", "transparent");

			let slidemove = 0 - 1000 * slideNum;
			$("ul.slides").css("left", slidemove);
		}

		$("#prevSlide").click(function() {
			// slideNum--;
			// if(slideNum<0)
			// slideNum=lastIndex;
			slideNum = --slideNum < 0 ? lastIndex : slideNum; //三元運算子
			show();
		})

		$("#nextSlide").click(function() {
			// slideNum++;
			// if(slideNum>lastIndex)
			// slideNum=0;
			slideNum = ++slideNum > lastIndex ? 0 : slideNum;
			show();
		})

		function autoplay() {
			slideNum = ++slideNum > lastIndex ? 0 : slideNum;
			show();
		}
		auto = setInterval(autoplay, 2000);

		$("ul.slides").on("mouseenter", function() {
			clearInterval(auto);
		})

		$("ul.slides").on("mouseleave", function() {
			auto = setInterval(autoplay, 2000);
		})
	</script>

</body>
</html>