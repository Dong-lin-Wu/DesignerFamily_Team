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

<title>商品新增</title>
</head>
<body>
	<div class='container'>
		<form action="/product" method="post" style="margin-top:1em;" >
			<button type="submit" class="btn btn-light"
				style="margin-bottom: 5px; display: flex; align-items: center;">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
						d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
  <path fill-rule="evenodd"
						d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
</svg>
				&nbsp;&nbsp;商品清單
			</button>
		</form>

		<h3 style="margin-top: 20px">新增商品</h3>
		<form name="form1" action="addProduct" method="POST" enctype="multipart/form-data" >
			<div class="mb-3">
				<label for="commTitle" class="form-label">商品標題</label> <input
					type="text" class="form-control" id="commTitle" name="commTitle"
					required="required">
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品描述</label>
				<textarea class="form-control" id="commDES" name="commDES"
					aria-describedby="DESInfo" required="required"></textarea>
				<div id="DESInfo" class="form-text">請新增商品描述。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品規格</label> <input
					type="text" class="form-control" id="commSPE" name="commSPE"
					aria-describedby="DESInfo">
				<div id="DESInfo" class="form-text">請新增商品規格。</div>
			</div>
			<div class="mb-3">
				<label for="category" class="form-label">商品類別</label> <select
					id="category" name="category" class="form-select"
					aria-label="Default select example" aria-describedby="CategoryInfo">
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
				<label for="commDES" class="form-label">設計師</label> <input
					type="text" class="form-control" id="designer" name="designer"
					aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請新增設計師/品牌名稱。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">價格</label> <input
					type="text" class="form-control" id="commPrice" name="commPrice"
					aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請輸入商品價格。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">數量</label> <input
					type="text" class="form-control" id="commQuantity"
					name="commQuantity" aria-describedby="DESInfo" required="required">
				<div id="DESInfo" class="form-text">請輸入商品數量。</div>
			</div>
			
			<div class="mb-3">
				<label for="commDES" class="form-label">圖片</label> <input
					class="form-control uploadImages" style="width:250px" type="file" id="commImg" name="commImg"  aria-describedby="DESInfo" required="required">
						<input type="hidden" id="product_PicBase64" name="product_PicBase64" value="">
			</div>
			<div class="mb-3" id="previewPicDiv"></div>
				<br/>
			<button type="submit" class="btn btn-primary send" name="upload">送出</button>
			<button type="button" class="btn btn-primary send" onclick="sendvalue()">一鍵輸入</button>
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
			document.form1.designer.value = "Zuzu Jewelry";
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