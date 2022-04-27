<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<head>
    <title>購物車</title>
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
								 <c:if test="${!empty sessionScope.carts}">
								<thead>
                                <tr>
                                    <th scope="col" class="text-justify" style="font-size:20px">訂單商品</th>
                                    <th scope="col" class="text-justify" style="font-size:20px">單價</th>
                                    <th scope="col" class="text-justify" style="font-size:20px">數量</th>
                                    <th scope="col" class="text-justify" style="font-size:20px">小計</th>
                                    <th scope="col" class="text-justify"></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="c" items="${carts}">
                                <tr>
                                    <td>
                                        <div class="media">
                                            <div class="d-flex">
                                               <a  href="/product/${c.product.commNo}"> <img src="${c.product.commImg}" alt="" /></a>
                                            </div>
                                            <div class="media-body">
                                                <p style="font-size:16px">${c.product.commTitle}</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                       <h5 style="font-size:16px">${c.product.commPrice}</h5>
                                    </td>
                                    <td>
                                        <div class="product_count">
                                            <span class="input-number-decrement"> <i class="ti-minus min"></i></span>
                                            <input class="input-number qty" type="text"  id="${c.product.commNo}" value="${c.qty}" min="1" max="${c.product.commQuantity}" size="1" readonly>
                                         <span class="input-number-increment"> <i class="ti-plus add"></i></span>
                                        </div>                                                                     
                                    </td>
                                    <td>
                                        <h3 style="font-size:16px">${c.totalprice}</h3>
                                    </td>
                                    <td><button  class="btn btn-sm del" id="${c.product.commNo}">刪除</button></td>
                                </tr>
                                </c:forEach>
                                <tr class="bottom_button">
                                    <td>
                                        <p style="font-size: 20px;">折扣碼: <input type="text" size="8" id="discount"></p>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <h2>商品總價:</h2>                       
                                        <h2 id="total"></h2>
                                    </td>
                                </tr>                             
                            </tbody>
                            <form action="/order/checkout" method="post">
                            <table>
                            <input type="hidden" value="" id="sum" name="sum">
                                <div style="float: right;"><input type="submit" class="btn checkout_bnt check" value="結帳"></div>
                            </table>
                            </form>
                         </c:if>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        </main>
<%@ include file="../userfooter.jsp"%>
<script>
	
  function total(){
	var count=0;
$("h3").each(function(i,v){
	count += Number(($(v).text()));
});
if($('#discount').val()=="test1234"){
	
	var discountval=Math.round(count*0.9);
	$('#total').text("NT $:"+discountval)
	$('#sum').val(discountval)
}else{
	$('#total').text("NT $:"+count);
	$('#sum').val(count)
}
	if(count==0){
		$('.table-responsive').empty("");
		$('.table-responsive').append('<img src="/assets/cart.png" style="display:block; margin:auto;" width="30%"><p align="center" style="font-size:30px">你的購物車中沒有商品</p><div style="text-align:center"><a class="btn checkout_bnt" href="/index">去購物</a></div>');
		}
}
  
total();
	
	
$('.min').on('click',function(e){

	var id=$(this).parent().next().prop("id")
	console.log(id)
	var a =$(this).parent().next().val();
	var b=Number(1)
	var c=Number($(this).parent().parent().parent().parent().children('td').eq(3).text())
	var aa=Number($(this).parent().parent().parent().parent().children('td').eq(1).text())
	console.log(aa)
	if(a>=2){
		$(this).parent().next().val(a-=b);
		var d=$(this).parent().next().val();
		$(this).parent().parent().parent().parent().children('td').eq(3).children('h3').text(aa*d)
		
		$.ajax({
			type:"put",
			url:'/order/mycart/'+id,
			data:{"qty":d},
			success:function(data){		
				console.log("success")
			}
		})
	}else{
		$(this).parent().next().val(b);
		var e=$(this).parent().next().val();
		$(this).parent().parent().parent().parent().children('td').eq(3).children('h3').text(aa*e)
		$.ajax({
			type:"put",
			url:'/order/mycart/'+id,
			data:{"qty":e},
			success:function(data){		
				console.log("success")
			}
		})
	}
	total();
})

$('.add').on('click',function(e){
	e.preventDefault();
	var id=$(this).parent().prev().prop("id")
	console.log(id)
	var a =Number($(this).parent().prev().val());
	var b =Number($(this).parent().prev().attr("max"));
	var c =$(this).parent().prev().attr("value");
	var d = 1;
	var aa=Number($(this).parent().parent().parent().parent().children('td').eq(1).text())
	var bb=Number($(this).parent().parent().parent().parent().children('td').eq(3).text())
	console.log(bb)
	d=d+a
	if(a<b){
		$(this).parent().prev().val(d);
		var f =$(this).parent().prev().val();
		console.log(f)
		$(this).parent().parent().parent().parent().children('td').eq(3).children('h3').text(aa*f)
		$.ajax({
			type:"put",
			url:'/order/mycart/'+id,
			data:{"qty":f},
			success:function(data){		
				console.log("success")
			}
		})
	}else{
		$(this).parent().prev().val(b);
		var h=$(this).parent().prev().val()
		$(this).parent().parent().parent().parent().children('td').eq(3).children('h3').text(aa*h)
		$.ajax({
			type:"put",
			url:'/order/mycart/'+id,
			data:{"qty":h},
			success:function(data){		
				console.log("success")
			}
		})
	}
	if(a==b){
		Swal.fire({
            icon: 'error',
            title: '已達購買最大數量',
            showConfirmButton: false,
            timer: 1500
             })
	}
	
	total();
	
})

$('.del').on('click',function(){
	var id = $(this).attr("id")
	 $.ajax({
			type:"delete",
			url:'/order/mycart/'+id,
			success:function(){		
			}
		})
	$(this).parent().parent().remove();
	total();
})

$('#discount').change(function(){
	console.log($(this).val())
	var price=Number($('#total').text().substr(5));
	console.log(price)
	var discount=$(this).val();
	var code="test1234";
	if(discount==code){
		var discountval=Math.round(price*0.9);
		$('#total').text("NT $:"+discountval)
		$('#sum').val(discountval)
	}else{
		total();
	}
})


</script>
</body>

</html>