<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega|活動內容</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.ico">
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

td {
	padding: 10px 0px;
	font-size:25px
}

.navbar navbar-light bg-light {
	background-color: #ECFFFF;
}

</style>
</head>
<body style="background-color: #f8f9fa !important">
	<%@ include file="../userheader.jsp"%>
	<section class="properties new-arrival fix">
		<div class="container">
			<div style="width: 1000px; margin: auto">
<!-- 				<nav class="navbar navbar-light bg-light" -->
<!-- 					style="width: 40px; float: right"> -->
<!-- 					<a class="navbar-brand" href="/campaign_index/newsmain"><i -->
<!-- 						class="fa-solid fa-house-chimney"></i>活動首頁</a> -->
<!-- 				</nav> -->

				<table>		
					<tr>
						<td style="vertical-align: text-top"><h1 style="font-size:40px">
								<fmt:formatDate value="${n.newsCrDate}" pattern="yyyy-MM-dd" />
							</h1></td>
					</tr>
					<c:forEach items="${coupon}" var="a">
					<c:if test="${a.couponbean.couponId==c.couponId}">
					<c:set var="b" value="hava" scope="request" />
					</c:if>					
					</c:forEach>			
					<tr>
					<td style="vertical-align: text-top"><h2 style="font-size:40px" id="title">${n.newsTitle}</h2></td>						
						</tr>		
					<tr>
						<td><img style="width: 600px" src="${n.newsPicBase64}"></td>
					</tr>
					<tr>
						<td style="vertical-align: text-top">活動期間 : ${n.newsStDate} ~ ${n.newsExpDate}</td>
						
					</tr>
					<tr>
						<td style="vertical-align: text-top; margin: 0; padding: 0">${n.newsSubtitle}</td>
					</tr>
					<tr>
						<td style="vertical-align: text-top">${n.newsContent}</td>
					</tr>
					<tr>
						<td style="vertical-align: text-top">${n.newsNote}</td>
					</tr>

				</table>
				<input type="hidden" id="exp" value=${n.newsExpDate}>
				<div style="text-align: center;">
					<c:if test="${n.newsType=='領取優惠'}">								
						<button type="submit" class="btn btn-outline-success" id="hrefButton"
							style="border-radius: 15px; padding: 15px 25px; background: #888888;font-size:20px" id="btn" name="${c.couponId}">
							<a href="/coupon/couponmail/${c.couponId}">
							<i class="fa-solid fa-wallet"></i> 領取優惠券</a>
						</button><br>
						<div style="font-size:20px;padding-top:10px" id="remain">剩餘張數: ${c.couponRemaining}</div>										
					</c:if>	
											
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../userfooter.jsp"%>
	

	<script>
	$(function(){
    var num = Number(0);
	$("#hrefButton").on('click',function(e){
		e.preventDefault();
		num++;
		var Today=new Date();
		let exp=$("#exp").val();
		var Expday=new Date(exp);
		let name=$("").val();
		var id = $(this).attr("name")
		console.log(id)
		var remain = Number($('#remain').text().substr(6))
		var costremain = Number(remain -1)
		console.log(remain)
		console.log(costremain)
		
         if(${login.account == null}){
			
			window.location.href='/login';
		}
			
		if(Expday>Today & ${b!='hava'} & ${login.account != null} & num<=1){
			var costremain = Number(remain -1)
			$('#remain').text("剩餘張數: "+costremain)
			swal({
                icon: 'success',
                text: '優惠券領取成功，請至email或會員中心查看折扣碼',
                button: false,
                timer: 1500
                 })   
                 
          $.ajax({
        	  type:'post',
        	  url:'/coupon/couponmail/'+id,
        	  data:{"remain":costremain},
        	  success:function(data){       		 
        	  }
        	
          })
		
		}else if(num>=2 || ${b =='hava'}){
			
			swal({
                icon: 'warning',
                text: '您已擁有此券',
                button: false,
                timer: 1500
                 })   
			
		}

		if(Expday<Today & ${login.account != null}){

			swal({
                icon: 'warning',
                text: '活動已結束，無法領取',
                button: false,
                timer: 1500
                 }) 
			}
		
	});
	})
	


	</script>
	
</body>
</html>