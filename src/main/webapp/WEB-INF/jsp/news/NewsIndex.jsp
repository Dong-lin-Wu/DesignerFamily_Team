<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>後台管理-活動</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                crossorigin="anonymous">
                </script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
            

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
            <style>

            </style>
        </head>

        <body>
            <%@ include file="../header.jsp" %>
                <div class="main-container">
                    <div class="pd-ltr-20 xs-pd-20-10">
                        <div class="min-height-200px">
                            <div class="page-header">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="title">
                                            <h4>活動</h4>
                                        </div>
                                        <nav aria-label="breadcrumb" role="navigation">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item">
                                                    <a href="/admin">首頁</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">活動</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                        <a class="btn btn-primary" href="/news/newsadd" role="button">新增</a>
                                    </div>                                               
                                </div>
                            </div>

                            <!-- Simple Datatable start -->
                            <div class="card-box mb-30">
                                <div class="pd-20">
                                    <h4 class="text-blue h4">活動清單</h4>
                                       <div class="col-auto" style="padding: 0px">
						<a href="/coupon" style="float:right">
						<button type="button" class="btn btn-outline-secondary" style="margin-bottom:15px">
						<i class="fa-solid fa-money-check-dollar"></i> 優惠券清單</button></a>
					</div>                   
                                </div>
                                <div class="pb-20">
                                    <table class="table hover stripe data-table-export nowrap">
                                        <thead>
                                            <tr>
                                                <th class="table-plus datatable-nosort">編號</th>
                                                <th>活動類型</th>
						                        <th>活動標題</th>
						                        <th>創建時間</th>
						                        <th>活動照片</th> 
                                                <th class="datatable-nosort">功能</th>
                                            </tr>
                                        </thead>
                                        <tbody id="insert">
                                            <c:forEach var="n1" items="${list}">
                                                <tr>
                                               <td>${n1.newsId}</td>
							                   <td>${n1.newsType}</td>
							                   <td>${n1.newsTitle}</td>
							                   <td><fmt:formatDate value="${n1.newsCrDate}" pattern="yyyy-MM-dd  HH:mm:ss" /></td>
							                   <td><img style="width:100px" src="${n1.getNewsPicBase64()}"></td>
										             <td>
                                                        <div class="dropdown">
                                                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                                                href="#" role="button" data-toggle="dropdown">
                                                                <i class="dw dw-more"></i>
                                                            </a>
                                                            <div
                                                                class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                                <a class="" href="/news/detail/${n1.newsId}">
                                                                 <button type="button" class="dropdown-item  det"
                                                                        id="${n1.newsId}">
                                                                <i class="dw dw-eye"></i>詳細</button></a>
                                                                <a class="" href="/news/newsupdate/${n1.newsId}">
                                                                    <button type="button" class="dropdown-item  upd"
                                                                        id="${n1.newsId}"><i class="dw dw-edit2"></i>
                                                                        修改</button></a>
                                                                    <button type="button" class="dropdown-item  del"
                                                                        id="${n1.newsId}"><i class="dw dw-delete-3"></i>
                                                                        刪除</button>                          
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Simple Datatable End -->
                        </div>
                    </div>
                </div>
                <script src="https://code.jquery.com/jquery-3.6.0.js"
                    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
                    </script>
                <!-- js -->
                <script src="/vendors/scripts/core.js"></script>
                <script src="/vendors/scripts/script.min.js"></script>
                <script src="/vendors/scripts/process.js"></script>
                <script src="/vendors/scripts/layout-settings.js"></script>
                <script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                <script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                <script src="/vendors/scripts/dashboard.js"></script>
                <!-- buttons for Export datatable -->
                <script src="/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.print.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.html5.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.flash.min.js"></script>
                <script src="/src/plugins/datatables/js/pdfmake.min.js"></script>
                <script src="/src/plugins/datatables/js/vfs_fonts.js"></script>              
                <!-- add sweet alert js & css in footer -->
                <script src="/src/plugins/sweetalert2/sweetalert2.all.js"></script>
                <script src="/src/plugins/sweetalert2/sweet-alert.init.js"></script>

                <script>
                    $("#select").attr("action", "/admin/search.members");
                </script>
                
                <script>
 $(document).ready(function() {
	 
	 $('.del').on("click",function(){
		 var id= $(this).attr("id")
		 console.log(id)
		
	 swal({
             title: '確定刪除?',
             text: "資料刪除後將無法復原!",
             type: 'warning',
             showCancelButton: true,
             confirmButtonClass: 'btn btn-success',
             cancelButtonClass: 'btn btn-danger',
             confirmButtonText: '確定',
             cancelButtonText: '取消'
         }).then((result) => {
             if (result.dismiss !== 'cancel') {
                 
            	  $.ajax({
      				type:"delete",
      				url:'/news/newslist/'+id,
      				success:function(){		
      				}
      		})	
         		 var tr=$(this).parent().parent().parent().parent();
                $('.data-table-export').DataTable().row(tr).remove().draw(false)
                
                 swal({
                     title: '已刪除!',
                     type: 'success',
                     confirmButtonText: '確定'
                 })
             }
         })

	 })
 		
	 $('.det').on("click",function(e){
		 e.preventDefault();
		 var id=$(this).attr("id");	 
		 console.log(id);
		 Swal.fire({
		      html:'<iframe src = /news/detail/'+id+' width="800px" height="500px">',
		      width:"1030px"
			})
	 })
	 
	 
	 
});
 
	</script>
                
 
            <!-- Datatable Setting js -->
                <script src="/vendors/scripts/datatable-setting.js"></script>     
              
        </body>

        </html>