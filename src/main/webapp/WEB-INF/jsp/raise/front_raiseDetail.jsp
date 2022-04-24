<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
    
      
    $.ajax({
      type:'get',
      url:'/raise/${raiseNo}',
      success: function(data){
        console.log(data.raiseTitle);
        
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
            <div id="result" style="width:1200px"></div>
          </div>
        </div>
      </div>
    </section>
  </main>
  
    <%@ include file="../userfooter.jsp"%>
  </body>
  </html>