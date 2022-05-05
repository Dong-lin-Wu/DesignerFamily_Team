<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>後台管理-訂單</title>
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
                                            <h4>訂單</h4>
                                        </div>
                                        <nav aria-label="breadcrumb" role="navigation">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item">
                                                    <a href="/admin">首頁</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">訂單</li>
                                            </ol>
                                        </nav>
                                    </div>                                 
                                </div>
                            </div>

                            <!-- Simple Datatable start -->
                            <div class="card-box mb-30">
                                <div class="pd-20">
                                    <h4 class="text-blue h4">訂單清單</h4>
                                </div>
                                <div class="pb-20">
                                    <table class="table hover stripe data-table-export nowrap">
                                        <thead>
                                            <tr>
                                                <th class="table-plus">編號</th>
                                                <th>訂單編號</th>
		                                     	<th>下單日期</th>
		    	                                <th>訂單價格</th>
		    	                                <th>訂購者</th>	    	
		    	                                <th>訂單狀態</th>	  
                                                <th class="datatable-nosort">功能</th>
                                            </tr>
                                        </thead>
                                        <tbody id="insert">
                                            <c:forEach var="ol" items="${orderlist}">
                                                <tr>
                                                  <td>${ol.orderNo}</td>
										          <td>${ol.orderNumber}</td>
										          <td>${ol.orderDate}</td>
										          <td>${ol.orderPrice}</td>
										          <td>${ol.orderOwner}</td>
										          <td>${ol.orderStatus}</td>
										             <td>
                                                        <div class="dropdown">
                                                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                                                href="#" role="button" data-toggle="dropdown">
                                                                <i class="dw dw-more"></i>
                                                            </a>
                                                            <div
                                                                class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                                <a class="" href="/order/detail/${ol.orderNo}">
                                                                 <button type="button" class="dropdown-item  det"
                                                                        id="${ol.orderNo}">
                                                                <i class="dw dw-eye"></i>詳細</button></a>
                                                                    <button type="button" class="dropdown-item  upd"
                                                                        id="${ol.orderNo}"><i class="dw dw-edit2"></i>
                                                                        修改</button>
                                                                    <button type="button" class="dropdown-item  del"
                                                                        id="${ol.orderNo}"><i class="dw dw-delete-3"></i>
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
	
	$('.upd').on("click",function(){
		var id=$(this).attr("id");
		console.log(id);
		$.ajax({
			type:"get",
			url:'/order/orderlist/'+id,
            dataType:"json",
			success: function(data){
            console.log(data);
             $("#insert").empty("");
            	 $("<tr>").attr("id","tr"+data.orderNo).appendTo("#insert");
                 $("<td>").append(data.orderNo).appendTo("#tr"+data.orderNo);//建立一個tr表頭,把後續的內容都append上去
                 $("<td>").append('<input type="hidden" id="o1" name="orderNumber" value='+data.orderNumber+'>'+data.orderNumber+'').appendTo("#tr"+data.orderNo);               
                 $("<td>").append('<input type="hidden" id="o3" name="orderDate" value="'+data.orderDate+'" >'+data.orderDate+'').appendTo("#tr"+data.orderNo);
                 $("<td>").append('<input type="hidden" id="o4" name="orderPrice" value='+data.orderPrice+'>'+data.orderPrice+'').appendTo("#tr"+data.orderNo);
                 $("<td>").append('<input type="hidden" id="o5" name="orderOwner" value='+data.orderOwner+'>'+data.orderOwner+'').appendTo("#tr"+data.orderNo);
                 $("<td>").append('<select id="o6"><option selected>'+data.orderStatus+'</option><option>未付款</option><option>已付款</option><option>訂單完成</option></select>').appendTo("#tr"+data.orderNo);
                 $("<td>").append('<button style="display: inline" class="btn btn-outline-success btn-sm ck" id='+data.orderNo+'>確定</button> <a href="/order"><button style="display: inline" class="btn btn-outline-danger btn-sm ">取消</button></a>').appendTo("#tr"+data.orderNo);  
                 
                 $('.ck').on("click",function(){
         			var id=$(this).attr("id");
         			console.log(id)
         			$.ajax({
         				type:"put",
         				url:'/order/orderlist/'+id,
         	            dataType:"json",
         	            data:{"orderNumber":$("#o1").val(),
         	            	"orderDate":$("#o3").val(),
         	            	"orderPrice":$("#o4").val(),
         	            	"orderOwner":$("#o5").val(),
         	            	"orderStatus":$("#o6").val()
         	            },
         				success: function(data){
         					console.log(data);
         					location.reload();
         				}
         			})
         		})
         	 
			}
			
		})
	});
	 
	 $('.del').on("click",function(){
		 var id= $(this).attr("id")
		 console.log(id);
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
         			url:'/order/orderlist/'+id,
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
		 var table= $('#example').DataTable();
		 var id=$(this).attr("id");
		 e.preventDefault();
		 console.log(id);
		 Swal.fire({
		      html:'<iframe src = /order/detail/'+id+' width="1050px" height="430px">',
		      width:"1150px"
			})
	 })
	 
});
</script>
            <!-- Datatable Setting js -->
                <script src="/vendors/scripts/datatable-setting.js"></script>     
              
        </body>

        </html>