<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega|活動</title>
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.ico">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<style>

.wrapper {
	position: relative;
	width: 1100px;
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
	width: 9900px;
	left: 0px;
	transition: all .5s;
}

ul.slides li {
	width: 1100px;
	height: 350px;
	overflow: hidden;
	/*            left:500px; */
	/*            top:350px; */
	float: left;
}

ul.slides li img {
	width: 100%;
	height: 310px;
	/*            object-fit: fill; */
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
	color: #ABABAB;
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

			<!--  輪播開始  -->
			<div class="container">
			<div class="wrapper">
				<ul class="slides" id="o">
					<c:forEach var="n1" items="${newsinfo}">
						<li id="l"><figure>
							<figcaption style="color: black; text-align: center; object-fit: contain"><p style="font-size:20px">${n1.newsTitle}</p></figcaption>
							<a href="/campaign/newsdetail/${n1.newsId}" class="det"> <img src="${n1.newsPicBase64 }" title="${n1.newsTitle}"></a>
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
			<!-- 輪播結束 -->
			
			<!-- 導覽列 -->
				<div class="row">
                    <div class="col-xl-12">
                        <div class="properties__button text-center">
                           <!--	  Nav Button  -->
                           <nav>                         
                              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                           	  	<a class="nav-item nav-link active" id="ALL" data-toggle="tab" href="#all" role="tab" aria-controls="all" aria-selected="true" style="font-size:20px">所有活動</a>
                              	<a class="nav-item nav-link" id="NEWS" data-toggle="tab" href="#news" role="tab" aria-controls="news" aria-selected="false" style="font-size:20px">熱門活動</a>
                           		<a class="nav-item nav-link" id="COUPON" data-toggle="tab" href="#coupon" role="tab" aria-controls="coupon" aria-selected="false" style="font-size:20px">領取優惠</a>
                           		<a class="nav-item nav-link" id="PERIOD" data-toggle="tab" href="#period" role="tab" aria-controls="period" aria-selected="false" style="font-size:20px">期間限定</a>
                           		<a class="nav-item nav-link" id="EVENT" data-toggle="tab" href="#event" role="tab" aria-controls="event" aria-selected="false" style="font-size:20px">實體活動</a>
                              </div>
                           </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
				
		<!-- 套版 -->		
		<div class="row">
                   <!-- Nav Card -->
                   <div class="tab-content" id="nav-tabContent">
                       <!-- card one -->
                       <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="ALL">
                           <div class="row">
                           <c:forEach var="n2" items="${newsinfo}">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                   <div class="single-new-arrival mb-50 text-center">
                                       <div>
                                       <a href="/campaign/newsdetail/${n2.newsId}"><img src="${n2.newsPicBase64}" alt="${n2.newsTitle}" title="${n2.newsTitle}" width="70%"></a>
                                       </div>
                                       <div class="popular-caption">
                                           <h2><a href="/campaign/newsdetail/${n2.newsId}">${n2.newsTitle}</a></h2>
                                           <span>活動期間:${n2.newsStDate} ~ ${n2.newsExpDate}</span>
                                       </div>
                                   </div>
                               </div> 
                               </c:forEach>                                                                                                                                                   
                           </div>
                       </div>
                                            
                        <div class="tab-pane fade" id="news" role="tabpanel" aria-labelledby="NEWS">
                           <div class="row">
                           <c:forEach var="t1" items="${type1}">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                   <div class="single-new-arrival mb-50 text-center">
                                       <div>
                                       <a href="/campaign/newsdetail/${t1.newsId}"><img src="${t1.newsPicBase64}" alt="${t1.newsTitle}" title="${t1.newsTitle}" width="70%"></a>
                                       </div>
                                       <div class="popular-caption">
                                           <h2><a href="/campaign/newsdetail/${t1.newsId}">${t1.newsTitle}</a></h2>
                                           <span>活動期間:${t1.newsStDate} ~ ${t1.newsExpDate}</span>
                                       </div>
                                   </div>
                               </div> 
                               </c:forEach>                                                                                                                                                   
                           </div>
                       </div>
                       
                         <div class="tab-pane fade" id="coupon" role="tabpanel" aria-labelledby="COUPON">
                           <div class="row">
                           <c:forEach var="t2" items="${type2}">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                   <div class="single-new-arrival mb-50 text-center">
                                       <div>
                                       <a href="/campaign/newsdetail/${t2.newsId}"><img src="${t2.newsPicBase64}" alt="${t2.newsTitle}" title="${t2.newsTitle}" width="70%"></a>
                                       </div>
                                       <div class="popular-caption">
                                           <h2><a href="/campaign/newsdetail/${t2.newsId}">${t2.newsTitle}</a></h2>
                                           <span>活動期間:${t2.newsStDate} ~ ${t2.newsExpDate}</span>
                                       </div>
                                   </div>
                               </div> 
                               </c:forEach>                                                                                                                                                   
                           </div>
                       </div>
                       
                       <div class="tab-pane fade" id="period" role="tabpanel" aria-labelledby="PERIOD">
                           <div class="row">
                           <c:forEach var="t3" items="${type3}">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                   <div class="single-new-arrival mb-50 text-center">
                                       <div>
                                       <a href="/campaign/newsdetail/${t3.newsId}"><img src="${t3.newsPicBase64}" alt="${t3.newsTitle}" title="${t3.newsTitle}" width="70%"></a>
                                       </div>
                                       <div class="popular-caption">
                                           <h2><a href="/campaign/newsdetail/${t3.newsId}">${t3.newsTitle}</a></h2>
                                           <span>活動期間:${t3.newsStDate} ~ ${t3.newsExpDate}</span>
                                       </div>
                                   </div>
                               </div> 
                               </c:forEach>                                                                                                                                                   
                           </div>
                       </div>
                       <div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="EVENT">
                           <div class="row">
                           <c:forEach var="t4" items="${type4}">
                               <div class="col-lg-4 col-md-6 col-sm-6">
                                   <div class="single-new-arrival mb-50 text-center">
                                       <div>
                                       <a href="/campaign/newsdetail/${t4.newsId}"><img src="${t4.newsPicBase64}" alt="${t4.newsTitle}" title="${t4.newsTitle}" width="70%"></a>
                                       </div>
                                       <div class="popular-caption">
                                           <h2><a href="/campaign/newsdetail/${t4.newsId}">${t4.newsTitle}</a></h2>
                                           <span>活動期間:${t4.newsStDate} ~ ${t4.newsExpDate}</span>
                                       </div>
                                   </div>
                               </div> 
                               </c:forEach>                                                                                                                                                   
                           </div>
                       </div> 		
				</div>
			</div>
			</div>
		</section>
	</main>
	<%@ include file="../userfooter.jsp"%>
	
	
	
	<script>
	
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

			let slidemove = 0 - 1100 * slideNum;
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
		auto = setInterval(autoplay, 3000);

		$("ul.slides").on("mouseenter", function() {
			clearInterval(auto);
		})

		$("ul.slides").on("mouseleave", function() {
			auto = setInterval(autoplay, 3000);
		})
		
		//共用搜尋欄
//        $("#select").attr("action", "/news/newsmain/query");
		
	</script>
</body>
</html>