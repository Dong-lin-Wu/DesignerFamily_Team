<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega|我的優惠券</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<section class="cart_area">
		<div class="conta">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">			
						<thead>
							<tr>
								<th scope="col" style="font-size: 30px">優惠券紀錄</th>
							</tr>
						</thead>								
						<c:forEach var="va" items="${coupon}">									
								<tbody>
									<tr>
										<td>
											<div class="media">												
												<div class="media-body" >
													<p style="font-size: 20px">${va.couponbean.couponName}</p>
													<p style="font-size: 20px" >優惠碼: ${va.couponbean.couponCode}</p>
													<p style="font-size: 20px">
													可使用期間:${va.couponbean.couponStDate} ~ ${va.couponbean.couponExpDate}</p>
													<p style="font-size: 20px" id="vab">狀態: ${va.state}</p>
												</div>
											</div>
										</td>
																					
									</tr>								
								</tbody>                          
							</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</section>

<script>
 if($('#vab').text()==""){
 	$('.conta').empty("");
 $('.conta').append('<div><p style="font-size:40px;text-align:center">目前沒有優惠券</p></div><br/><div style="text-align:center"><img src="/assets/coupon.png" width="50%"></div>')
 }
</script>
</body>
</html>