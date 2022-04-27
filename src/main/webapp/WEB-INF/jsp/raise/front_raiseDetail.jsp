<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon"
	href="/assets/img/logo/logo2.png">
<title>梅嘎 | Mega</title>
<!-- CSS only -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : 'get',
			url : '/raise/${raiseNo}',
			success : function(item) {
				var div_product_image = $('<div/>').addClass('product_image_area section-padding40');
				var div_row_s_p_i = $('<div/>').addClass('row s_product_inner');
				var div_collg5 = $('<div/>').addClass('col-lg-5');
				$('<img/>').addClass('w-100').attr('src',item.raisePicBase64).appendTo(div_collg5);
				div_collg5.appendTo(div_row_s_p_i);
				var div_collg5_offset = $('<div/>').addClass('col-lg-5 offset-lg-1');
				var div_s_p_t = $('<div/>').addClass('s_product_text');
				var div_style_gray = $('<div/>').css('font-size','0.875rem').css('color','gray');
				$('<span/>').css('font-weight','bold').html('台灣').appendTo(div_style_gray);
				$('<div/>').css('display','inline-block').css('margin','0 0.25rem 0 0.25rem').text('\\').appendTo(div_style_gray);
				$('<span/>').css('font-weight','bold').html('群眾募資').appendTo(div_style_gray);
				$('<div/>').css('display','inline-block').css('margin','0 0.25rem 0 0.25rem').text('\\').appendTo(div_style_gray);
				$('<span/>').css('font-weight','bold').html(item.raiseCategory).appendTo(div_style_gray);
				div_style_gray.appendTo(div_s_p_t);

				$('<h3/>').css('margin-top','12px').html(item.raiseTitle).appendTo(div_s_p_t);
				$('<span/>').css('font-size','12px').html('提案人 ' + item.raiseName).appendTo(div_s_p_t);
				$('<p/>').html(item.raiseBrief).appendTo(div_s_p_t);
				//金額包含千分位符號
				var rTarget = Number(parseFloat(item.raiseTarget)).toLocaleString("en");
				$('<div/>').css('font-size','14px').html('目標 NT$ ' + rTarget).appendTo(div_s_p_t);
				//贊助人數尚未有資料可抓
				$('<div/>').css('font-size','14px').html('贊助人數 ' + '99').appendTo(div_s_p_t);

				//計算到期天數
				var dayNow = new Date();
				var theDate = item.raiseExpDate;
				var theExpDate = new Date(theDate.substring(0,4),theDate.substring(5,7)-1,theDate.substring(8,10))
				var theDiffTime = theExpDate-dayNow;
				var theDiffDays = Math.ceil(theDiffTime / (1000 * 60 * 60 * 24)) 
				if(theDiffDays < 0){
					$('<div/>').html('已於 '+theDate+' 到期').appendTo(div_s_p_t);
				}else{	
					$('<div/>').html('剩下'+theDiffDays+'天').appendTo(div_s_p_t);
				}
				$('<div/>').html('時程 ' + item.raiseSDate + ' ~ ' + theDate).appendTo(div_s_p_t);			
				div_s_p_t.appendTo(div_collg5_offset);
				div_collg5_offset.appendTo(div_row_s_p_i);
				div_row_s_p_i.appendTo(div_product_image);
				//中間分隔線
				$('<div/>').css('margin','20px 0px 20px 0px').css('border-bottom','solid 1px #e0e0e0').appendTo(div_product_image);
				var div_flex =$('<div/>').css('display','flex')
				$('<div/>').css('flex','67%').html(item.raiseDescribe).appendTo(div_flex);
				var div_flex30 = $('<div/>').css('flex','30%').css('margin-left','3%');

				$.each(item.raisePlanBeanSet,function(i,item){
					var div_col = $('<div/>').css('width','380px').css('margin','10px');
					var div_card = $('<div/>').addClass('card h-100');
					//連結至付款尚未更新
					var a_img = $('<a/>').attr('href','');
					$('<img/>').attr('src',item.raisePlanPicBase64).addClass('card-img-top').appendTo(a_img);
					//金額包含千分位符號
					var rpAmount = Number(parseFloat(item.raisePlanAmount)).toLocaleString("en");
					$('<h3/>').addClass('card-title').css('padding','1.25rem 1.25rem 0rem 1.25rem').html('<b>NT$'+rpAmount+'</b>').appendTo(a_img);
					a_img.appendTo(div_card);
					var div_cardBody = $('<div/>').addClass('card-body');
					$('<p/>').addClass('card-text').html(item.raisePlanDescribe).appendTo(div_cardBody);
					div_cardBody.appendTo(div_card);
					var div_cardFooter = $('<div/>').addClass('card-footer').addClass('header-area');
					//計算到期天數
					var theDate = item.raisePlanADate;
					$('<small/>').addClass('text-muted').html('預計於'+theDate.substring(0,4)+'年'+theDate.substring(5,7)+'月實現').appendTo(div_cardFooter);
					
					
					div_cardFooter.appendTo(div_card);
					div_card.appendTo(div_col);
					div_col.appendTo(div_flex30);
					
				});
				
				div_flex30.appendTo(div_flex);
				div_flex.appendTo(div_product_image);
				div_product_image.appendTo($('#result'));
			}
		});
	});
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
						<div id="result" style="width: 1200px"></div>

					</div>
				</div>
			</div>
		</section>
	</main>

	<%@ include file="../userfooter.jsp"%>
</body>

</html>