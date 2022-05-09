<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Mega|商品更新</title>
</head>
<body>
	<div class='container'>
	<a href="/index"><img src="/assets/logob.png" width="30%"></a>
		<h3 style="margin-top: 20px">商品資料修改</h3>
		<form action="/product/revisesuccess" method="POST" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="commNo" class="form-label">商品編號</label> <input
					class="form-control" id="commNo" name="commNo"
					value="${productList.commNo}" readonly>
			</div>
			<div class="mb-3">
				<label for="commTitle" class="form-label">商品標題</label> <input
					type="text" class="form-control" id="commTitle" name="commTitle"
					value="${productList.commTitle}">
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品描述</label>
				<textarea class="form-control" id="commDES" name="commDES">${productList.commDES}</textarea>
				<div id="Info" class="form-text">請新增商品描述。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">商品規格</label> <input
					type="text" class="form-control" id="commSPE" name="commSPE"
					value="${productList.commSPE}">
				<div id="SPEInfo" class="form-text">請新增商品描述。</div>
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
					value="${productList.designer}">
				<div id="DESInfo" class="form-text">請新增設計師/品牌名稱。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">價格</label> <input
					type="text" class="form-control" id="commPrice" name="commPrice"
					value="${productList.commPrice}">
				<div id="DESInfo" class="form-text">請輸入商品價格。</div>
			</div>
			<div class="mb-3">
				<label for="commDES" class="form-label">數量</label> <input
					type="text" class="form-control" id="commQuantity"
					name="commQuantity" value="${productList.commQuantity}">
				<div id="DESInfo" class="form-text">請輸入商品數量。</div>
			</div>
			
			
			<div class="mb-3">
				<label for="commDES" class="form-label">圖片</label> <input
					class="form-control uploadImages" style="width:250px" type="file" id="commImg" name="commImg"  aria-describedby="DESInfo">
					<input type="hidden" id="product_PicBase64" name="product_PicBase64" value="${productList.commImg}">
			</div>
			<div class="mb-3" id="previewPicDiv">
				<img style="width:250px" name="${productList.commImg}" src="${productList.commImg}">
				</div>
				
				<br/>
			<button type="submit" class="btn btn-primary send">送出</button>

		</form>
		
	</div>
	<script
	    src="https://code.jquery.com/jquery-3.6.0.js"
	    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    crossorigin="anonymous">
	</script>
	<script>

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
		let image = new Image(250) // 設定寬250px
		image.name = fileName
		image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
		theImgs.closest("div").next().append(image);
		theImgs.next().attr("value",src);
		theImgs.next().next().attr("value",fileName);
		theImgs.siblings("div").remove(); //移除原本照片名稱
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
			  //buttonsStyling: false
			})

			swalWithBootstrapButtons.fire({
			  title: '確定修改?',
			  confirmButtonText: '確定',
			  cancelButtonText: '取消',
			  reverseButtons: true,
			  showCancelButton: true
			}).then((result) => {
			  if ($("#commTitle").val()!="" & $("#commDES").val()!=""&$("#commSPE").val()!=""&$("#category").val()!=""&$("#designer").val()!=""&$("#commPrice").val()!=""&$("#commQuantity").val()!=""&result.isConfirmed!=false) {
				  Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '修改成功',
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
			  if(result.isConfirmed=false){
				  swalWithBootstrapButtons.fire(
					      '123'
					    )

				  }
			})
	})



	</script>
</body>