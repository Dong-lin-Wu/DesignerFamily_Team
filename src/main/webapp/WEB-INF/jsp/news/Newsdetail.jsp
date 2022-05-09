<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<td style="vertical-align:text-top;width:150px">編號：</td>
			<td>${n.newsId}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">標題：</td>
			<td>${n.newsTitle}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">副標題：</td>
			<td>${n.newsSubtitle}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">創建時間：</td>
			<td><fmt:formatDate value="${n.newsCrDate}" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">內文：</td>
			<td style="vertical-align:text-top">${n.newsContent}</td>
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">活動照片:</td>
			<td><img style="width: 600px" src="${n.newsPicBase64}">
		</tr>
		<tr>
			<td style="vertical-align:text-top;width:150px">備註：</td>
			<td>${n.newsNote}</td>
		</tr>
		</table>
	</div>

</body>
</html>