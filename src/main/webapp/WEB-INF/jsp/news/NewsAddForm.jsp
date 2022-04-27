<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增活動</title>
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

		<h2 style="margin: 20px 0px; text-align: center"><b>新增活動</b></h2>
					
		<form action="/news" method="get" style="display: inline; float: right">
			<button type="submit" class="btn btn-outline-success" style="margin-bottom:10px;border-radius:15px" ><i class="fa-solid fa-house-chimney"></i> 活動首頁</button>
		</form>
			
		<%-- 最新消息 --%>
		<form action="newsAdd" method="post" >
			<div class="mb-3">
				<label for="type" class="form-label"></label> 
				<input type="text" class="form-control" id="type" value="優惠攻略" readonly name="newsType" style="border-radius:20px"/>
			</div>
			<div class="mb-3">
				<label for="newsTitle" class="form-label"><b>標題</b>&emsp;<span style="color:red"></span></label> <em id="titleError" class="red"></em>
				<input type="text" class="form-control nBlank" id="newsTitle" name="newsTitle" style="border-radius:20px"/>					
			</div>
			<div class="mb-3">
				<label for="newsSubtitle" class="form-label"><b>副標題</b></label> 
				<input type="text" class="form-control" id="newsSubtitle" name="newsSubtitle" style="border-radius:20px"/>
			</div>
			<div class="mb-3">
				<label for="newsContent" class="form-label"><b>活動內容</b>&emsp;<span style="color:red"></span></label><em id="contentError" class="red"></em>
				<textarea class="form-control nBlank" id="newsContent" rows="12" style="resize:none ;border-radius:25px" name="newsContent"></textarea>						
			</div>

	        <div class="mb-3">
           		<label class="form-label" ><b>活動照片</b></label>
           		<input class="form-control uploadImages" style="width:300px;border-radius:20px" type="file" name="PicBase64"/>
           		<input type="hidden" id="news_PicBase64" name="news_PicBase64" value="">
      			 </div>
       		<div class="mb-3" id="previewPicDiv"></div>
			
			<div class="mb-3">
				<label for="newsNote" class="form-label"><b>備註</b></label>
				<textarea class="form-control" id="newsNote" rows="4" style="resize:none;border-radius:25px" name="newsNote"></textarea>						
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
			$("#newsTitle").attr("value","邀請朋友活動");
               	$("#newsSubtitle").attr("value","2022年邀請優惠");                	
               	$("#newsContent").html("● 邀請朋友加入會員 <br>邀請朋友成功加入會員 ，就可獲得 300 M Coins，可以在結帳時折抵消費金額或換取限量獎勵。<br>當你邀請的朋友完成首次購買，或是也邀請新朋友加入會員 ，你可以分別再獲得 300 M Coins。邀請一個朋友，等於最多可以獲得 900 M Coins！<br><br> ◎ 優惠期間：無限期<br>◎ 優惠內容：邀請朋友成功加入，就可獲得 300 M Coins，可用於折抵消費或換取限量獎勵。<br>");
               	$("#newsNote").html("300 M Coins 價值 NT$ 30，可以用來折抵消費跟兌換回饋獎勵。<br> ◎ 優惠期間：即日起-2022/12/31");
                }

		<%--必填欄位提醒--%>
		$(".nBlank").blur(function(event){					
			$("#titleError,#contentError").text("");
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
		
				
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
		  reverseButtons: true,
		  showCancelButton: true
		}).then((result) => {
		  if ($("#newsTitle").val()!="" & $("#newsContent").val()!="" & result.isConfirmed!=false) {
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
			      '標題及活動內容不得空白'
			    )
  			  }
		   }  
		})
	})
								
	</script>
</div>
</body>
</html>