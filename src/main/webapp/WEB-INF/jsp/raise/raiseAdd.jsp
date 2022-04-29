<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.designerfamily.raise.model.RaiseBean"%>
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
<script
    src="https://code.jquery.com/jquery-3.6.0.js"
    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
    crossorigin="anonymous">
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Summer Note -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
<style>
	div{
		margin-top:20px;
		
	}
</style>

</head>
<body>
	<div class='container'>
		<h3 style="margin-top:20px">募資提案</h3>
		<form id="form_raise" enctype="multipart/form-data">
	        <div class="mb-3">
	            <label for="Raise_Title" class="form-label"><b>計畫名稱</b>&emsp;<span style="color:red"></span></label>
	            <input type="text" class="form-control nBlank" id="Raise_Title" name="raiseTitle" required="required">
	        </div>
	        <div class="mb-3">
	            <label for="Raise_Brief" class="form-label"><b>計畫簡述</b>&emsp;<span style="color:red"></span></label>
	            <input type="text" class="form-control nBlank" id="Raise_Brief" name="raiseBrief" aria-describedby="BriefInfo" required="required">
	            <div id="BriefInfo" class="form-text">請用簡短的兩三句話介紹這個計畫。</div>
	        </div>
	        <div class="mb-3">
	            <label for="Raise_Category" class="form-label"><b>計畫類別</b></label>
                   <select id="Raise_Category" name="raiseCategory" class="form-select" style="width:250px"
                       aria-label="Default select example" aria-describedby="CategoryInfo">
                       <option value="音樂">音樂</option>
                       <option value="攝影">攝影</option>
                       <option value="時尚">時尚</option>
                       <option value="設計">設計</option>
                       <option value="遊戲">遊戲</option>
                       <option value="飲食">飲食</option>
                       <option value="教育">教育</option>
                       <option value="科技">科技</option>
                       <option value="藝術">藝術</option>
                   </select>
	            <div id="CategoryInfo" class="form-text">請選擇計畫類別。</div>
	        </div>
	        	
	        <div class="mb-3">
	            <label for="Raise_Target" class="form-label"><b>計畫目標資金</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="Raise_Target" name="raiseTarget" aria-describedby="TargetInfo" placeholder="100000" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	            <div id="TargetInfo" class="form-text">請根據你計畫的需求，估算你所需要募集的金額。</div>
	        </div>
	        
	        <div class="mb-3">
	            <label for="Raise_PicName" class="form-label"><b>封面照片</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="Raise_PicName" name="raisePicName" required="required">
	        	<input type="hidden" id="Raise_PicBase64" name="raisePicBase64" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv"></div>

	        <div class="mb-3">
	            <label for="Raise_SDate" class="form-label"><b>預計開始時間</b></label><br>
	            <input type="date" id="Raise_SDate" name="raiseSDate">
	            <div id="SDateInfo" class="form-text">告訴我們你希望什麼時候開始你的計畫，我們將會為你安排審核順序。我們至少需要約十個工作天審核你的提案。</div>
	        </div>
	        <div class="mb-3">
	            <label for="Raise_ExpDate" class="form-label"><b>預計結束時間</b></label><br>
	            <input type="date" id="Raise_ExpDate" name="raiseExpDate">
	            <div id="ExpDateInfo" class="form-text">計畫時間建議為期在60天內。</div>
	        </div>
	        <div class="mb-3">
		        <label for="Raise_Describe" class="form-label"><b>計畫說明</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
