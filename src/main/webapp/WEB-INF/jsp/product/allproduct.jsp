<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.ico">
<head>
<style>
        .wrapper{
            position: relative;
            width:1000px;
            height:350px;
            overflow: hidden;
            margin:0 auto;   
        }
        
        ul#o{
            margin:0;
            padding: 0;
            position: absolute;
        }
        li#l{
            margin:0;
            padding: 0;
            list-style: none;
        }
        ul.slides{
            width: 9000px;
            left: 0px;
            transition: all .5s;
        }
        ul.slides li{
            width:1000px;
            height:350px;
            overflow: hidden;
            float: left;
        }
        ul.slides li img{
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
        .dot{
            bottom:10px;
            width:100%;
            display: flex;
            justify-content: center;
        }
        .dot li{
            border:1px solid #fff;
            /* border-radius: 50%; */
            margin: 0 5px;
            width:24px;
            height: 10px;
        }
        /* .dot li:hover{
            background: #fff;
        } */
        .slide_btn{
            display: flex;
            justify-content: center;
            align-items: center;
            top:0;
            bottom:0;
            width: 30px;
            color:#fff;
            position: absolute;
            font-size:24px;  
        }
        #prevSlide{            
            left:0;                    
        }
        #nextSlide{            
            right:0;                
        }
        .slide_btn i{
            color:black;                        
            transition: .5s;
        }
        .slide_btn:hover i{
            color:balck;            
        }
 
    </style>
</head>
<body>
<%@ include file="../userheader.jsp"%>
    <main>
        <section class="properties new-arrival fix">
            <div class="container">
            <!-- 輪播開始 
            <div class="wrapper">
        <ul class="slides" id="o">
        <c:forEach var="a" items="${list}">
            <li id="l"><img src="${a.commImg }" title="${a.commTitle}"></li>
            </c:forEach>
        </ul>
        <ul class="dot" id="o">
          <c:forEach var="b" items="${list}">
            <li id="${b.commNo }"></li>
              </c:forEach>
        </ul>
        <div id="prevSlide" class="slide_btn">
            <i class="fa-solid fa-caret-left"></i>
        </div>
        <div  id="nextSlide" class="slide_btn">
            <i class="fa-solid fa-caret-right"></i>
        </div>
    </div>
    輪播結束-->

				<!-- 推薦商品 -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-xl-12"> -->
