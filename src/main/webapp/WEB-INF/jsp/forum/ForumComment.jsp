<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Comment</title>

 <!-- 從這裡(第一段) -->
        <!-- Site favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="/vendors/images/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/vendors/images/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/vendors/images/favicon-16x16.png">

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet">

        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="/vendors/styles/core.css">
        <link rel="stylesheet" type="text/css" href="/vendors/styles/icon-font.min.css">
        <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'UA-119386393-1');
        </script>
<!-- 到這裡(第一段結束) -->
</head>
<style>
</style>
<body>
<%@ include file="../header.jsp"%>
<div class="main-container">
	<div class="pd-ltr-20">
		<h2 style="">評論區</h2>
		<hr />
		  
		 <form name="forumhomepage" action="forum_backend.controller" method="get">
	         <input type="hidden" name="nextto" value="forum">         
	         <input type="submit" class="btn btn-outline-secondary" value="回上一頁">
	      </form>	      	     	  
	    <table class="table table-striped" style="margin-top:20px">
		<thead>
		    <tr>
		    	<th>編號</th>
		   		<th>內容</th>    	
		    	<th>建立時間</th>
		    	<th>更新時間</th>
		    	<th>帳號</th>
		    	<th>討論編號</th>    	
		    	<th>功能</th>	    	   	
		    </tr>
		</thead>
	      <tbody>
	      <% int count=0 ;%>	
			<c:forEach var="cl" items="${fBean.commentBean}">   <!-- ${fBean.commentBean}是一個set -->  
	      		<tr>
					<td>${cl.getCommentId()}</td>					
					<td style="width:800px">${cl.getCommentDescription()}</td>
					<td>${cl.getCommentCreatetime().substring(0, 16)}</td>
					<td>${cl.getCommentUpdatetime().substring(0, 16)}</td>					
					<td>${cl.getCommentAccount()}</td>
					<td>${cl.forumBean.forumid}</td>				
					<td >						
					<!-- Button trigger modal -->
					  
						<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${cl.getCommentId()}">刪除</button>
					<!--	
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#commentDetails${cl.getCommentId()}">詳細</button>
					-->
				
					<!-- Modal -->
						<form style="display:inline" action="forum_backend_delete_comment.controller" method="post">
							<input type="hidden" name="nextto" value="ForumDelete">
							<input type="hidden" name="commentId" value="${cl.commentId}">
							<div class="modal fade" id="exampleModal${cl.getCommentId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel"></h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        請確認是否刪除此筆資料。
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
							        <button type="submit" class="btn btn-primary">確認</button>
							      </div>
							    </div>
							  </div>
							</div>
						</form>
						<!-- Modal -->
						  
						<div class="modal fade" id="commentDetails${cl.getCommentId()}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  					<div class="modal-dialog modal-dialog-scrollable" style="max-width: 500px">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel3">內容</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      
					       <!--
					        <label>${dl.getForumDescription()}</label></br>
					        -->						         					        
					        <textarea class="form-control" id="exampleFormControlTextarea" style="height: 700px">${cl.getCommentDescription()}</textarea>					        					       		        
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>				        
					      </div>
					    </div>
					  </div>
					</div>
					
					
				</td>
				</tr>		
			<%count++; %>
		</c:forEach>
			</tbody>
			</table>
	</div>     
 </div>
 
  <!-- 從這裡(第二段) -->
        <!-- js -->
        <script src="/vendors/scripts/core.js"></script>
        <script src="/vendors/scripts/script.min.js"></script>
        <script src="/vendors/scripts/process.js"></script>
        <script src="/vendors/scripts/layout-settings.js"></script>
        <script src="/src/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
        <script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
        <script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
        <script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
        <script src="/vendors/scripts/dashboard.js"></script>
        <!-- 到這裡(第二段結束) -->
      
<script>
	$("#select").attr("action","forum_backend_gotosearch.controller");
	$("input[name='keyword']").attr("placeholder","請輸入主題");

</script>
</body>
</html>