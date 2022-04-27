<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>購買人資訊</title>
<style type="text/css">
body{
background-color:#F0F0F0;
}

</style>
</head>
<body>
<form action="/order/info2" method="post">
<div style="text-align:center">請填寫收件人與購買人資料</div>
	<div><p style="font-size:16px">收件人姓名:</p>
	<input type="text" placeholder="真實姓名" style="font-size:16px" name="buyername" value="${sessionScope.login.account}" id="name"></div>
	
	<div><p style="font-size:16px">收件人手機:</p>
	<input type="text" style="font-size:16px" name="buyerphone" value="${sessionScope.login.phone}" id="phone"></div>
	
	<div><p style="font-size:16px">收件人地址:</p>
	<input style="resize:none;width:400px;height:100px;font-size:16px" name="buyeraddress" id="address" value="320桃園市中壢區新生路二段421號--聖德基督學院"></div>
	
	<div style="text-align:center;padding-top:15px"><input type="submit" value="填寫完成"  style="width:80px;height:40px;" id="ok"></div>
	
</form>
</body>
<script>
$('#ok').on('click',function(e){
	e.preventDefault();
	console.log($('#address').text())
	if($('#name').val()=="" || $('#phone').val()=="" || $('#address').val()=="" ){
		
		Swal.fire({
            icon: 'error',
            title: '請完整填寫資料',
            showConfirmButton: false,
            timer: 1500
             })

	}else{
		
	$("form").submit();
	}
})
</script>
</html>