<!-- 						<div class="properties__button text-center"> -->
<!-- 							Nav Button  -->
<!-- 							<nav> -->
<!-- 								<div class="nav nav-tabs" id="nav-tab" role="tablist"> -->
<!-- 									<a class="nav-item nav-link active" id="REC" data-toggle="tab" -->
<!-- 										href="#rec" role="tab" aria-controls="rec" -->
<!-- 										aria-selected="true">推薦商品</a> -->
<!-- 								</div> -->
<!-- 							</nav> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<!-- Section tittle -->
                <div class="row">
                    <div class="col-xl-12">
                        <div class="properties__button text-center">
                            <!--Nav Button  -->
                            <nav>                         
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                	<a class="nav-item nav-link active" id="REC" data-toggle="tab" href="#rec" role="tab" aria-controls="rec" aria-selected="true">所有商品</a>
                                     <a class="nav-item nav-link" id="nav-Decore1-tab" data-toggle="tab" href="#nav-Decore1" role="tab" aria-controls="nav-Decore1" aria-selected="false">衣著</a>
                                    <a class="nav-item nav-link" id="ACC" data-toggle="tab" href="#acc" role="tab" aria-controls="acc" aria-selected="false">配件飾品</a>
                                    <a class="nav-item nav-link" id="nav-Chair-tab" data-toggle="tab" href="#nav-Chair" role="tab" aria-controls="nav-Chair" aria-selected="false">包包提袋</a>
                                    <a class="nav-item nav-link" id="nav-Bed-tab" data-toggle="tab" href="#nav-Bed" role="tab" aria-controls="nav-Bed" aria-selected="false">居家生活</a>
                                    <a class="nav-item nav-link" id="nav-Lightning-tab" data-toggle="tab" href="#nav-Lightning" role="tab" aria-controls="nav-Lightning" aria-selected="false">創意科技</a>
                                    <a class="nav-item nav-link" id="nav-Decore-tab" data-toggle="tab" href="#nav-Decore" role="tab" aria-controls="nav-Decore" aria-selected="false">文具</a>
                                      <a class="nav-item nav-link" id="nav-Decore-tab" data-toggle="tab" href="#nav-Decore" role="tab" aria-controls="nav-Decore" aria-selected="false">其他</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Nav Card -->
                    <div class="tab-content" id="nav-tabContent">
                        <!-- card one -->
                        <div class="tab-pane fade show active" id="rec" role="tabpanel" aria-labelledby="REC">
                            <div class="row">
                            <c:forEach var="o" items="${list}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${o.commNo}"><img src="${o.commImg }" alt="${o.commTitle}" title="${o.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${o.commNo}">${o.commTitle}</a></h3>
                                            <span>NT$ ${o.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                         <div class="tab-pane fade" id="acc" role="tabpanel" aria-labelledby="ACC">
                            <div class="row">
                            <c:forEach var="a" items="${cate1}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${a.commNo}"><img src="${a.commImg }" alt="${a.commTitle}" title="${a.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${a.commNo}">${a.commTitle}</a></h3>
                                            <span>NT$ ${a.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                          <div class="tab-pane fade" id="nav-Chair" role="tabpanel" aria-labelledby="nav-Chair-tab">
                            <div class="row">
                            <c:forEach var="b" items="${cate2}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${b.commNo}"><img src="${b.commImg }" alt="${b.commTitle}" title="${b.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${b.commNo}">${b.commTitle}</a></h3>
                                            <span>NT$ ${b.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                         <div class="tab-pane fade" id="nav-Bed" role="tabpanel" aria-labelledby="nav-Bed-tab">
                            <div class="row">
                            <c:forEach var="c" items="${cate3}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${c.commNo}"><img src="${c.commImg }" alt="${c.commTitle}" title="${c.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${c.commNo}">${c.commTitle}</a></h3>
                                            <span>NT$ ${c.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                         <div class="tab-pane fade" id="nav-Lightning" role="tabpanel" aria-labelledby="nav-Lightning-tab">
                            <div class="row">
                            <c:forEach var="d" items="${cate4}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${d.commNo}"><img src="${d.commImg }" alt="${d.commTitle}" title="${d.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${d.commNo}">${d.commTitle}</a></h3>
                                            <span>NT$ ${d.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                         <div class="tab-pane fade" id="nav-Decore" role="tabpanel" aria-labelledby="nav-Decore-tab">
                            <div class="row">
                            <c:forEach var="e" items="${cate5}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${e.commNo}"><img src="${e.commImg }" alt="${e.commTitle}" title="${e.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${e.commNo}">${e.commTitle}</a></h3>
                                            <span>NT$ ${e.commPrice}</span>
                                        </div>
                                    </div>
                                </div> 
                                </c:forEach>                                                                                                                                                   
                            </div>
                        </div>
                         <div class="tab-pane fade" id="nav-Decore1" role="tabpanel" aria-labelledby="nav-Decore1-tab">
                            <div class="row">
                            <c:forEach var="f" items="${cate6}">
                                <div class="col-lg-3 col-md-5 col-sm-5">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div>
                                        <a href="commodity/${f.commNo}"><img src="${f.commImg }" alt="${f.commTitle}" title="${f.commTitle}" width="65%"></a>
                                        </div>
                                        <div class="popular-caption">
                                            <h3><a href="commodity/${f.commNo}">${f.commTitle}</a></h3>
                                            <span>NT$ ${f.commPrice}</span>
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
        let slideNum=0;
        let slideCount=$(".slides li").length;
        let lastIndex=slideCount-1;
        console.log(slideCount);
        console.log($(".dot li"));
        $(".dot li").eq(0).css("background-color","white");
        
        function show(){//建立一個function 可以被呼叫使用

            $(".dot li").eq(slideNum).css("background-color","#fff")
             .siblings().css("background-color","transparent");

            let slidemove=0-1000*slideNum;
            $("ul.slides").css("left",slidemove);
        }

        $("#prevSlide").click(function(){
            // slideNum--;
            // if(slideNum<0)
            // slideNum=lastIndex;
            slideNum=--slideNum<0?lastIndex:slideNum; //三元運算子
            show();
        })

        $("#nextSlide").click(function(){
            // slideNum++;
            // if(slideNum>lastIndex)
            // slideNum=0;
            slideNum=++slideNum>lastIndex?0:slideNum;
            show();
        })

        function autoplay(){
            slideNum=++slideNum>lastIndex?0:slideNum;
            show();
        }
        auto=setInterval(autoplay,4000);

        $("ul.slides").on("mouseenter",function(){
            clearInterval(auto);
        })

        $("ul.slides").on("mouseleave",function(){
            auto=setInterval(autoplay,4000);
        })                  
           
    </script>
</body>
</html>