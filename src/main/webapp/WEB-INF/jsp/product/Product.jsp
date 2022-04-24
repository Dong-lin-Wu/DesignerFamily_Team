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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>

<title>後台管理-商品</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180"
	href="/vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/vendors/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/vendors/images/favicon-16x16.png">

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/vendors/styles/core.css">
<link rel="stylesheet" type="text/css"
	href="/vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css"
	href="/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="/src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>


<style>
.description {
	max-width: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="main-container">
		<div class="pd-ltr-20">
				<h2>商品清單</h2>
				<br/>
				<div id="searchtb_productinfo" style="padding: 2px 5px;">
					<div class="col-auto" style="padding: 0px">
<!-- 						<form action="searchProduct" method="post" style="display: inline"> -->
<!-- 							<input class="form-control" type="text" name="search" id="search" -->
<!-- 								style="width: 250px; display: inline" /> -->
<!-- 							<button type="submit" class="btn btn-outline-secondary">查詢</button> -->
<!-- 						</form> -->

						<a href="product/productadd" style="float:left"><button
								type="button" class="btn btn-outline-primary" style="margin-bottom:15px">新增</button></a>
					</div>
				</div>

				<table class="table"
					style="margin-top: 20px; vertical-align: middle; text-align: center;">
					<thead class="table-light">
						<tr>
							<th>編號</th>
							<th>標題</th>
							<th>描述</th>
							<th>規格</th>
							<th>類別</th>
							<th>設計師</th>
							<th>價格</th>
							<th>數量</th>
							<th>圖片</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="insert">
							<tr>
								
							</tr>
					</tbody>
				</table>
				<table id="showpage" align="right">
            <tr>
                <td colspan="3" align="right">
                <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                <button id="mypage" onclick="change(${i})" value="${i}">${i}</button>
            </c:forEach>
            </td>
            </tr>
        </table>
			</div>
		</div>

 <script>
    var indexPage = 1;
    $(document).ready(function(){
    	 loadPage(indexPage);
    });
    function loadPage(indexPage){
        $.ajax({
            type:"post",
            url:'/product/querybypage/'+indexPage,
            dataType:"json",
            success:function(data){
                console.log(data);
                $("#insert").empty("");
                $.each(data, function(i,val){
                        $("<tr>").attr("id","tr"+val.commNo).appendTo("#insert");
                        $("<td>").append(val.commNo).appendTo("#tr"+val.commNo);//建立一個tr表頭,把後續的內容都append上去
                        $("<td class='description'>").append(val.commTitle).appendTo("#tr"+val.commNo);
                        $("<td class='description'>").append(val.commDES).appendTo("#tr"+val.commNo);
                        $("<td>").append(val.commSPE).appendTo("#tr"+val.commNo);
                        $("<td>").append(val.category).appendTo("#tr"+val.commNo);
                        $("<td>").append(val.designer).appendTo("#tr"+val.commNo);
                        $("<td>").append(val.commPrice).appendTo("#tr"+val.commNo);
                        $("<td>").append(val.commQuantity).appendTo("#tr"+val.commNo);
                        $("<td width='100px' align='right'>").append('<img src="'+val.commImg+'" width="100%">').appendTo("#tr"+val.commNo);
                        $("<td>").append('<button style="display: inline" class="btn btn-outline-danger del" onclick="del('+val.commNo+')">刪除</button><a href="/product/productrevise/'+val.commNo+'"><button style="display: inline" class="btn btn-outline-success ">修改</button></a>').appendTo("#tr"+val.commNo);
                        });
             $(".del").on("click",function(){
            	 console.log(this)
                 $(this).parent().parent().remove();
             })                            
                },
            error:function(xhr){
                alert("發生錯誤"+xhr.status+" "+xhr.statusText);
            }
        });
    }
    
    function change(page){
	indexPage = page;
	loadPage(indexPage);
}
    
    function del(id){
		$.ajax({
			type:"delete",
			url:'/product/productlist/'+id,
			success:function(data){
				Swal.fire({
					  position: 'center',
					  icon: 'success',
					  title: '刪除成功',
					  showConfirmButton: false,
					  timer: 1500
					})
			loadPage(indexPage);
			}
		})
	}
    
    $(".search").on("click",function(){
    	var keyword = $(".keyword").val();
    	console.log(keyword);
    	console.log(this);
    	 $.ajax({
             type:"get",
             url:'/product/productlist/'+keyword,
             dataType:"json",
             success:function(data){
                 console.log(data);
                 $("#insert").empty("");
                 $(".keyword").val("");
                 $.each(data, function(i,val){
                	 $("<tr>").attr("id","tr"+val.commNo).appendTo("#insert");
                     $("<td>").append(val.commNo).appendTo("#tr"+val.commNo);//建立一個tr表頭,把後續的內容都append上去
                     $("<td class='description'>").append(val.commTitle).appendTo("#tr"+val.commNo);
                     $("<td class='description'>").append(val.commDES).appendTo("#tr"+val.commNo);
                     $("<td>").append(val.commSPE).appendTo("#tr"+val.commNo);
                     $("<td>").append(val.category).appendTo("#tr"+val.commNo);
                     $("<td>").append(val.designer).appendTo("#tr"+val.commNo);
                     $("<td>").append(val.commPrice).appendTo("#tr"+val.commNo);
                     $("<td>").append(val.commQuantity).appendTo("#tr"+val.commNo);
                     $("<td width='100px' align='right'>").append('<img src="'+val.commImg+'" width="100%">').appendTo("#tr"+val.commNo);
                     $("<td>").append('<button style="display: inline" class="btn btn-outline-danger del" onclick="del('+val.commNo+')">刪除</button><a href="/product/productrevise/'+val.commNo+'"><button style="display: inline" class="btn btn-outline-success ">修改</button></a>').appendTo("#tr"+val.commNo);
                         });
              $(".del").on("click",function(){
             	 console.log(this)
                  $(this).parent().parent().remove();
              })                            
                 },
             error:function(xhr){
                 alert("發生錯誤"+xhr.status+" "+xhr.statusText);
             }       
         });
    	
    })
</script>

</body>
</html>