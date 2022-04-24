<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="/css/datatable.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.8/dist/sweetalert2.all.min.js"></script>
<script src="/js/order.js" type="text/javascript"  charset="UTF-8"></script>
<title >後台管理-訂單</title>

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
td,th,tr{
text-align:center;
}
</style>
<body>
<%@ include file="../header.jsp" %>
 <div class="main-container">
<div class="pd-ltr-20">
	<h2>訂單</h2>
	<br/>
	<div >
		<table class="display" style="margin-top:20px" id="example">
		<thead class="table-light">
		    <tr>
		    	<th>編號</th>
		    	<th>訂單編號</th>
		    	<th>數量</th>
		    	<th>下單日期</th>
		    	<th>訂單價格</th>
		    	<th>訂購者</th>	    	
		    	<th>訂單狀態</th>	    	
		    	<th>操作</th>
		    </tr>
		</thead>
		<tbody id="insert">
			<c:forEach var="ol" items="${orderlist}">
			<tr>
				<td>${ol.orderNo}</td>
				<td>${ol.orderNumber}</td>
				<td>${ol.orderQty}</td>
				<td>${ol.orderDate}</td>
				<td>${ol.orderPrice}</td>
				<td>${ol.orderOwner}</td>
				<td>${ol.orderStatus}</td>
				<td>
				<button style="display: inline" class="btn btn-outline-danger btn-sm del" id="${ol.orderNo}">刪除</button>
				<button style="display: inline" class="btn btn-outline-success btn-sm upd" id="${ol.orderNo}">修改</button></a>
				<a href="/order/detail/${ol.orderNo }"><button style="display: inline" class="btn btn-outline-primary btn-sm det" id="${ol.orderNo}">詳細</button></a>
				</td>
	
		</c:forEach>		   
		</tbody>
		</table>
	</div>
</div>
</div>
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
                 $("<td>").append('<input type="hidden" id="o2"  name="orderQty" value='+data.orderQty+'>'+data.orderQty+'').appendTo("#tr"+data.orderNo);
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
         	            	"orderQty":$("#o2").val(),
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
			const swalWithBootstrapButtons = Swal.mixin({
 customClass: {
   confirmButton: 'btn btn-success',
   cancelButton: 'btn btn-danger'
 },
 buttonsStyling: false
})

