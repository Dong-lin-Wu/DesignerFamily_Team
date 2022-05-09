<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>

<title>Mega|商品上架</title>
</head>
<body>
	<div class='container'>
		<a href="/index"><img src="/assets/logob.png" width="30%"></a>
		<h3 style="margin-top:20px">商品上架</h3>
		<form name="form1" action="/product/userAddProduct" method="POST" enctype="multipart/form-data" >
		
		<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">設計師</label> <input
					type="text" class="form-control" id="designer" name="designer"
					aria-describedby="DESInfo" required="required" value="${login.account}" readonly style="font-size:20px">
			</div>
			
			<div class="mb-3">
				<label for="commTitle" class="form-label" style="font-size:22px">商品標題</label> <input
					type="text" class="form-control" id="commTitle" name="commTitle"
					required="required" style="font-size:20px">
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">商品描述</label>
				<textarea class="form-control" id="commDES" name="commDES"
					aria-describedby="DESInfo" required="required" style="font-size:20px"></textarea>
				<div id="DESInfo" class="form-text">請新增商品描述。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">商品規格</label> <input
					type="text" class="form-control" id="commSPE" name="commSPE"
					aria-describedby="DESInfo" style="font-size:20px">
				<div id="DESInfo" class="form-text">請新增商品規格。</div>
			</div>
			<div class="mb-3">
				<label for="category" class="form-label" style="font-size:22px">商品類別</label> <select
					id="category" name="category" class="form-select"
					aria-label="Default select example" aria-describedby="CategoryInfo" style="font-size:20px">
					<option value="配件飾品">配件飾品</option>
					<option value="文具">文具</option>
					<option value="包包提袋">包包提袋</option>
					<option value="衣著">衣著</option>
					<option value="居家生活">居家生活</option>
					<option value="創意科技">創意科技</option>
					<option value="其他">其他</option>
				</select>
				<div id="CategoryInfo" class="form-text">請選擇商品類別。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">價格</label> <input
					type="text" class="form-control" id="commPrice" name="commPrice"
					aria-describedby="DESInfo" required="required" style="font-size:20px">
				<div id="DESInfo" class="form-text" >請輸入商品價格。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">數量</label> <input
					type="text" class="form-control" id="commQuantity"
					name="commQuantity" aria-describedby="DESInfo" required="required" style="font-size:20px">
				<div id="DESInfo" class="form-text">請輸入商品數量。</div>
			</div>
			
			<div class="mb-3">
				<label for="commDES" class="form-label" style="font-size:22px">圖片</label> <input
					class="form-control uploadImages" style="width:250px" type="file" id="commImg" name="commImg"  aria-describedby="DESInfo" required="required">
						<input type="hidden" id="product_PicBase64" name="product_PicBase64" value="">
			</div>
			<div class="mb-3" id="previewPicDiv"></div>
				<br/>
			<button type="submit" class="btn btn-primary send" name="upload">送出</button>
			<button type="button" class="btn btn-primary" onclick="sendvalue()">一鍵輸入</button>
		</form>
	</div>
	
	<script
	    src="https://code.jquery.com/jquery-3.6.0.js"
	    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    crossorigin="anonymous">
	</script>
	
	<script>
	//一鍵輸入
	function sendvalue(){
			document.form1.commTitle.value = "14k包金 橄欖綠 包鑲小圓鑽 法式耳勾耳環";
			document.form1.commDES.value = "細緻的鑲邊橄欖綠鋯石，搭配弧形的法式耳勾，輕盈且典雅，簡約卻充滿細節。";
			document.form1.commSPE.value = "14k包金 法式耳勾";
			document.form1.commPrice.value = "590";
			document.form1.commQuantity.value = "19";
		}

	
	// 預覽圖片，將取得的files一個個取出丟到convertFile()
	function previewFiles(theImgs) {
		if (theImgs[0].files && theImgs[0].files.length >= 1) {
			$.map(theImgs[0].files, file => {
				convertFile(file)
					.then(data => {
					//console.log(data) // 把編碼後的字串輸出到console
					showPreviewImage(theImgs, data, file.name)
					})
					.catch(err => console.log(err))
					
			})
		}
	}
	
	// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
	function convertFile(file) {
		return new Promise((resolve,reject)=>{
			// 建立FileReader物件
			let reader = new FileReader()
			// 註冊onload事件，取得result則resolve (會是一個Base64字串)
			reader.onload = () => { resolve(reader.result) }
			// 註冊onerror事件，若發生error則reject
			reader.onerror = () => { reject(reader.error) }
			// 讀取檔案
			reader.readAsDataURL(file)
		})
	}
	
	// 在頁面上新增<img>
	function showPreviewImage(theImgs, src, fileName) {
		let image = new Image(250) // 設定寬50px
		image.name = fileName
		image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
		theImgs.closest("div").next().append(image);
		theImgs.next().attr("value",src);
	}
	
	// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
	$(".uploadImages").change(function(){
		$(this).closest("div").next().empty();
		previewFiles($(this)); // this即為<input>元素
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
			  reverseButtons: true
			}).then((result) => {
			  if ($("#commTitle").val()!="" & $("#commDES").val()!=""&$("#commSPE").val()!=""&$("#category").val()!=""&$("#designer").val()!=""&$("#commPrice").val()!=""&$("#commQuantity").val()!=""&$("#commImg").val()!="") {
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
			    swalWithBootstrapButtons.fire(
			      '請完整輸入資料'
			    )
			  }  
			})
	})


	</script>
</body>
</html>