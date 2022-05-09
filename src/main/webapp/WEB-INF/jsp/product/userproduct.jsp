<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user product</title>
<style>
th{
padding:10px 40px;
}
</style>
 <script src="https://code.jquery.com/jquery-3.6.0.js"
                    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

	<a href="/product/userAddProduct"><button type="button" class="btn"
		style="margin-bottom: 25px">商品上架</button></a>
	<div class="addp" style="display: none">
	</div>
	<div id="designer" role="tabpanel" aria-labelledby="DESIGNER">
		<table style="text-align: center;" class="example">
			<thead>
				<tr style="border-bottom:2px #BEBEBE solid;">
					<th style="width:120px;font-size: 20px">圖片</th>
					<th style="font-size: 20px">標題</th>
					<th style="font-size: 20px">類別</th>
					<th style="font-size: 20px">價格</th>
					<th style="font-size: 20px">庫存</th>
					<th style="font-size: 20px">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${pdetail}">
					<tr style="border-bottom:2px #F0F0F0 solid;">
						<td style="padding:10px;font-size: 20p"><img src="${p.commImg}" width="100%"></td>
						<td style="font-size: 20px">${p.commTitle}</td>
						<td style="font-size: 20px">${p.category}</td>
						<td style="font-size: 20px">${p.commPrice}</td>
						<td style="font-size: 20px">${p.commQuantity}</td>
						<td style="font-size: 20px">
							<button style="display: inline"
								class="btn pdel" id="${p.commNo}">刪除</button>
							<a href="/product/productrevise/${p.commNo}"><button
									style="display: inline" class="btn ">修改</button></a>
						</td>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>

	 $('.pdel').on("click",function(){
		 var id= $(this).attr("id")
		 console.log(id)
		 swal({
			  title: "提醒?",
			  text: "請確認是否下架商品?",
			  icon: "warning",
			  buttons: ["取消", "確定"],
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			 $.ajax({
	         		type:"delete",
	         		url:'/product/productlist/'+id,
	         		success:function(){	
	         		}
	         	})
	         	console.log($(this).parent().parent().remove())
	               
			    swal("已成功下架商品", {
			      icon: "success",
			      buttons: false,
			      timer: 1500
			    });
			  }else {
				  swal({				
					  text: "商品保留",
					  icon: "warning",
					  button: false,
	                  timer: 1500
					})
			  }
			  
			});

 		 })
 	
	</script>

</body>
</html>