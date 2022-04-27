<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
</head>
<body>
<%@ include file="../userheader.jsp"%>
 <main>
        <!--================Cart Area =================-->
        <section class="cart_area section-padding40">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">													
								<thead>
                                <tr>
                                    <th scope="col" style="font-size:20px">訂單商品</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${carts}">
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                        <a href="/product/${c.product.commNo}"><img src="${c.product.commImg}" alt="" /></a>
                                            </div>
                                            <div class="media-body">
                                                <p style="font-size:16px">${c.product.commTitle} X  ${c.qty}</p>
                                                <p style="font-size:16px">NT:$ ${c.totalprice}</p>
                                                 <input type="hidden" value="${c.totalprice}" id="val">
                                            </div>
                                        </div>
                                    </td> 
                                    <td></td>                                                                                                        
                                </tr>
                                </c:forEach>
                                <tr> 
                                <c:choose>                           
                                  <c:when test="${!empty sessionScope.info}">
                                 <td><p style="font-size:16px" id="name">收件人姓名: ${info.orderReceive }</p>                                                         
                                     <p style="font-size:16px" id="phone"> 收件人手機: ${info.orderPhone }</p>  
                                     <p style="font-size:16px" id="address"> 收件人地址: ${info.orderAddress }</p>
                                     <a class="btn checkout_bnt detail" href="/order/info">修改購買人資訊</a>
                                     </td>                                                         
                                    </c:when>        
                                     <c:otherwise>
                                <td><a class="btn checkout_bnt detail" href="/order/info">填寫購買人資訊</a></td>  
                                </c:otherwise> 
                                </c:choose>                                                
                                    <td style="font-size:20px;text-align:right">                     
                                       結帳總金額: <h4 id="total" style="font-size:22px;text-align:right">NT $:${sum}</h4>
                                    </td>                                                            
                                </tr>                             
                            </tbody>
                            <table>                                                     
                                <div style="float: right;"><a class="btn checkout_bnt pay" href="#">下單</a></div>
                            </table>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        </main>
<%@ include file="../userfooter.jsp"%>  
<script>

$('.detail').on('click',function(e){
	e.preventDefault();
	
	 Swal.fire({
	      html:'<iframe src = /order/info width="500px" height="430px">',
	      width:"550px",
	      showConfirmButton: false,
		})
})


$('.pay').on('click',function(){
	
	var name=$('#name').text().substr(7)
	var phone=$('#phone').text().substr(7)
	var address=$('#address').text().substr(7)
	var total=$('#total').text().substr(5)
	
	if($('#name').text()=="" || $('#phone').text()=="" || $('#address').text()=="" ){
		
		Swal.fire({
            icon: 'error',
            title: '請完整填寫資料',
            showConfirmButton: false,
            timer: 1500
             })	
		
	}else{
		
		$.ajax({
			type:"post",
			url:'/order/pay',
			data:{"name":name,"phone":phone,"address":address,"total":total},
		    success:function(data){
				console.log(data)
				window.location.href='/order/myecpage';
		    }
		})
		
	}
	
})

</script>
</body>
</html>