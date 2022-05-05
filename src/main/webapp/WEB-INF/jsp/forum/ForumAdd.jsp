<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	    src="https://code.jquery.com/jquery-3.6.0.js"
	    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	    crossorigin="anonymous">
	</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>forum</title>
<style>
span {
            font-size: 13px;
            
            font-style: italic;
        }
.container{
			width:800px;
			}
</style>
</head>
<body>
<div class='container'>
<h2 style="margin-top:20px"></h2>
	
	 <form name="homepage" action="forum_backend.controller" method="get">
         <input type="hidden" name="nextto" value="forum">         
         <input type="submit" class="btn btn-info" value="回討論區首頁">
      </form>
      
      <hr />
	<h3 style="margin-top:20px">新增討論</h3>
	
		<form id="form_forum" action="forum_backend_insert.controller" method="POST">
				
				<div class="mb-3">
					  <label for="Dis_Category" class="form-label">類別</label>
					  <select id="Dis_Category" name="Dis_Category" class="form-select" aria-label="Default select example" aria-describedby="CategoryInfo" >
						  <option value="音樂">音樂</option>
						  <option value="攝影">攝影</option>
						  <option value="時尚">時尚</option>
						  <option value="設計">設計</option>	
						  <option value="遊戲">遊戲</option>
						  <option value="飲食">飲食</option>
						  <option value="教育">教育</option>
						  <option value="科技">科技</option>
						  <option value="藝術">藝術</option>
					  </select>
					  <div id="CategoryInfo" class="form-text">請選擇類別。</div>
				  </div>
				
				  <div class="mb-3">
				      <label for="Dis_Title" class="form-label">主題</label>
				      <input type="text" class="form-control" id="Dis_Title" name="Dis_Title" required="required" maxlength="50">
				      
            			
				  </div>
				  
				  <div class="mb-3">
				      <label for="Dis_Descri" class="form-label">內容</label>
<!-- 				      <textarea class="form-control" id="Dis_Descri" name="Dis_Descri"rows="10" required></textarea> -->
                        <input type="hidden" name="Dis_Descri"  id="Dis_Descri">
				      <div id="summernote" ></div>
				      
				      
				  </div>
				  
				  <button type="button" class="btn btn-primary" onclick="forum_submit()">提交</button>
			  
<!-- 				  <input type="hidden" name="nextto" value="Forumadd"> -->
<!-- 				  <button type="submit" class="btn btn-primary">提交</button>				   -->
				  
				</form>
			</div> 
<!-- <script src="/js/DiscussAddjs.js"></script> -->
 <script>
      $('#summernote').summernote({
		       placeholder: '',
		       tabsize: 2,
		       height: 380,
		       toolbar: [
			         ['style', ['style']],
			         ['font', ['bold', 'underline', 'clear']],
			         ['color', ['color']],
			         ['para', ['ul', 'ol', 'paragraph']],
			         ['table', ['table']],
			         ['insert', ['link', 'picture', 'video']],
			         ['view', ['fullscreen', 'codeview', 'help']]
			       ]
		      	});
         
   function forum_submit(){	   
	    var theDescri = $('.note-editable').html();
	    $('#Dis_Descri').val(theDescri);
	    var boolean_checkrequired = $('#form_forum')[0].reportValidity();
// 	    console.log(theDescri);
	    if(boolean_checkrequired && theDescri != "<br>"){
	    	$('#form_forum').submit();
// 			console.log("sumbit OK");
		}
  	  	
	   }       
  	  	 
    </script>
</body>
</html>