<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega|出貨訂單</title>
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">			
						<thead>
							<tr>
								<th scope="col" style="font-size: 30px; padding-left: 520px">出貨訂單</th>
							</tr>
						</thead>								
						<c:forEach var="a" items="${shiporder}">
							<c:forEach var="b" items="${a.item}">						
							<c:if test="${b.product.designer==login.account}">
								<tbody>
									<tr>
										<td>
											<div class="media">
												<div class="d-flex">												
													<a href="/product/${b.product.commNo}"><img
														src="${b.product.commImg}" alt="" /></a>
												</div>
												<div class="media-body">
													<p style="font-size: 20px">下單日期: ${a.orderDate}</p>
													<p style="font-size: 20px">訂單編號: ${a.orderNumber}</p>													
													<p style="font-size: 20px">${b.product.commTitle} X
														${b.qty}</p>													
													<p style="font-size: 20px">購賣人: ${a.orderOwner}</p>
													<p style="font-size: 20px">聯絡方式: ${a.orderPhone}</p>
													<p style="font-size: 20px">寄件地址: ${a.orderAddress}</p>
													<p style="font-size: 20px" id="val">NT:$ ${b.totalprice}</p>
												</div>
											</div>
										</td>
										<c:if test="${a.orderStatus =='取消待確認'}">
										<td style="font-size: 20px; text-align: right" id="${a.orderNo}" class="t"><p style="font-size: 20px;" id="status">訂單狀態:${a.orderStatus}</p><br />
										<a class="btn checkout_bnt dbc" href="#">確認取消</a>
										</td>
										</c:if>
										<c:if test="${a.orderStatus !='取消待確認'}">
										<td style="font-size: 20px; text-align: right" id="${a.orderNo}" class="t"><p style="font-size: 20px;" id="status">訂單狀態:${a.orderStatus}</p><br />										
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
if($('#val').text()==""){
	$('.container').empty("");
$('.container').append('<div><p style="font-size:40px;text-align:center">無待出貨訂單</p></div><br/><div style="text-align:center"><img src="/assets/order.png" width="15%"></div>')
}

$('.dbc').on('click',function(){
	var status=$(this).parent().find("p").text();
	var newsta = "訂單狀態:訂單取消"
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
				url:'/order/checkorder/'+id,
				success:function(){					
				}
		 
			})
			$(this).parent().find("p").text(newsta)
			if($(this).parent().find("p").text()=="訂單狀態:訂單取消"){
				$(this).remove()
			}
	   swalWithBootstrapButtons.fire(
	     '提醒',
	     '已取消訂單',
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