<!-- 		            <textarea class="form-control nBlank" id="Raise_Describe" name="raiseDescribe" style="height: 200px" required></textarea> -->
		            <div id="summernote"></div>
		            <div id="DescribeInfo" class="form-text">請告訴我們關於你計畫的故事、為什麼大家應該支持你的計畫。</div>
		            <div id="DescribeInfo1" class="form-text">請注意：我們必須要有足夠的訊息才有辦法審核計畫，如果你所提供的資訊過少，或我們無法認證您計畫的真實性、可行性，計畫就會無法上架。</div>
		        </div>
	        </div>
	        <hr>
	    </form> 
	    <form id="form_raiseplan1">
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_1" class="form-label"><b>回饋選項金額（一）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_1" name="raisePlanAmount" aria-describedby="TargetInfo" placeholder="300" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_1" class="form-label"><b>回饋選項照片（一）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_1" name="raisePlanPicName" required="required">
	        	<input type="hidden" id="RaisePlan_PicBase64_1" name="raisePlanPicBase64" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv_1"></div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_1" class="form-label"><b>回饋預計實現時間（一）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_1" name="raisePlanADate">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_1" class="form-label"><b>回饋選項內容說明（一）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_1" name="raisePlanDescribe" style="height: 100px" required></textarea>
		            <div id="PlanDescribeInfo_1" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
	    </form>
	    <form id="form_raiseplan2">
	        <div class="mb-3">
	            <label for="RaisePlan_Amount_2" class="form-label"><b>回饋選項金額（二）</b>&emsp;<span style="color:red"></span></label>
	            <div style="margin-top:0px"><input type="text" class="form-control nBlank" style="width:250px;float:left"
	                    id="RaisePlan_Amount_2" name="raisePlanAmount" aria-describedby="TargetInfo" placeholder="1000" required="required">
	            	<span style="line-height:38px;margin-left:10px">NTD</span>
	            </div>
	        </div>
	         <div class="mb-3">
	            <label for="RaisePlan_PicName_2" class="form-label"><b>回饋選項照片（二）</b></label>
	            <input class="form-control uploadImages" style="width:250px" type="file" id="RaisePlan_PicName_2" name="raisePlanPicName" required="required">
	        	<input type="hidden" id="RaisePlan_PicBase64_2" name="raisePlanPicBase64" value="">
	        </div>
	        <div class="mb-3" id="previewPicDiv_2"></div>
	        
	        <div class="mb-3">
	            <label for="RaisePlan_ADate_2" class="form-label"><b>回饋預計實現時間（二）</b></label><br>
	            <input type="date" id="RaisePlan_ADate_2" name="raisePlanADate">
	        </div>
	        <div class="mb-3">
		        <label for="RaisePlan_Describe_2" class="form-label"><b>回饋選項內容說明（二）</b>&emsp;<span style="color:red"></span></label>
		        <div class="form-floating" style="margin-top:0px">
		            <textarea class="form-control nBlank" id="RaisePlan_Describe_2" name="raisePlanDescribe" style="height: 100px" required></textarea>
		            <div id="PlanDescribeInfo_2" class="form-text">僅供審核，之後可增加、刪減、或修改。</div>
		        </div>
	        </div>
	    </form>    
	        
	        <br>
	        
               <button type="button" class="btn btn-primary" onclick="submitByJson()">Submit</button>
               <button type="button" id="idWriteAll" class="btn btn-secondary" onclick="writeAll()">一鍵輸入</button>
            <br>
            <br>
	</div>
	
	<!-- 以下為script -->

	<script>
		$('#summernote').summernote({
	        placeholder: '',
	        tabsize: 2,
	        height: 150,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	    });
		
		//限制頭尾日期
		let dayNow=new Date();
		let yy=dayNow.getFullYear();
		let mm=dayNow.getMonth()+1;
		mm = (mm < 10 ? '0' : '') + mm; //月份小於10則增加開頭為0並轉為字串
		let mm1=dayNow.getMonth()+1;
		mm1=(mm1+2)%12; //設定結束月份為當天增加二個月為預設月份
		mm1=(mm1 == 0 ? 12 : mm1); //若二個月後為12月，則經過12求餘數為0，將其手動改為12月份
		mm1=(mm1 <10 ? '0': '') + mm1;
		let dd=dayNow.getDate();
		dd = (dd < 10 ? '0' : '') + dd;
		$("#Raise_SDate").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_SDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_SDate").attr("value",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_ExpDate").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#Raise_ExpDate").attr("max",`\${yy+2}-12-31`);
		$("#Raise_ExpDate").attr("value",`\${yy}-\${mm1}-\${dd}`); //三個月後
		$("#RaisePlan_ADate_1").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#RaisePlan_ADate_1").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_1").attr("value",`\${yy}-\${mm1}-\${dd}`);
		$("#RaisePlan_ADate_2").attr("min",`\${yy}-\${mm}-\${dd}`);
		$("#RaisePlan_ADate_2").attr("max",`\${yy+5}-12-31`);
		$("#RaisePlan_ADate_2").attr("value",`\${yy}-\${mm1}-\${dd}`);
		

		//必填欄位提醒
		$(".nBlank").blur(function(event){
			let theSpan = $(this).closest("div.mb-3").children("label").children("span");
			if($(this).val().length == 0){
				theSpan.text("必填");
			}else{
				theSpan.text("");
			}
		})
		
		//一鍵輸入
		function writeAll(){
			
// 			let rNum=Math.ceil(Math.random()*500);
			$("#Raise_Title").attr("value","視力訓練智慧眼鏡");
			$("#Raise_Brief").attr("value","眼部訓練全新升級，智慧管理輕鬆保持好視力。你全家的視力，繼續由奧特視來守護。一代近800名贊助者使用肯定，團隊聽取使用意見再度改進； 美國藍圖療法加持，AI 智慧分析改進");
			$("#Raise_Category option").removeAttr("selected");//若重複點選一鑑輸入，會導致超過一個被選取，因此先清空所有的selected
			$("#Raise_Category option").eq(7).attr("selected","selected");
			$("#Raise_Target").attr("value",100000);
			//$("#Raise_Describe").html('<h4 class="hide-child" style="line-height: 1.6em; font-weight: bold; color: rgb(16, 16, 16); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🤔&nbsp; 原來每天偏頭痛是因為睫狀肌過勞了！讓因為視網膜剝離動過眼睛手術的</span><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">表哥開箱OTUS 2看看！</span><br><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🙅‍♀️&nbsp;&nbsp;</span><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">別再單純按摩眼睛，用正確的方法放鬆睫狀肌、改善近視避免近視，達到訓練眼睛的效果～</span><a href="https://www.zeczec.com/projects/otus-2#h-%F0%9F%A4%94%C2%A0%E5%8E%9F%E4%BE%86%E6%AF%8F%E5%A4%A9%E5%81%8F%E9%A0%AD%E7%97%9B%E6%98%AF%E5%9B%A0%E7%82%BA%E7%9D%AB%E7%8B%80%E8%82%8C%E9%81%8E%E5%8B%9E%E4%BA%86%EF%BC%81%E8%AE%93%E5%9B%A0%E7%82%BA%E8%A6%96%E7%B6%B2%E8%86%9C%E5%89%9D%E9%9B%A2%E5%8B%95%E9%81%8E%E7%9C%BC%E7%9D%9B%E6%89%8B%E8%A1%93%E7%9A%84%E8%A1%A8%E5%93%A5%E9%96%8B%E7%AE%B1OTUS2%E7%9C%8B%E7%9C%8B%EF%BC%81%F0%9F%99%85%E2%80%8D%E2%99%80%EF%B8%8F%C2%A0%C2%A0%E5%88%A5%E5%86%8D%E5%96%AE%E7%B4%94%E6%8C%89%E6%91%A9%E7%9C%BC%E7%9D%9B%EF%BC%8C%E7%94%A8%E6%AD%A3%E7%A2%BA%E7%9A%84%E6%96%B9%E6%B3%95%E6%94%BE%E9%AC%86%E7%9D%AB%E7%8B%80%E8%82%8C%E3%80%81%E6%94%B9%E5%96%84%E8%BF%91%E8%A6%96%E9%81%BF%E5%85%8D%E8%BF%91%E8%A6%96%EF%BC%8C%E9%81%94%E5%88%B0%E8%A8%93%E7%B7%B4%E7%9C%BC%E7%9D%9B%E7%9A%84%E6%95%88%E6%9E%9C%EF%BD%9E" class="gray child f6 v-mid absolute left-0-ns nl3-ns" style="color: rgb(118, 118, 118); margin-left: -1rem; position: absolute; left: 0px; font-size: 0.875rem; vertical-align: middle; opacity: 0; transition: opacity 0.15s ease-in 0s;">#</a></h4><div class="mv2 iframe-wrapper aspect-ratio aspect-ratio--16x9" style="height: 0px; position: relative; padding-bottom: 387.219px; margin-top: 0.5rem; margin-bottom: 0.5rem; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px; transform: translateZ(0px);"><iframe allow="autoplay; encrypted-media" src="https://www.youtube.com/embed/L726uSd68l4" width="560" height="315" class="z-0 aspect-ratio--object" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="position: absolute; inset: 0px; width: 688.391px; height: 387.219px; z-index: 0; max-width: 100%; display: block; border-width: 0px; border-style: initial; margin-left: auto; margin-right: auto;"></iframe></div><blockquote style="position: relative; margin-top: 2rem; margin-bottom: 2rem; border-left-width: 1rem; border-left-color: rgb(244, 244, 244); padding-left: 2rem; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">常常工作或看電視看到偏頭痛或覺得眼壓高嗎？你可能也是睫狀肌過勞喔！ 身為一個因為視網膜剝離動過眼睛手術的人，真的告訴大家保養自己的眼睛很重要，現在台灣人10個人有9個是近視，其中一個是高度近視，而高度近視的定義事實上400度以上就算了，而400度以上就可能會視網膜剝離的問題。</span><br><br><span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">所以！適時的放鬆眼精真的很重要，不僅可以預防近視、改善近視、緩解近視情況，更可以避免很多近視或者睫狀疲勞肌產生的併發症！ 今天就讓表哥開箱OTUS 2 訓練眼鏡二代，讓我們一起不花時間、不影響生活的情況下達到眼睛訓練、視力訓練的效果吧！</span></blockquote><h4 class="hide-child" style="line-height: 1.6em; font-weight: bold; color: rgb(16, 16, 16); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><a name="h-%F0%9F%94%A5%C2%A0%E6%AD%A4%E5%A4%96%EF%BC%8C%E4%B8%89%E5%89%B5%E7%94%9F%E6%B4%BB%E5%9C%92%E5%8D%803%E6%A8%93%E8%A9%A6%E7%94%A8%E6%B4%BB%E5%8B%95%E5%95%9F%E5%8B%95%EF%BC%81%E6%9C%89%E4%BB%BB%E4%BD%95%E7%96%91%E6%85%AE%E7%9A%84%E4%B9%9F%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E5%85%88%E8%A9%A6%E7%94%A8%E5%94%B7%EF%BD%9E" class="nt6 absolute" style="color: rgb(0, 80, 162); margin-top: -8rem; position: absolute;"></a><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🔥&nbsp;&nbsp;<span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">此外，三創生活園區3樓試用活動啟動！有任何疑慮的也可以直接先試用唷～<a href="https://www.zeczec.com/projects/otus-2#h-%F0%9F%94%A5%C2%A0%E6%AD%A4%E5%A4%96%EF%BC%8C%E4%B8%89%E5%89%B5%E7%94%9F%E6%B4%BB%E5%9C%92%E5%8D%803%E6%A8%93%E8%A9%A6%E7%94%A8%E6%B4%BB%E5%8B%95%E5%95%9F%E5%8B%95%EF%BC%81%E6%9C%89%E4%BB%BB%E4%BD%95%E7%96%91%E6%85%AE%E7%9A%84%E4%B9%9F%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E5%85%88%E8%A9%A6%E7%94%A8%E5%94%B7%EF%BD%9E" class="gray child f6 v-mid absolute left-0-ns nl3-ns" style="color: rgb(118, 118, 118); margin-left: -1rem; position: absolute; left: 0px; font-size: 0.875rem; vertical-align: middle; opacity: 0; transition: opacity 0.15s ease-in 0s;">#</a></span></span></h4><p><img alt="" src="https://assets.zeczec.com/asset_461517_image_big.jpg?1650625757" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_449562_image_big.jpg?1648132236" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_452387_image_big.jpg?1648655635" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">OTUS 是一款視力訓練裝置，可以自動化和個性化進行「視覺治療訓練」過程，甚至適用於飛行員、士兵、運動員和其他需要良好視力使用的職業，它使每個人都可以隨時隨地訓練雙眼。</p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">而生活在現代社會，媒體和智慧手機的發展正在迅速損害我們的眼睛健康，導致視力下降。 青少年近視率的上升和受其影響的平均年齡比例的下降正在成為一個嚴重的問題。 老花眼更是也經常發生在年輕人中，但現代社會把視力衰退當成理所當然，忽視了這個問題。而 OTUS，讓你從這一刻開始輕鬆訓練視力！</p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_449565_image_big.jpg?1648132551" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"><img alt="" src="https://upload.cc/i1/2022/03/24/JtwI47.gif" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">OTUS不是一個普通的眼部按摩裝置，而是透過對眼部外層肌肉施加壓力，達到類似於身體其他部位肌肉一樣的訓練效果，讓你的眼部肌肉透過訓練保持健康，並緩解用眼疲勞與保持視力。​</p>');
			$(".note-editable").children().html('<h4 class="hide-child" style="line-height: 1.6em; font-weight: bold; color: rgb(16, 16, 16); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🤔&nbsp; 原來每天偏頭痛是因為睫狀肌過勞了！讓因為視網膜剝離動過眼睛手術的</span><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">表哥開箱OTUS 2看看！</span><br><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🙅‍♀️&nbsp;&nbsp;</span><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">別再單純按摩眼睛，用正確的方法放鬆睫狀肌、改善近視避免近視，達到訓練眼睛的效果～</span><a href="https://www.zeczec.com/projects/otus-2#h-%F0%9F%A4%94%C2%A0%E5%8E%9F%E4%BE%86%E6%AF%8F%E5%A4%A9%E5%81%8F%E9%A0%AD%E7%97%9B%E6%98%AF%E5%9B%A0%E7%82%BA%E7%9D%AB%E7%8B%80%E8%82%8C%E9%81%8E%E5%8B%9E%E4%BA%86%EF%BC%81%E8%AE%93%E5%9B%A0%E7%82%BA%E8%A6%96%E7%B6%B2%E8%86%9C%E5%89%9D%E9%9B%A2%E5%8B%95%E9%81%8E%E7%9C%BC%E7%9D%9B%E6%89%8B%E8%A1%93%E7%9A%84%E8%A1%A8%E5%93%A5%E9%96%8B%E7%AE%B1OTUS2%E7%9C%8B%E7%9C%8B%EF%BC%81%F0%9F%99%85%E2%80%8D%E2%99%80%EF%B8%8F%C2%A0%C2%A0%E5%88%A5%E5%86%8D%E5%96%AE%E7%B4%94%E6%8C%89%E6%91%A9%E7%9C%BC%E7%9D%9B%EF%BC%8C%E7%94%A8%E6%AD%A3%E7%A2%BA%E7%9A%84%E6%96%B9%E6%B3%95%E6%94%BE%E9%AC%86%E7%9D%AB%E7%8B%80%E8%82%8C%E3%80%81%E6%94%B9%E5%96%84%E8%BF%91%E8%A6%96%E9%81%BF%E5%85%8D%E8%BF%91%E8%A6%96%EF%BC%8C%E9%81%94%E5%88%B0%E8%A8%93%E7%B7%B4%E7%9C%BC%E7%9D%9B%E7%9A%84%E6%95%88%E6%9E%9C%EF%BD%9E" class="gray child f6 v-mid absolute left-0-ns nl3-ns" style="color: rgb(118, 118, 118); margin-left: -1rem; position: absolute; left: 0px; font-size: 0.875rem; vertical-align: middle; opacity: 0; transition: opacity 0.15s ease-in 0s;">#</a></h4><div class="mv2 iframe-wrapper aspect-ratio aspect-ratio--16x9" style="height: 0px; position: relative; padding-bottom: 387.219px; margin-top: 0.5rem; margin-bottom: 0.5rem; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px; transform: translateZ(0px);"><iframe allow="autoplay; encrypted-media" src="https://www.youtube.com/embed/L726uSd68l4" width="560" height="315" class="z-0 aspect-ratio--object" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="position: absolute; inset: 0px; width: 688.391px; height: 387.219px; z-index: 0; max-width: 100%; display: block; border-width: 0px; border-style: initial; margin-left: auto; margin-right: auto;"></iframe></div><blockquote style="position: relative; margin-top: 2rem; margin-bottom: 2rem; border-left-width: 1rem; border-left-color: rgb(244, 244, 244); padding-left: 2rem; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">常常工作或看電視看到偏頭痛或覺得眼壓高嗎？你可能也是睫狀肌過勞喔！ 身為一個因為視網膜剝離動過眼睛手術的人，真的告訴大家保養自己的眼睛很重要，現在台灣人10個人有9個是近視，其中一個是高度近視，而高度近視的定義事實上400度以上就算了，而400度以上就可能會視網膜剝離的問題。</span><br><br><span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">所以！適時的放鬆眼精真的很重要，不僅可以預防近視、改善近視、緩解近視情況，更可以避免很多近視或者睫狀疲勞肌產生的併發症！ 今天就讓表哥開箱OTUS 2 訓練眼鏡二代，讓我們一起不花時間、不影響生活的情況下達到眼睛訓練、視力訓練的效果吧！</span></blockquote><h4 class="hide-child" style="line-height: 1.6em; font-weight: bold; color: rgb(16, 16, 16); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><a name="h-%F0%9F%94%A5%C2%A0%E6%AD%A4%E5%A4%96%EF%BC%8C%E4%B8%89%E5%89%B5%E7%94%9F%E6%B4%BB%E5%9C%92%E5%8D%803%E6%A8%93%E8%A9%A6%E7%94%A8%E6%B4%BB%E5%8B%95%E5%95%9F%E5%8B%95%EF%BC%81%E6%9C%89%E4%BB%BB%E4%BD%95%E7%96%91%E6%85%AE%E7%9A%84%E4%B9%9F%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E5%85%88%E8%A9%A6%E7%94%A8%E5%94%B7%EF%BD%9E" class="nt6 absolute" style="color: rgb(0, 80, 162); margin-top: -8rem; position: absolute;"></a><span class="wysiwyg-color-blue" style="color: rgb(51, 102, 169);">🔥&nbsp;&nbsp;<span class="wysiwyg-color-red" style="color: rgb(196, 80, 89);">此外，三創生活園區3樓試用活動啟動！有任何疑慮的也可以直接先試用唷～<a href="https://www.zeczec.com/projects/otus-2#h-%F0%9F%94%A5%C2%A0%E6%AD%A4%E5%A4%96%EF%BC%8C%E4%B8%89%E5%89%B5%E7%94%9F%E6%B4%BB%E5%9C%92%E5%8D%803%E6%A8%93%E8%A9%A6%E7%94%A8%E6%B4%BB%E5%8B%95%E5%95%9F%E5%8B%95%EF%BC%81%E6%9C%89%E4%BB%BB%E4%BD%95%E7%96%91%E6%85%AE%E7%9A%84%E4%B9%9F%E5%8F%AF%E4%BB%A5%E7%9B%B4%E6%8E%A5%E5%85%88%E8%A9%A6%E7%94%A8%E5%94%B7%EF%BD%9E" class="gray child f6 v-mid absolute left-0-ns nl3-ns" style="color: rgb(118, 118, 118); margin-left: -1rem; position: absolute; left: 0px; font-size: 0.875rem; vertical-align: middle; opacity: 0; transition: opacity 0.15s ease-in 0s;">#</a></span></span></h4><p><img alt="" src="https://assets.zeczec.com/asset_461517_image_big.jpg?1650625757" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block; color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_449562_image_big.jpg?1648132236" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_452387_image_big.jpg?1648655635" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">OTUS 是一款視力訓練裝置，可以自動化和個性化進行「視覺治療訓練」過程，甚至適用於飛行員、士兵、運動員和其他需要良好視力使用的職業，它使每個人都可以隨時隨地訓練雙眼。</p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">而生活在現代社會，媒體和智慧手機的發展正在迅速損害我們的眼睛健康，導致視力下降。 青少年近視率的上升和受其影響的平均年齡比例的下降正在成為一個嚴重的問題。 老花眼更是也經常發生在年輕人中，但現代社會把視力衰退當成理所當然，忽視了這個問題。而 OTUS，讓你從這一刻開始輕鬆訓練視力！</p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;"><img alt="" src="https://assets.zeczec.com/asset_449565_image_big.jpg?1648132551" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"><img alt="" src="https://upload.cc/i1/2022/03/24/JtwI47.gif" style="border-style: none; max-width: 100%; width: 688.391px; height: auto; display: block;"></p><p style="color: rgb(63, 63, 63); font-family: Rubik, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, 微軟正黑體, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 15px;">OTUS不是一個普通的眼部按摩裝置，而是透過對眼部外層肌肉施加壓力，達到類似於身體其他部位肌肉一樣的訓練效果，讓你的眼部肌肉透過訓練保持健康，並緩解用眼疲勞與保持視力。​</p>');
 			$("#RaisePlan_Amount_1").attr("value",11480);
			$("#RaisePlan_Describe_1").html("限量早鳥 嘖嘖搶購價\nNT$11,480 | 市價NT$ 19,980，現省NT$ 8,500\n內含物：\n▶️ OTUS 本機\n▶️ 保固卡\n▶️ 臉部墊棉\n▶️ 拭淨布\n▶️ 收納袋\n▶️ 充電頭\n▶️ 充電線\n▶️ 使用說明書\n▶️ 綁帶\n 重要提醒\n - 台灣免運費，港澳運費+600");
			$("#RaisePlan_Amount_2").attr("value",10980);
			$("#RaisePlan_Describe_2").html("限時超早鳥 單入限時價\nNT$10,980 | 市價NT$ 19,980，現省NT$ 9,000\n內含物：\n▶️ OTUS 本機\n▶️ 保固卡\n▶️ 臉部墊棉	\n▶️ 拭淨布\n▶️ 收納袋\n▶️ 充電頭\n▶️ 充電線\n▶️ 使用說明書\n▶️ 綁帶\n重要提醒\n- 台灣免運費，港澳運費+600");
		}

		function submitByJson(){
			//check reqired
			var b_form = $('#form_raise')[0].reportValidity();
			var b_form1 = $('#form_raiseplan1')[0].reportValidity();
			var b_form2 = $('#form_raiseplan2')[0].reportValidity();
			
			var form_raise_obj = Object.fromEntries(new FormData(document.getElementById('form_raise')).entries());
			form_raise_obj.raisePicName="";
			form_raise_obj.raiseDescribe = $(".note-editable").children().html();
			var form_raiseplan1_obj = Object.fromEntries(new FormData(document.getElementById('form_raiseplan1')).entries());
			form_raiseplan1_obj.raisePlanPicName="";
			var form_raiseplan2_obj = Object.fromEntries(new FormData(document.getElementById('form_raiseplan2')).entries());
			form_raiseplan2_obj.raisePlanPicName="";
			
			var rpArray = [];
			rpArray.push(form_raiseplan1_obj);
			rpArray.push(form_raiseplan2_obj);
			form_raise_obj.raisePlanBeanSet=rpArray;
			var raiseArray_Json = JSON.stringify(form_raise_obj);
			var statusid = ${login.status.statusId};
			if(b_form && b_form1 && b_form2){
				$.ajax({
					type: "POST",
					url: "raise",
					data: raiseArray_Json,
					success: function(data){
						if(statusid > 7){
							location.href="/raiseindex.controller";
						}else{
							location.href ="/front_raiseindex.controller";
						}
					},
					  dataType: "json",
					  contentType : "application/json"
				});
			}
			
		}
		
		// 預覽圖片，將取得的files一個個取出丟到convertFile()
		function previewFiles(theImgs) {
			if (theImgs[0].files && theImgs[0].files.length >= 1) {
				$.map(theImgs[0].files, file => {
					convertFile(file)
						.then(data => {
						//console.log(data) // 把編碼後的字串輸出到console
						showPreviewImage(theImgs, data, file.name)
						})
						.catch(err => console.log(err))
						
				})
			}
		}
		
		// 使用FileReader讀取檔案，並且回傳Base64編碼後的source
		function convertFile(file) {
			return new Promise((resolve,reject)=>{
				// 建立FileReader物件
				let reader = new FileReader()
				// 註冊onload事件，取得result則resolve (會是一個Base64字串)
				reader.onload = () => { resolve(reader.result) }
				// 註冊onerror事件，若發生error則reject
				reader.onerror = () => { reject(reader.error) }
				// 讀取檔案
				reader.readAsDataURL(file)
			})
		}
		
		// 在頁面上新增<img>
		function showPreviewImage(theImgs, src, fileName) {
			let image = new Image(250) // 設定寬250px
			image.name = fileName
			image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
			theImgs.closest("div").next().append(image);
			theImgs.next().attr("value",src);
		}
		
		// 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
		$(".uploadImages").change(function(){
			$(this).closest("div").next().empty();
			previewFiles($(this)); // this即為<input>元素
		})
		
		/*拖曳功能留存，jQuery未增加跳脫字元
		// dragover事件：拖曳(滑鼠還沒鬆開)至放置區時，就要先防止瀏覽器進行開圖
		$("#dragArea").on("dragover", function(e) {
			e.preventDefault()
		})

		// 當拖曳區發生drop事件時，接受格式為image的資料
		$("#dragArea").on("drop", function(e){
			// 防止事件傳遞及預設事件發生
			e.stopPropagation()
			e.preventDefault()
			// 取得data type為image/*的資料
			e.originalEvent.dataTransfer.getData("image/*")
			let files = e.originalEvent.dataTransfer.files
			console.dir(files) // 看看File長什麼樣子
			$("#previewPicDiv").empty() // 清空當下預覽
			previewFiles(files)
		})
		*/
        
	</script>
</body>
</html>