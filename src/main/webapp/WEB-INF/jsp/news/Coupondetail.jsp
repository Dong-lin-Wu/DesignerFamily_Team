<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<body>
	<div class='container' style="width: auto">
		<table style="border-spacing:10px">
		<tr>
			<td style="vertical-align:text-top;width:150px">優惠券編號：</td>
			<td>${c.couponId}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">活動編號：</td>
			<td>${c.newsId}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">優惠券名稱：</td>
			<td>${c.couponName}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">優惠券代碼：</td>
			<td>${c.couponCode}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">使用期間：</td>
			<td>${c.couponStDate} ~ ${c.couponExpDate}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">使用說明：</td>
			<td>${c.couponContent}</td>
		</tr>
		</table>
	</div>

</body>
</html>