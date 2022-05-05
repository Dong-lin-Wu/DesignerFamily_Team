<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>Forum</title>
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
	

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	//新增按鈕
	//var forminsert = $('<form>').attr('action','/forum/new_post').attr('method','POST');
	//var buttoninsert = $('<input/>').attr('type','submit').attr('value','新增').css('font-size','25px');
	//buttoninsert.appendTo(forminsert);
	//forminsert.appendTo($('#result'));

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
	console.log("click!!!");
	console.log("id: "+forumid);
	$.ajax({
		type:'get',
		url:'/forum/'+forumid,
		success: function(data){
			console.log(data)
			$('#modal-body').css('padding','30px');
			$('#div_acc').html(data.forumAccount).css('font-size','14px');
			$('#div_sub').html('<b>'+data.forumSubject+'<b>').css('font-size','32px');
			$('#div_cate').html(data.forumCategory+' ﹒ ' + data.forumCreate_time.substring(0,16)).css('font-size','14px');
			$('#div_detail').html(data.forumDescription).css('padding-top','10px');
			
		},
		error: function(e){			
			console.log('error loading forum');	
		}
	});
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
                                                   
                                                    
                                               </div>
                                               <div class="modal-footer">
                                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>				        
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