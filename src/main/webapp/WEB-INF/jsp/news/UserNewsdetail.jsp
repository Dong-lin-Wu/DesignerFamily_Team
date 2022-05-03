<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動內容</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
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

.button {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
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
					<tr>
						<td style="vertical-align: text-top"><h2 style="font-size:40px">${n.newsTitle}</h2></td>
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
				<div class="button">
					<c:if test="${n.newsType=='領取優惠'}">
						<button type="submit" class="btn btn-outline-success"
							style="border-radius: 15px; padding: 15px 25px; background: #888888">
							<i class="fa-solid fa-wallet"></i> 領取優惠券
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../userfooter.jsp"%>
</body>
</html>