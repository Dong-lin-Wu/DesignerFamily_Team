<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Mega|討論區</title>
 <link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<style>
	.flex{
	display:flex;
	  align-items:center;
	  justify-content:center;
	  
	  background-color:#eee;
	}
	.properties{
		background-color:#eee;
	}
	
	.btn-close {
		box-sizing: content-box;
		width: 1em;
		height: 1em;
		padding: .25em .25em;
		color: #000;
		background: transparent url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23000'%3e%3cpath d='M.293.293a1 1 0 011.414 0L8 6.586 14.293.293a1 1 0 111.414 1.414L9.414 8l6.293 6.293a1 1 0 01-1.414 1.414L8 9.414l-6.293 6.293a1 1 0 01-1.414-1.414L6.586 8 .293 1.707a1 1 0 010-1.414z'/%3e%3c/svg%3e") center/1em auto no-repeat;
		border: 0;
		border-radius: .25rem;
		opacity: .5;
	}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	/* //新增按鈕
	var forminsert = $('<form>').attr('action','/forum/new_post').attr('method','POST');
	var buttoninsert = $('<input/>').attr('type','submit').attr('value','新增').css('font-size','25px');
	buttoninsert.appendTo(forminsert);
	forminsert.appendTo($('#result')); */

	//展示所有
	$.ajax({
		type:'get',
		url:'/forum/forumfindall',
		success: function(data){
			showdata(data);
		},
		error: function(e){			
			console.log('error loading forum');	
		}
	});
	

	
	
});

function showdata(data){


	var div_row = $('<div/>').addClass('row-cols-1 row-cols-md-3 g-4');
	
	
    $.each(data,function(i,item){//data是array
        
		var div_col = $('<div/>').css('width','800px').css('margin','10px'); //每一篇討論
		var div_card = $('<div/>').addClass('card h-100').css('border-radius','10px').css('border-bottom ','none');
		$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').css('margin-bottom','12px').html(item.forumCategory+' . ' + item.forumAccount).appendTo(div_card);

		
		var div_cardBody = $('<div/>').addClass('card-body').css('padding-top','0px');
		$('<h3/>').addClass('card-title').html('<b>'+item.forumSubject+'</b>').css('font-size','24px' ).appendTo(div_cardBody);
		
		var theforumDescription = item.forumDescription
		console.log(theforumDescription)
		if(theforumDescription.length < 36){
			$('<p/>').addClass('card-text').html(theforumDescription).css('font-size','20px' ).appendTo(div_cardBody);
		}else{	
			$('<p/>').addClass('card-text').html(theforumDescription.substring(0,35)+'...').css('font-size','20px' ).appendTo(div_cardBody);
		}
		var div_button = $('<div/>').addClass('d-grid gap-2 d-md-flex justify-content-md-end');
// 		var a_button = $('<a/>').attr('href','/forum/'+item.forumid);
		$('<button/>').attr("data-bs-toggle","modal").attr("data-bs-target","#discussDetails").addClass('btn btn-primary btn-sm').html("details").attr('onclick','showdetail('+item.forumid+')').appendTo(div_button);
// 		$('<button/>').addClass('btn btn-primary btn-sm').attr('data-remote','false').attr("data-bs-toggle","modal").attr("data-bs-target","#discussDetails${dl.getForumid()}").css('font-size','16px').html("details").attr('id','button_detail').appendTo(div_button);
// 		a_button.appendTo(div_button);
		<!--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#discussDetails${dl.getForumid()}">詳細</button>-->
		
		
		
		div_button.appendTo(div_cardBody);
		div_cardBody.appendTo(div_card);		
		div_card.appendTo(div_col);
		div_col.appendTo(div_row);
    });
    
    div_row.appendTo($('#result'));
}

