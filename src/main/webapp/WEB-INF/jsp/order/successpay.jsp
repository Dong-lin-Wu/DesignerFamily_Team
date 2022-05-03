<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.ico">
<title>Mega|梅嘎</title>
</head>
<style>

.flex{
	display:flex;
	  align-items:center;
	  justify-content:center;
	}

</style>
<body>
<%@ include file="../userheader.jsp" %>
<div style="margin-top: 80px;">
		<div class="container">
			<div class="row">
				<div class="tab-content" id="nav-tabContent">
					<div class="flex" style="width:1200px">
					<div class="row-cols-1 row-cols-md-3 g-4">
					<div style="width:600px;margin:10px;border-radius:20px;height:600px" class="card">
					<div style=" font-size:36px; text-align:center" class="container">訂單資訊</div>
					<hr>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">訂購人:  ${sessionScope.login.account}</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">訂單編號: ${sessionScope.orderlist.orderNumber }</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">下單時間: ${sessionScope.orderlist.orderDate }</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">訂單金額: NT: $${sessionScope.orderlist.orderPrice }</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">聯絡手機: ${sessionScope.orderlist.orderPhone }</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">寄件地址: ${sessionScope.orderlist.orderAddress }</p>
					<p style=" font-size:20px;padding:1.25rem 1.25rem 0rem 1.25rem">訂單狀態: 已付款</p><br/>				
					<form action="/order/back" method="post">
					<div style="text-align:center;"><input type="submit" class="btn checkout_bnt check" value="回首頁"></div>
                    </form>
					</div>
					</div>
					</div>
				</div>
			</div>
		</div>
</div>

<%@ include file="../userfooter.jsp" %>
</body>
</html>