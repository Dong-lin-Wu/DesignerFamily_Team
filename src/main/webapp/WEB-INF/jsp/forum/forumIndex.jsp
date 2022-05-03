<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.ico">
<title>Mega|討論區</title>
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
		$('<p/>').css('padding','1.25rem 1.25rem 0rem 1.25rem').html(item.forumCategory+' . ' + item.forumAccount).appendTo(div_card);

		
		var div_cardBody = $('<div/>').addClass('card-body');
		$('<h3/>').addClass('card-title').css('font-size','16px' ).html('<b>'+item.forumSubject+'</b>').appendTo(div_cardBody);
		
		var theforumDescription = item.forumDescription
		console.log(theforumDescription)
		if(theforumDescription.length < 36){
			$('<p/>').addClass('card-text').html(theforumDescription).appendTo(div_cardBody);
		}else{	
			$('<p/>').addClass('card-text').html(theforumDescription.substring(0,35)+'...').appendTo(div_cardBody);
		}
		div_cardBody.appendTo(div_card);		

		div_card.appendTo(div_col);
		div_col.appendTo(div_row);
    });

    div_row.appendTo($('#result'));
}

</script>
</head>
<body>
<%@ include file="../userheader.jsp"%>
<main >
	<section class="properties new-arrival fix">
		<div class="container">
			<div class="row">
				<div class="tab-content" id="nav-tabContent">
					<div class="flex" id="result" style="width:1200px"  ></div>
				</div>
			</div>
		</div>
	</section>
</main>	
<%@ include file="../userfooter.jsp"%>
</body>
</html>