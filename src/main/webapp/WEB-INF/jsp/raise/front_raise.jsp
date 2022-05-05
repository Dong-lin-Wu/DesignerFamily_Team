<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<title>梅嘎 | Mega</title>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//類別篩選
	$('<span/>').html('探索類別:').css('margin-right','20px').css('font-size','20px').css('color','black').css('font-weight','bold').appendTo($('#div_cat'));
	var select_cat = $('<select/>').addClass('onchange').css('width','100px');
	$('<option/>').val('').text('全部').appendTo(select_cat);
	$('<option/>').val('音樂').text('音樂').appendTo(select_cat);
	$('<option/>').val('攝影').text('攝影').appendTo(select_cat);
	$('<option/>').val('時尚').text('時尚').appendTo(select_cat);
	$('<option/>').val('設計').text('設計').appendTo(select_cat);
	$('<option/>').val('遊戲').text('遊戲').appendTo(select_cat);
	$('<option/>').val('飲食').text('飲食').appendTo(select_cat);
	$('<option/>').val('教育').text('教育').appendTo(select_cat);
	$('<option/>').val('科技').text('科技').appendTo(select_cat);
	$('<option/>').val('藝術').text('藝術').appendTo(select_cat);
	select_cat.appendTo($('#div_cat'));
	
	//展示所有募資
	$.ajax({
		type:'get',
		url:'/raisebystatus',
		success: function(data){
			showdata(data);
		},
		error: function(e){
			console.log('something is wrong!');	
		}
	});
});
//以下方法同front_myRaise
function showdata(data){
	var dayNow = new Date();

	var div_row = $('<div/>').addClass('row row-cols-1 row-cols-md-3 g-4');
    $.each(data,function(i,item){
		var div_col = $('<div/>').css('width','380px').css('margin','10px');
		var div_card = $('<div/>').addClass('card h-100');
		var a_img = $('<a/>').attr('href','/front_raisedetail/'+item.raiseNo);
		$('<img/>').attr('src',item.raisePicBase64).addClass('card-img-top').css('height','280px').appendTo(a_img);
		
		$('<h3/>').addClass('card-title').css('padding','1.25rem 1.25rem 0rem 1.25rem').html('<b>'+item.raiseTitle+'</b>').appendTo(a_img);
		a_img.appendTo(div_card);
		var div_cardBody = $('<div/>').addClass('card-body');
		$('<p/>').css('font-size','12px').html(item.raiseCategory+' by ' + item.raiseName).appendTo(div_cardBody);
		$('<p/>').addClass('card-text').html(item.raiseBrief).appendTo(div_cardBody);
		div_cardBody.appendTo(div_card);
		var div_cardFooter = $('<div/>').addClass('card-footer').addClass('header-area');
		//計算到期天數
		var theDate = item.raiseExpDate;
		var theExpDate = new Date(theDate.substring(0,4),theDate.substring(5,7)-1,theDate.substring(8,10))
		var theDiffTime = theExpDate-dayNow;
		var theDiffDays = Math.ceil(theDiffTime / (1000 * 60 * 60 * 24)) 
		if(theDiffDays < 0){
			$('<small/>').addClass('text-muted').html('已於'+item.raiseExpDate+'到期').appendTo(div_cardFooter);
		}else{	
			$('<small/>').addClass('text-muted').html('剩下'+theDiffDays+'天').appendTo(div_cardFooter);
		}
		//金額包含千分位符號
		var rTarget = Number(parseFloat(item.raiseTarget)).toLocaleString("en");
		$('<span/>').css('position','absolute').css('right','15px').html('NT$ ' + rTarget).appendTo(div_cardFooter);
		div_cardFooter.appendTo(div_card);
		div_card.appendTo(div_col);
		div_col.appendTo(div_row);
		
    });
    div_row.appendTo($('#result'));
}
//動態繫節尚未完成!!!
$(document).on('change','.onchange',function(){
	$('#result').empty();
	var cat = $('.onchange').val();
	if(cat!= ''){
		//展示指定類別的募資
		$.ajax({
			type:'get',
			url:'/raisebycategory/'+cat,
			success: function(data){
				console.log(data.length);
				if(data.length > 0){
					showdata(data);
				}else{
					var p_nodata = $('<p/>').css('font-size','30px').html('尚無資料，歡迎前往').appendTo($('#result'));
					$('<a/>').attr('href','/raiseadd.checklogin').css('color','red').html('提案!').appendTo(p_nodata);
				}	
			},
			error: function(e){
				console.log('something is wrong!');	
			}
		});
	}else{
		//展示所有募資
		$.ajax({
			type:'get',
			url:'/raisebystatus',
			success: function(data){
				showdata(data);
			},
			error: function(e){
				console.log('something is wrong!');	
			}
		});
	}
})

</script>
</head>
<body>
	<%@ include file="../userheader.jsp"%>
<br>

<main>
	<section class="properties new-arrival fix">
		<div class="container">
			<div class="row">
				<div class="tab-content" id="nav-tabContent">
					<div id="div_cat" style="margin-bottom:15px"></div>
					<div id="result" style="width:1200px"></div>
				</div>
			</div>
		</div>
	</section>
</main>

	<%@ include file="../userfooter.jsp"%>
</body>
</html>