swalWithBootstrapButtons.fire({
	 title: '提醒',
	 text: "刪除後資料無法恢復",
 icon: 'warning',
 showCancelButton: true,
 confirmButtonText: '確認',
 cancelButtonText: '取消',
 reverseButtons: true
}).then((result) => {
 if (result.isConfirmed) {
	 $.ajax({
			type:"delete",
			url:'/order/orderlist/'+id,
			success:function(){		
			}
	 
		})
   swalWithBootstrapButtons.fire(
     '提醒',
     '已成功刪除',
     'success'
   )
   var tr=$(this).parent().parent();
	$('#example').DataTable().row(tr).remove().draw(false);
 } else if (
   /* Read more about handling dismissals below */
   result.dismiss === Swal.DismissReason.cancel
 ) {
   swalWithBootstrapButtons.fire(
     '提醒',
     '取消刪除',
     'error'
   )
 }
})

		 })
	
	    	
	 $('.det').on("click",function(e){
		 var table= $('#example').DataTable();
		 var id=$(this).attr("id");
		 e.preventDefault();
		 console.log(id);
		 Swal.fire({
		      html:'<iframe src = /order/detail/'+id+' width="1000px" height="400px">',
		      width:"1080px"
			})
	 })
	 
	  $('#example').DataTable({

		 "ordering": false,
		 "lengthMenu":[5,10,15,20],
		 "language":{
	    	    "processing": "處理中...",
	    	    "loadingRecords": "載入中...",
	    	    "lengthMenu": "顯示 _MENU_ 項結果",
	    	    "zeroRecords": "沒有符合的結果",
	    	    "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
	    	    "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
	    	    "infoFiltered": "(從 _MAX_ 項結果中過濾)",
	    	    "search": "搜尋:",
	    	    "paginate": {
	    	        "first": "第一頁",
	    	        "previous": "上一頁",
	    	        "next": "下一頁",
	    	        "last": "最後一頁"
	    	    },
	    	    "aria": {
	    	        "sortAscending": ": 升冪排列",
	    	        "sortDescending": ": 降冪排列"
	    	    },
	    	    "emptyTable": "目前沒有資料",
	    	    "datetime": {
	    	        "previous": "上一頁",
	    	        "next": "下一頁",
	    	        "hours": "時",
	    	        "minutes": "分",
	    	        "seconds": "秒",
	    	        "amPm": [
	    	            "上午",
	    	            "下午"
	    	        ],
	    	        "unknown": "未知",
	    	        "weekdays": [
	    	            "週日",
	    	            "週一",
	    	            "週二",
	    	            "週三",
	    	            "週四",
	    	            "週五",
	    	            "週六"
	    	        ],
	    	        "months": [
	    	            "一月",
	    	            "二月",
	    	            "三月",
	    	            "四月",
	    	            "五月",
	    	            "六月",
	    	            "七月",
	    	            "八月",
	    	            "九月",
	    	            "十月",
	    	            "十一月",
	    	            "十二月"
	    	        ]
	    	    },
	    	    "searchBuilder": {
	    	        "add": "新增條件",
	    	        "condition": "條件",
	    	        "deleteTitle": "刪除過濾條件",
	    	        "button": {
	    	            "_": "複合查詢 (%d)",
	    	            "0": "複合查詢"
	    	        },
	    	        "clearAll": "清空",
	    	        "conditions": {
	    	            "array": {
	    	                "contains": "含有",
	    	                "empty": "為空",
	    	                "equals": "等於",
	    	                "not": "不為",
	    	                "notEmpty": "不為空",
	    	                "without": "排除"
	    	            },
	    	            "date": {
	    	                "after": "大於",
	    	                "before": "小於",
	    	                "between": "在其中",
	    	                "empty": "為空",
	    	                "equals": "等於",
	    	                "not": "不為",
	    	                "notBetween": "不在其中",
	    	                "notEmpty": "不為空"
	    	            },
	    	            "number": {
	    	                "between": "在其中",
	    	                "empty": "為空",
	    	                "equals": "等於",
	    	                "gt": "大於",
	    	                "gte": "大於等於",
	    	                "lt": "小於",
	    	                "lte": "小於等於",
	    	                "not": "不為",
	    	                "notBetween": "不在其中",
	    	                "notEmpty": "不為空"
	    	            },
	    	            "string": {
	    	                "contains": "含有",
	    	                "empty": "為空",
	    	                "endsWith": "字尾為",
	    	                "equals": "等於",
	    	                "not": "不為",
	    	                "notEmpty": "不為空",
	    	                "startsWith": "字首為",
	    	                "notContains": "不包含",
	    	                "notStarts": "不為開頭",
	    	                "notEnds": "不為結束"
	    	            }
	    	        },
	    	        "data": "欄位",
	    	        "leftTitle": "群組條件",
	    	        "logicAnd": "且",
	    	        "logicOr": "或",
	    	        "rightTitle": "取消群組",
	    	        "title": {
	    	            "_": "複合查詢 (%d)",
	    	            "0": "複合查詢"
	    	        },
	    	        "value": "內容"
	    	    },
	    	    "editor": {
	    	        "close": "關閉",
	    	        "create": {
	    	            "button": "新增",
	    	            "title": "建立新項目",
	    	            "submit": "建立"
	    	        },
	    	        "edit": {
	    	            "button": "編輯",
	    	            "title": "編輯項目",
	    	            "submit": "更新"
	    	        },
	    	        "remove": {
	    	            "button": "刪除",
	    	            "title": "刪除",
	    	            "submit": "刪除",
	    	            "confirm": {
	    	                "_": "您確定要刪除 %d 筆資料嗎？",
	    	                "1": "您確定要刪除 %d 筆資料嗎？"
	    	            }
	    	        },
	    	        "multi": {
	    	            "restore": "回復修改",
	    	            "title": "每行有不同的價值",
	    	            "info": "您選擇了多個項目，每項目都有不同的價值。如果您想所有選擇的項目都用同一個價值，可以在這裏輸入一個價值。要不然它們會保留原本各自的價值",
	    	            "noMulti": "此列不容許同時編輯多個項目"
	    	        },
	    	        "error": {
	    	            "system": "系統發生錯誤(更多資訊)"
	    	        }
	    	    },
	    	    "autoFill": {
	    	        "cancel": "取消"
	    	    },
	    	    "buttons": {
	    	        "copySuccess": {
	    	            "_": "複製了 %d 筆資料",
	    	            "1": "複製了 1 筆資料"
	    	        },
	    	        "copyTitle": "已經複製到剪貼簿",
	    	        "excel": "Excel",
	    	        "pdf": "PDF",
	    	        "print": "列印",
	    	        "copy": "複製"
	    	    },
	    	    "searchPanes": {
	    	        "collapse": {
	    	            "_": "搜尋面版 (%d)",
	    	            "0": "搜尋面版"
	    	        },
	    	        "emptyPanes": "沒搜尋面版",
	    	        "loadMessage": "載入搜尋面版中...",
	    	        "clearMessage": "清空"
	    	    },
	    	    "select": {
	    	        "rows": {
	    	            "_": "%d 列已選擇",
	    	            "1": "%d 列已選擇"
	    	        }
	    	    },
	    	    "stateRestore": {
	    	        "emptyError": "名稱不能空白。"
	    	    }
	    	},
	 });
});
</script>
</body>
</html>