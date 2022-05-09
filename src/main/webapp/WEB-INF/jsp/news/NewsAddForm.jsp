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
	<div class='container' style="width: 800px">

		<h2 style="margin: 20px 0px; text-align: center"><b>新增活動</b></h2>
				
		<form action="/news" method="get" style="display: inline; float: right">
			<button type="submit" class="btn btn-primary" style="margin-bottom:10px;border-radius:15px" ><i class="fa-solid fa-house-chimney"></i> 活動清單</button>
		</form>
			
		<%-- 最新消息 --%>
		<form action="newsAdd" method="post" >
			<div class="mb-3">
				<label for="type" class="form-label"><b>活動類別</b></label> 							
				<select id="newsType" name="newsType" class="form-select event" style="border-radius:20px"
                       aria-label="Default select example" aria-describedby="CategoryInfo">
                       <option value="熱門活動">熱門活動</option>
                       <option value="領取優惠" selected>領取優惠</option>
                       <option value="期間限定">期間限定</option>
                </select>
				<div id="CategoryInfo" class="form-text">請選擇活動類別。</div>
			</div>
			<div class="mb-3">
				<label for="newsTitle" class="form-label"><b>活動名稱</b>&emsp;<span style="color:red"></span></label> <em id="titleError" class="red"></em>
				<input type="text" class="form-control nBlank" id="newsTitle" name="newsTitle" style="border-radius:20px" required="required"/>				
			</div>
			<div class="mb-3">
				<label for="newsSubtitle" class="form-label"><b>副標題</b></label> 
				<input type="text" class="form-control" id="newsSubtitle" name="newsSubtitle" style="border-radius:20px"/>
			</div>
			<div class="mb-3">
	            <label for="newsStDate" class="form-label"><b>活動開始日</b></label><br>
	            <input type="date" id="newsStDate" name="newsStDate" style="border-radius:15px;width:140px;text-align:center">      
	        </div>
			<div class="mb-3">
	            <label for="newsExpDate" class="form-label"><b>活動結束日</b></label><br>
	            <input type="date" id="newsExpDate" name="newsExpDate" style="border-radius:15px;width:140px;text-align:center">      
	        </div>
	        
	        <div id="event" class="mb-3"></div>
	        
			<div class="mb-3">
				<label for="newsContent" class="form-label"><b>活動內容</b>&emsp;<span style="color:red"></span></label><em id="contentError" class="red"></em>
				<textarea class="form-control nBlank" id="newsContent" rows="12" style="resize:none ;border-radius:25px" name="newsContent" required="required"></textarea>						
			</div>
	        <div class="mb-3">
           		<label class="form-label" ><b>活動照片</b></label>
           		<input class="form-control uploadImages" style="border-radius:20px" type="file" name="PicBase64"/>
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
				$("#newsTitle").attr("value","限定工藝Way 精選台灣綠工藝作品");
               	$("#newsSubtitle").attr("value","購買臺灣綠工藝入選作品，滿 NT$5000，折抵 NT$500"); 
               	$("#newsStDate").attr("value","2022-05-09");
               	$("#newsExpDate").attr("value","2022-05-31");               	
               	$("#newsContent").html("● 精選臺灣綠工藝入選作品！專屬你的生活工藝<br><br>生活在水泥叢林，你還記得與自然之間的連結嗎？<br>沒時間出走山林沒關係，<br>先讓源於大地的工藝走入日常，<br>陪伴並療癒每日工作、生活的點滴！<br><br>少了機械的筆直與工整，<br>卻多了職人手作的線條與變化，紮實地溫暖每一刻。<br>一起探索隱身台灣各地的美麗綠工藝，<br>打造個人專屬的生活味吧！");
               	$("#newsNote").html("綠工藝入選作品只在 MEGA 限定販售！");
                }

		<%-- 跳出活動欄位 --%> 
// 		$("#newsType").change(function(addtable){
// 			console.log($(this).val())
// 			$("#event").html("");
// 			if($(this).val()=="實體活動"){
// 				$("#event").append(
// 			       	'<label for="place" class="form-label"><b>活動地點</b></label>' +
// 					'<input type="text" class="form-control" id="place" name="place" style="border-radius:20px" required="required"/>'+
// 					'<label for="maxEnterNum" class="form-label"><b>已報名人數</b></label>' +
// 					'<input type="text" class="form-control" id="maxEnterNum" name="maxEnterNum" style="border-radius:20px" required="required"/>'+
// 					'<label for="enterNum" class="form-label"><b>可報名人數</b></label>' +
// 					'<input type="text" class="form-control" id="enterNum" name="enterNum" style="border-radius:20px" required="required"/>'
					
// 				)	
// 			}else{
// 				$("#event").html("");
// 			}
// 		})
		
		
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
		  if ($("#newsTitle").val()!="" & $("#newsContent").val()!=""& $("#newsStDate").val()!="" & $("#newsExpDate").val()!="" & result.isConfirmed!=false) {
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
			      '標題、活動時間、內容不得空白'
			    )
  			  }
		   }  
		})
	})
								
	</script>
</div>
</body>
</html>