function showdetail(forumid){
	$('#div_comm').html("");
	console.log("id: "+forumid);
	$.ajax({
		type:'get',
		url:'/forum/'+forumid,
		success: function(data){
			$('#commentsubmit').attr('onclick','addcomment('+forumid+')').appendTo('#div_comment');
			//$('#theForumid').val(forumid);
			console.log(data)
			$('#modal-body').css('padding','30px');
			$('#div_acc').html(data.forumAccount).css('font-size','18px');
			$('#div_sub').html('<b>'+data.forumSubject+'<b>').css('font-size','32px');
			$('#div_cate').html(data.forumCategory+' ﹒ ' + data.forumCreate_time.substring(0,16)).css('font-size','18px');
			$('#div_detail').html(data.forumDescription).css('padding-top','10px').css('font-size','24px');
			
			//console.log(data.commentBean)
			
			$.each(data.commentBean,function(i,item){
				
				
				//var div_comm = $('<div/>').css('width','800px').css('margin','5px');
				var div_card = $('<div/>').addClass('card h-100').css('border-left','none').css('border-right','none');
				
				var div_cardBody = $('<div/>').addClass('card-body').css('padding-top','0px');
				$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').css('margin-bottom','12px').html(item.commentAccount).appendTo(div_card);
				$('<p/>').addClass('card-text').html(item.commentDescription).css('font-size','18px' ).appendTo(div_cardBody);
				
				//$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').css('margin-bottom','12px').html(item.commentDescription).appendTo(div_cardBody);
				console.log("item.commentDescription:"+item.commentDescription);
				div_cardBody.appendTo(div_card);
				div_card.appendTo($('#div_comm'));
				
			});
			
		},
		error: function(e){			
			console.log('error loading forum');	
		}
	});
};

function addcomment(forumid){
	var commenttext = $('#comment_text').val();
	console.log($('#comment_text').val());
	var account = '${login.account}';
	var comment = $('#comment_text').val();
	var obj = new Object();
	obj.commentAccount = account;
	obj.commentDescription = comment;
	obj.forumid = forumid;
	
	if (account == '') {
		location.href = "/login";
	} else if(commenttext=="" || commenttext == null){
		
		swal({
            icon: 'warning',
            text: '留言不能為空',
            button: false,
            timer: 1500
             })  
		
	}
	else {
		console.log('processing ajax');
		$.ajax({
			type:'post',
			url:'/forum/new_comment',
			data:obj,
			success: function(data){
				console.log('ajax success!');
				//$('#comment_text').val();
				//$('#theForumid').val("123");
				
				var div_card = $('<div/>').addClass('card h-100').css('border-left','none').css('border-right','none');
				
				var div_cardBody = $('<div/>').addClass('card-body').css('padding-top','0px');
				$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').css('margin-bottom','12px').html(account).appendTo(div_card);
				$('<p/>').addClass('card-text').html(comment).css('font-size','18px' ).appendTo(div_cardBody);
				
				//$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').css('margin-bottom','12px').html(item.commentDescription).appendTo(div_cardBody);
				console.log("comment:"+comment);
				div_cardBody.appendTo(div_card);
				div_card.appendTo($('#div_comm'));
				
				$('#comment_text').val(" ");
				
				
				
			},
			error: function(e){			
				console.log('error loading comment');	
			}
		});
	
	
	};
};

</script>

</head>
<body>
<%@ include file="../userheader.jsp"%>
<main >
	<section class="properties new-arrival fix">
		<div class="container">
			<div class="row">
				<div class="tab-content" id="nav-tabContent">
					<form action=""></form>
					<div class="flex" id="result" style="width:1200px"  >
					</div>
					
                                               <div class="modal fade" id="discussDetails" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                               <div class="modal-dialog modal-dialog-scrollable" style="max-width: 800px;margin-top:150px">
                                               <div class="modal-content">
                                               <div class="modal-header">
                                                   <h5 class="modal-title" id="exampleModalLabel" ></h5>
                                                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                               </div>
                                               <div class="modal-body" id="modal-body">
                                              		<div id="div_cate"></div>
                                               
                                                   <div id="div_acc"></div>                                                                 
                                                   <div id="div_sub"></div>
                                                   
                                                   <div id="div_detail"></div>
                                                   
                                                   <div id="div_comm"></div>
                                                   
                                                    
                                               </div>
                                               <div>
                                               
                                               	<div>
                                               		<!-- <input type="hidden" name="forumid" id="theForumid"> -->
                                               		<textarea id="comment_text" style="width: 740px;margin:0px 30px 0px 30px" rows="3" placeholder="留言......"></textarea>
                                               		
                                               		<div id="div_comment"style="display:flex;justify-content:right;margin:10px 30px 30px 30px">
                                               			<button type="button" class="btn btn-secondary" id="commentsubmit">送出</button>
                                               		</div>
                                               	</div>
<!--                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>			         -->
                                               </div>
                                               </div>
                                           </div>
                                           </div>
                                               
				</div>
			</div>
		</div>
	</section>
</main>	
<%@ include file="../userfooter.jsp"%>
</body>
</html>