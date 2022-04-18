<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		$.ajax({
			type:'get',
			url:'raise',
			success: function(data){
				var dayNow = new Date();

				var div_row = $('<div/>').addClass('row row-cols-1 row-cols-md-3 g-4');
                $.each(data,function(i,item){
					var div_col = $('<div/>').addClass('col');
					var div_card = $('<div/>').addClass('card h-100');
					$('<img/>').attr('src',item.raisePicBase64).addClass('card-img-top').appendTo(div_card);
					var div_cardBody = $('<div/>').addClass('card-body');
					$('<h3/>').addClass('card-title').html('<b>'+item.raiseTitle+'</b>').appendTo(div_cardBody);
					$('<p/>').css('font-size','12px').html(item.raiseCategory+' by ' + item.raiseName).appendTo(div_cardBody);
					$('<p/>').addClass('card-text').html(item.raiseBrief).appendTo(div_cardBody);
					div_cardBody.appendTo(div_card);
					var div_cardFooter = $('<div/>').addClass('card-footer');
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
			},
			error: function(e){
				console.log('something is wrong!');	
			}
			
		});
});
</script>
</head>
<body>
<div id="result" style="width:1500px"></div>
</body>
</html>