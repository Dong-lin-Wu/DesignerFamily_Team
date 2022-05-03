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

	<section class="cart_area">
		<div class="container con">
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
												<div class="media-body">
													<p style="font-size: 20px">下單日期: ${va.orderDate}</p>
													<p style="font-size: 20px">訂單編號: ${va.orderNumber}</p>
													<p style="font-size: 20px">${vb.product.commTitle} X
														${vb.qty}</p>
													<p style="font-size: 20px" id="va">NT:$ ${vb.totalprice}</p>
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
<script>
if($('#va').text()==""){
	$('.con').empty("");
$('.con').append('<div><p style="font-size:40px;text-align:center">目前沒有訂單</p></div><br/><div style="text-align:center"><img src="/assets/order.png" width="15%"></div>')
}

$('.can').on('click',function(){
	var status=$(this).parent().find("p").text();
	var newsta = "訂單狀態:取消待確認"
	var id =  $(this).parent().attr("id")
	console.log(newsta)
	
	const swalWithBootstrapButtons = Swal.mixin({
		 customClass: {
		   confirmButton: 'btn btn-success',
		   cancelButton: 'btn btn-danger'
		 },
		 buttonsStyling: false
		})
	
	swalWithBootstrapButtons.fire({
		 title: '提醒',
		 text: "請確認是否取消訂單",
	 icon: 'warning',
	 showCancelButton: true,
	 confirmButtonText: '確認',
	 cancelButtonText: '取消',
	 reverseButtons: true
	}).then((result) => {
	 if (result.isConfirmed) {
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
	   swalWithBootstrapButtons.fire(
	     '提醒',
	     '已提出取消申請',
	     'success'
	   )
	 } else if (
	   /* Read more about handling dismissals below */
	   result.dismiss === Swal.DismissReason.cancel
	 ) {
	   swalWithBootstrapButtons.fire(
	     '提醒',
	     '訂單保留',
	     'error'
	   )
	 }
	})
})
</script>
</body>
</html>