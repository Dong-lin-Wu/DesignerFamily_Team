<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增優惠券</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
	
<style>
	.red {
		color: red;
		margin-left: 10px;
	}
	body{
		background-color:#FFFAF4
	}
</style>
</head>
<body>
	<div class='container' style="width: auto">

		<h2 style="margin: 20px 0px; text-align: center"><b>新增優惠券</b></h2>
					
		<form action="/coupon" method="get" style="display: inline; float: right">
			<button type="submit" class="btn btn-outline-success" style="margin-bottom:10px;border-radius:15px" ><i class="fa-solid fa-house-chimney"></i> 優惠券清單</button>
		</form>
			
		
		<form action="couponAdd" method="post" >
			<div class="mb-3">
				<label for="newsId" class="form-label"><b>活動編號</b></label>
				<input type="text" class="form-control nBlank" id="newsId" name="newsId" style="border-radius:20px"/>					
			</div>
			<div class="mb-3">
				<label for="couponName" class="form-label"><b>優惠券名稱</b>&emsp;<span style="color:red"></span></label> <em id="nameError" class="red"></em>
				<input type="text" class="form-control nBlank" id="couponName" name="couponName" style="border-radius:20px"/>					
			</div>
			<div class="mb-3">
				<label for="couponCode" class="form-label"><b>優惠券號碼</b>&emsp;<span style="color:red"></span></label> <em id="codeError" class="red"></em>
				<input type="text" class="form-control nBlank" id="couponCode" name="couponCode" style="border-radius:20px"/>
			</div>
			<div class="mb-3">
				<label for="couponStDate" class="form-label"><b>使用期限</b></label><br>
	            <label for="couponStDate" class="form-label"><b>開始日</b></label><br>
	            <input type="date" id="couponStDate" name="couponStDate" style="border-radius:15px;width:140px">      
	        </div>
			<div class="mb-3">
	            <label for="couponExpDate" class="form-label"><b>到期日</b></label><br>
	            <input type="date" id="couponExpDate" name="couponExpDate" style="border-radius:15px;width:140px">      
	        </div>
	        <div class="mb-3">
	            <label for="couponState" class="form-label"><b>狀態</b></label>
                   <select id="couponState" name="couponState" class="form-select" style="border-radius:20px"
                       aria-label="Default select example" aria-describedby="CategoryInfo">
                       <option value="可使用">可使用</option>
                       <option value="不可使用">不可使用</option>
                   </select>
	        </div>
			<div class="mb-3">
				<label for="couponContent" class="form-label"><b>使用說明</b>&emsp;<span style="color:red"></span></label><em id="contentError" class="red"></em>
				<textarea class="form-control nBlank" id="couponContent" rows="12" style="resize:none ;border-radius:25px" name="couponContent"></textarea>						
			</div>
	        
	        	
       		<div style="text-align:center; width: auto; margin: 20px" >					
			<button type="submit" class="btn btn-outline-primary btn-lg send" name="upload" style="border-radius:15px">送出</button>
			<input type="button" class="btn btn-outline-warning btn-lg" name="button" id="button" value="一鍵輸入" onclick="oneClick()" style="border-radius:15px"/>
			</div>
		</form>
		
				
		<script
   			src="https://code.jquery.com/jquery-3.6.0.js"
   			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   			crossorigin="anonymous">
		</script>
				
		<script>
		<%-- 一鍵輸入 --%>
		function oneClick() {
			$("#newsId").attr("value","106");
          	$("#couponName").attr("value","臺灣綠工藝入選作品結帳金額滿5,000元現抵500元");                	
          	$("#couponCode").attr("value","@Green5000dollar500");
          	$("#couponStDate").attr("value","2022-05-01");
          	$("#couponExpDate").attr("value","2022-05-31");
          	$("#couponContent").html("適用範圍：臺灣綠工藝入選作品(依商品頁顯示為主)");
           }

		<%--必填欄位提醒--%>
		$(".nBlank").blur(function(event){					
			$("#nameError,#codeError,#contentError").text("");
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
						
				
		$(".send").on("click",function(e){
		e.preventDefault();
		const swalWithBootstrapButtons = Swal.mixin({
		 	 customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
		  	},
			  buttonsStyling: false
			})

		swalWithBootstrapButtons.fire({
		  title: '確定新增?',
		  confirmButtonText: '確定',
		  cancelButtonText: '取消',
		  reverseButtons: true,
		  showCancelButton: true
		}).then((result) => {
		  if ($("#couponName").val()!=""& $("#couponCode").val()!=""& $("#couponContent").val()!="" & result.isConfirmed!=false) {
			  Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '新增成功',
				  showConfirmButton: false,
				  timer: 1500
				  })
				 setTimeout(function(){
				  $("form").submit();
					
				},1700)
		  } else {
			if(result.isConfirmed!=false){
				swalWithBootstrapButtons.fire(
			      '請輸入完整資料'
			    )
  			  }
		   }  
		})
	})
								
	</script>
</div>
</body>
</html>