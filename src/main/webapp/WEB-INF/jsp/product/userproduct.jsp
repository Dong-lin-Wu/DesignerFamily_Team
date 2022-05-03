<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="/product/userAddProduct"><button type="button" class="btn btn-outline-primary flip"
		style="margin-bottom: 25px">新增商品</button></a>
	<div class="addp" style="display: none">
	</div>
	<div id="designer" role="tabpanel" aria-labelledby="DESIGNER">
		<table style="text-align: center" class="example">
			<thead>
				<tr>
					<th>圖片</th>
					<th>標題</th>
					<th>類別</th>
					<th>價格</th>
					<th>庫存</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${pdetail}">
					<tr>
						<td width="100px"><img src="${p.commImg}" width="100%"></td>
						<td>${p.commTitle}</td>
						<td>${p.category}</td>
						<td>${p.commPrice}</td>
						<td>${p.commQuantity}</td>
						<td>
							<button style="display: inline"
								class="btn btn-outline-danger btn-sm del" id="${p.commNo}">刪除</button>
							<a href="/product/productrevise/${p.commNo}"><button
									style="display: inline" class="btn btn-outline-success btn-sm">修改</button></a>
							<a href="/product/detail/${p.commNo }"><button
									style="display: inline"
									class="btn btn-outline-primary btn-sm det" id="${p.commNo}">詳細</button></a>
						</td>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>