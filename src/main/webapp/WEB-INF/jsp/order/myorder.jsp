<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega|我的訂單</title>
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="../userheader.jsp"%>

	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">			
						<thead>
							<tr>
								<th scope="col" style="font-size: 30px; padding-left: 520px">訂單紀錄</th>
							</tr>
						</thead>								
						<c:forEach var="va" items="${detail}">
							<c:forEach var="vb" items="${va.item}">						
							<c:if test="${!empty va.orderDate}">
								<tbody>
									<tr>
										<td>
											<div class="media">
												<div class="d-flex">												
													<a href="/product/${vb.product.commNo}"><img
														src="${vb.product.commImg}" alt="" /></a>
												</div>
												<div class="media-body a">
													<p style="font-size: 20px">下單日期: ${va.orderDate}</p>
													<p style="font-size: 20px">訂單編號: ${va.orderNumber}</p>
													<p style="font-size: 20px">${vb.product.commTitle} X
														${vb.qty}</p>
													<p style="font-size: 20px" id="val">NT:$ ${vb.totalprice}</p>
												</div>
											</div>
										</td>
										<c:if test="${va.orderStatus =='取消待確認'}">
										<td style="font-size: 20px; text-align: right" id="${va.orderNo}" class="t"><p style="font-size: 20px;" id="status">訂單狀態:${va.orderStatus}</p><br />
										</td>
										</c:if>
										<c:if test="${va.orderStatus !='取消待確認' && va.orderStatus !='訂單取消'}">
										<td style="font-size: 20px; text-align: right" id="${va.orderNo}" class="t"><p style="font-size: 20px;" id="status">訂單狀態:${va.orderStatus}</p><br />
											<a class="btn checkout_bnt can" href="#">取消訂單</a>
										</td>	
										</c:if>	
										<c:if test="${va.orderStatus =='訂單取消'}">
										<td style="font-size: 20px; text-align: right" id="${va.orderNo}" class="t"><p style="font-size: 20px;" id="status">訂單狀態:${va.orderStatus}</p><br />
										</td>
										</c:if>						
									</tr>								
								</tbody>
								</c:if>                            
							</c:forEach>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>
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

<script>
if($('#val').text()==""){
	$('.container').empty("");
$('.container').append('<div><p style="font-size:40px;text-align:center;padding-top:140px">目前沒有訂單</p></div><br/><div style="text-align:center"><img src="/assets/order.png" width="15%"></div>')
}

$('.can').on('click',function(){
	var status=$(this).parent().find("p").text();
	var newsta = "訂單狀態:取消待確認"
	var id =  $(this).parent().attr("id")
	console.log(newsta);
	
	swal({
		  title: "提醒?",
		  text: "請確認是否取消訂單?",
		  icon: "warning",
		  buttons: ["取消", "確定"],
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		 $.ajax({
			type:"put",
			url:'/order/myorder/'+id,
			success:function(){
				
			}
		})
			$(this).parent().find("p").text(newsta)
			if($(this).parent().find("p").text()=="訂單狀態:取消待確認"){
			$(this).remove()
		}
		    swal("已提出取消申請", {
		      icon: "success",
		      buttons: false,
		      timer: 1500
		    });
		  } else {
			  swal({				
				  text: "訂單已保留",
				  icon: "warning",
				  button: false,
                  timer: 1500
				})
		  }
		});
})
</script>
 <footer style="padding-top:235px">
           <div class="footer-area">
               <div class="container ">
                   <div class="row justify-content-between">
                       <div class="col-xl-4 col-lg-3 col-md-8 col-sm-8">
                           <div class="single-footer-caption mb-1">
                               <div class="single-footer-caption mb-1">
                                   <!-- logo -->
                                   <div class="footer-logo mb-35">
                                       <a href="index.html"><img src="/assets/img/logo/logo.png" alt="" width="100"></a>
                                   </div>
                                   <div class="footer-tittle">
                                       <div class="footer-pera">
                                           <p >We will give you a MEGA surprise.</p>
                                       </div>
                                   </div>
                                   <!-- social -->
                                   <div class="footer-social">
                                       <p style="color: rgb(255, 255, 255);">追蹤梅嘎 Mega</p>
                                       <a href="#"><i class="fab fa-twitter"></i></a>
                                       <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                       <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle" style="padding-top:20px">
                                   <h4>認識梅嘎 Mega</h4>
                                   <ul>
                                       <li><a href="#">關於我們</a></li>
                                       <li><a href="#">媒體報導</a></li>
                                       <li><a href="#">人才招募</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle" style="padding-top:20px">
                                   <h4>幫助/政策</h4>
                                   <ul>
                                       <li><a href="#">Q&A</a></li>
                                       <li><a href="#">服務政策</a></li>
                                       <li><a href="#">退貨政策</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                       <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
                           <div class="single-footer-caption mb-50">
                               <div class="footer-tittle" style="padding-top:20px">
                                   <h4>販售</h4>
                                   <ul>
                                       <li><a href="#">我想在Mega販售</a></li>
                                       <li><a href="#">設計館Q&A</a></li>
                                   </ul>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </footer>
</body>
</html>