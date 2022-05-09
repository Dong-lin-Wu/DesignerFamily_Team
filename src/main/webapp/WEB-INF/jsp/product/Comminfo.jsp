<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<body>
<%@ include file="../userheader.jsp"%>
  <main>
    <!-- slider Area End-->
    <!--? Single Product Area Start-->
    <div class="product_image_area section-padding40">
      <div class="container">
        <div class="row s_product_inner">
          <div class="col-lg-5">
            <div class="product_slider_img">
              <div id="vertical">
                <div>
                  <img src="${comm.commImg}" class="w-100">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
              <h3>${comm.commTitle }</h3>
              <h2>NT$ ${comm.commPrice }</h2>
              <ul class="list">
                  <li>
                     <span style="font-size:20px">現有庫存: ${comm.commQuantity}</span>  
                  </li>
                   <li>
                     <span style="font-size:20px">設計師: ${comm.designer}</span>
                  </li>
                </ul>
                <p style="font-size:20px">
                  ${comm.commDES}
                </p>
                <div class="card_area">
                  <div class="product_count d-inline-block">
                    <span class="inumber-decrement down"> <i class="ti-minus min"></i></span>
                    <input class="input-number" type="text" name="qty" value="1" min="1" max="${comm.commQuantity}" id="value" oninput ="value=value.replace(/[^\d]/g,'')">
                    <span class="number-increment up"> <i class="ti-plus ad"></i></span>
                  </div>
                  <div class="add_to_cart">
                    <a href="/addtocart" class="btn add" id="${comm.commNo}">加入購物車</a>
                  </div>
                  <div class="social_icon">
                    <a href="#" class="fb"><i class="ti-facebook"></i></a>
                    <a href="#" class="tw"><i class="ti-twitter-alt"></i></a>
                    <a href="#" class="li" style="background-color:#FF4500"><i class="fab fa-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
      <h2 style="padding-left:20px">商品推薦</h2>
         <hr> 
         <br>
      <!-- Single Product Area End-->
      <!-- Product Description Area Start-->
      <div class="container">
			  <div class="sliderTwo">
			    	<!--cate1 part1 -->
				    <div>
				      <div class="d-flex text-center">
				        <c:forEach var="o" items="${cate1}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach> 
				         
				         <c:forEach var="o" items="${cate2}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach> 
				         
				         <c:forEach var="o" items="${cate3}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				         
				         <c:forEach var="o" items="${cate4}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				         
				         <c:forEach var="o" items="${cate5}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				         
				         <c:forEach var="o" items="${cate6}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				          <c:forEach var="o" items="${cate7}" end="3">
                          <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>     
				       </div>
			      	</div>
			        <!--cate1 part2 -->
			         <div>
				      <div class="d-flex text-center">
				        <c:forEach var="o" items="${cate1}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				         
				          <c:forEach var="o" items="${cate2}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>
				         
				         <c:forEach var="o" items="${cate3}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>  
				         
				         <c:forEach var="o" items="${cate4}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>  
				         
				         <c:forEach var="o" items="${cate5}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>   
				         
				         <c:forEach var="o" items="${cate6}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach> 
				         
				         <c:forEach var="o" items="${cate7}" begin="4" end="7">
                             <c:if test="${o.category==comm.category}">
				          <div class="col-sm">
				          <a href="/product/${o.commNo}">
				            <img src="${o.commImg}" style="display:block; margin:auto; width:80%"></a>
				            <br>
				            <h3>${o.commTitle}</h3>
				            <h3 style="color: #670000">NT$ ${o.commPrice}</h3>
				          </div>
				          </c:if>
				         </c:forEach>                       
				       </div>
			      	</div>
			  </div>
            </div>
  
</main>  
            <%@ include file="../userfooter.jsp"%>   
            <script>
            $(document).ready(function(){
            	  $(".sliderTwo").slick({
            	    rows: 1,
            	    infinite: true,
            	    slidesToShow: 1,
            	    slidesToScroll: 1,
            	    dots: true, 
            	  });
            	  });  
            
            $('#value').change(function(){
            	var count=Number($('#value').attr('max'));
            	var val = Number($('#value').val())
            	console.log(val)
            	console.log(count);
            	if(val>count){
            		$('#value').val(count)
            	}
            	if(val<=0 || isNaN(val)){
            		$('#value').val(1)
            	}
            })
            
                   
            	
            	$(function(){
            	var num=Number(0);
            	var cart = Number($('#cartval').text());
            	console.log(cart)
            	var id=$(this).attr("id");            	
            	var a = Number($("#qty").text());
            	var b = Number(1);
            	a+=b
            	var max=Number($('#value').attr('max'));
            	$("#qty").text(a)
            	$('.add').click(function(e){
            		e.preventDefault();
            		num++
            		console.log(num)
            		if(num<=1 & ${login.account != comm.designer}){
            			$('#cartval').text(cart+1);
            		}
            		
            		if(${login.account == comm.designer}){
            			swal({
                            icon: 'warning',
                            text: '不能購買自己的商品',
                            button: false,
                            timer: 1500
                             })   
            		}else{
            			
            			swal({
            				  text: "商品已加入購物車",
            				  icon: "success",
            				  button: false,
            				  timer: 1500
            				});
            			
            			$.ajax({
                    		type:'post',
                    		url:'/order/mycart',
                    		dataType:"json",
              	            data:{"qty":$("#value").val(), "id":$(this).attr("id"), "val":$("#qty").text(),"count":$('#cartval').text(),    	   
              	            },
              	            success:function(data){
   	            		 	
              	            }
                    	})
            			
            		}
    		
            	})
            	})


            $('.min').on('click',function(){
            
            	var a =$('#value').val();
            	var b = Number(1)
            	console.log(a)
            	if(a>=2){
            	 $('#value').val(a-=b)
            	}else{
            		$('#value').val(1)
            	}
            	
            })
            
            $('.ad').on('click',function(){
            	var a =Number($('#value').val());            
            	console.log(a)
            	var b = 1
            	b=b+a
            	var max=Number($('#value').attr("max"));
            	if(a<max){
            	$('#value').val(b);  		
            	}else{
            		$('#value').val(max); 
            	}
            	if(a==max){
            		swal({
                        icon: 'error',
                        text: '已達購買最大數量',
                        button: false,
                        timer: 1500
                         })
            	}
            })
            
 </script>
</body>
</html>