<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動內容</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

td {
	padding: 10px 0px;
}
.navbar navbar-light bg-light {
    background-color: #ECFFFF;
}
</style>
</head>
<body style="background-color: #f8f9fa!important">
	<%@ include file="../userheader.jsp"%>
	
	<div class='container' style="width: auto">
		<nav class="navbar navbar-light bg-light" style="width:40px;float:right">
			<div>
				<a class="navbar-brand" href="/news/newsinfo"><i class="fa-solid fa-house-chimney"></i>活動首頁</a>	
			</div>
		</nav>

		<table>
			<tr>
				<td style="vertical-align: text-top"><h1>
						<fmt:formatDate value="${n.newsDate}" pattern="yyyy-MM-dd" />
					</h1></td>
			</tr>
			<tr>
				<td style="vertical-align: text-top"><h2>${n.newsTitle}</h2></td>
			</tr>
			<tr>
				<td><img style="width: 600px" src="${n.newsPicBase64}"></td>
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
	</div>
	
	<%@ include file="../userfooter.jsp"%>
</body>
</html>