<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">
<body>
<%@ include file="../userheader.jsp"%>
  <main>
    <!-- slider Area End-->
    <!--? Single Product Area Start-->
    <div class="product_image_area section-padding40">
      <div class="container">
        <div class="row s_product_inner">
          <div class="col-lg-5">
            <div class="product_slider_img">
              <div id="vertical">
                <div>
                  <img src="${comm.commImg}" class="w-100">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
              <h3>${comm.commTitle }</h3>
              <h2>NT$ ${comm.commPrice }</h2>
              <ul class="list">
                  <li>
                     <span>現有庫存: ${comm.commQuantity}</span>  
                  </li>
                   <li>
                     <span>設計師: ${comm.designer}</span>
                  </li>
                </ul>
                <p>
                  ${comm.commDES}
                </p>
                <div class="card_area">
                  <div class="product_count d-inline-block">
                    <span class="inumber-decrement down"> <i class="ti-minus min"></i></span>
                    <input class="input-number" type="text" name="qty" value="1" min="1" max="${comm.commQuantity}" id="value" readonly>
                    <span class="number-increment up"> <i class="ti-plus ad"></i></span>
                  </div>
                  <div class="add_to_cart">
                    <a href="/addtocart" class="btn add" id="${comm.commNo}">加入購物車</a>
                  </div>
                  <div class="social_icon">
                    <a href="#" class="fb"><i class="ti-facebook"></i></a>
                    <a href="#" class="tw"><i class="ti-twitter-alt"></i></a>
                    <a href="#" class="li" style="background-color:#FF4500"><i class="fab fa-instagram"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Single Product Area End-->
      <!--? Product Description Area Start-->
      <section class="product_description_area">
        <div class="container">
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
              aria-selected="true">設計理念</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
              aria-selected="false">產品規格</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
              aria-selected="false">問與答</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
              aria-selected="false">購買評價</a>
            </li>
          </ul>
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
              <p>
                Beryl Cook is one of Britain’s most talented and amusing artists
                .Beryl’s pictures feature women of all shapes and sizes enjoying
                themselves .Born between the two world wars, Beryl Cook eventually
                left Kendrick School in Reading at the age of 15, where she went
                to secretarial school and then into an insurance office. After
                moving to London and then Hampton, she eventually married her next
                door neighbour from Reading, John Cook. He was an officer in the
                Merchant Navy and after he left the sea in 1956, they bought a pub
                for a year before John took a job in Southern Rhodesia with a
                motor company. Beryl bought their young son a box of watercolours,
                and when showing him how to use it, she decided that she herself
                quite enjoyed painting. John subsequently bought her a child’s
                painting set for her birthday and it was with this that she
                produced her first significant work, a half-length portrait of a
                dark-skinned lady with a vacant expression and large drooping
                breasts. It was aptly named ‘Hangover’ by Beryl’s husband and
              </p>
              <p>
                It is often frustrating to attempt to plan meals that are designed
                for one. Despite this fact, we are seeing more and more recipe
                books and Internet websites that are dedicated to the act of
                cooking for one. Divorce and the death of spouses or grown
                children leaving for college are all reasons that someone
                accustomed to cooking for more than one would suddenly need to
                learn how to adjust all the cooking practices utilized before into
                a streamlined plan of cooking that is more efficient for one
                person creating less
              </p>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td>
                        <h5>Width</h5>
                      </td>
                      <td>
                        <h5>128mm</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Height</h5>
                      </td>
                      <td>
                        <h5>508mm</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Depth</h5>
                      </td>
                      <td>
                        <h5>85mm</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Weight</h5>
                      </td>
                      <td>
                        <h5>52gm</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Quality checking</h5>
                      </td>
                      <td>
                        <h5>yes</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Freshness Duration</h5>
                      </td>
                      <td>
                        <h5>03days</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>When packeting</h5>
                      </td>
                      <td>
                        <h5>Without touch of hand</h5>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Each Box contains</h5>
                      </td>
                      <td>
                        <h5>60pcs</h5>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
              <div class="row">
                <div class="col-lg-6">
                  <div class="comment_list">
                    <div class="review_item">
                      <div class="media">
                        <div class="d-flex">
                          <img src="/assets/img/gallery/review-1.png" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                    <div class="review_item reply">
                      <div class="media">
                        <div class="d-flex">
                          <img src="/assets/img/gallery/review-2.png" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                    <div class="review_item">
                      <div class="media">
                        <div class="d-flex">
                          <img src="/assets/img/gallery/review-3.png" alt="" />
                        </div>
                        <div class="media-body">
                          <h4>Blake Ruiz</h4>
                          <h5>12th Feb, 2017 at 05:56 pm</h5>
                          <a class="reply_btn" href="#">Reply</a>
                        </div>
                      </div>
                      <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna
                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                        ullamco laboris nisi ut aliquip ex ea commodo
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="review_box">
                    <h4>Post a comment</h4>
                    <form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
                    novalidate="novalidate">
                    <div class="col-md-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Full name" />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input type="text" class="form-control" id="number" name="number" placeholder="Phone Number" />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea class="form-control" name="message" id="message" rows="1"
                        placeholder="Message"></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-right">
                      <button type="submit" value="submit" class="btn">
                        Submit Now
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
            <div class="row">
              <div class="col-lg-6">
                <div class="row total_rate">
                  <div class="col-6">
                    <div class="box_total">
                      <h5>Overall</h5>
                      <h4>4.0</h4>
                      <h6>(03 Reviews)</h6>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="rating_list">
                      <h3>Based on 3 Reviews</h3>
                      <ul class="list">
                        <li>
                          <a href="#">5 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> 01</a>
                          </li>
                          <li>
                            <a href="#">4 Star
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i>
                              <i class="fa fa-star"></i> 01</a>
                            </li>
                            <li>
                              <a href="#">3 Star
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i> 01</a>
                              </li>
                              <li>
                                <a href="#">2 Star
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i> 01</a>
                                </li>
                                <li>
                                  <a href="#">1 Star
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i> 01</a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <div class="review_list">
                            <div class="review_item">
                              <div class="media">
                                <div class="d-flex">
                                  <img src="/assets/img/gallery/review-1.png" alt="" />
                                </div>
                                <div class="media-body">
                                  <h4>Blake Ruiz</h4>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                </div>
                              </div>
                              <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna
                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodo
                              </p>
                            </div>
                            <div class="review_item">
                              <div class="media">
                                <div class="d-flex">
                                  <img src="/assets/img/gallery/review-2.png" alt="" />
                                </div>
                                <div class="media-body">
                                  <h4>Blake Ruiz</h4>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                </div>
                              </div>
                              <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna
                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodo
                              </p>
                            </div>
                            <div class="review_item">
                              <div class="media">
                                <div class="d-flex">
                                  <img src="/assets/img/gallery/review-3.png" alt="" />
                                </div>
                                <div class="media-body">
                                  <h4>Blake Ruiz</h4>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                  <i class="fa fa-star"></i>
                                </div>
                              </div>
                              <p>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                sed do eiusmod tempor incididunt ut labore et dolore magna
                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodo
                              </p>
                            </div>
                          </div>
                        </div>
                        <div class="col-lg-6">
                          <div class="review_box">
                            <h4>Add a Review</h4>
                            <p>Your Rating:</p>
                            <ul class="list">
                              <li>
                                <a href="#">
                                  <i class="fa fa-star"></i>
                                </a>
                              </li>
                              <li>
                                <a href="#">
                                  <i class="fa fa-star"></i>
                                </a>
                              </li>
                              <li>
                                <a href="#">
                                  <i class="fa fa-star"></i>
                                </a>
                              </li>
                              <li>
                                <a href="#">
                                  <i class="fa fa-star"></i>
                                </a>
                              </li>
                              <li>
                                <a href="#">
                                  <i class="fa fa-star"></i>
                                </a>
                              </li>
                            </ul>
                            <p>Outstanding</p>
                            <form class="row contact_form" action="contact_process.php" method="post" novalidate="novalidate">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <input type="text" class="form-control" name="name" placeholder="Your Full name" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <input type="email" class="form-control" name="email" placeholder="Email Address" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <input type="text" class="form-control" name="number" placeholder="Phone Number" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <textarea class="form-control" name="message" rows="1" placeholder="Review"></textarea>
                                </div>
                              </div>
                              <div class="col-md-12 text-right">
                                <button type="submit" value="submit" class="btn">
                                  Submit Now
                                </button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
              </main>  
            <%@ include file="../userfooter.jsp"%>   
            <script>
            $('.add').on('click',function(e){
           	 
            	var id=$(this).attr("id");
            	console.log(id)
            	e.preventDefault();
            	var a = Number($("#qty").text());
            	console.log(a)
            	var b = Number(1);
            	a+=b
            	$("#qty").text(a)
            	
            	$.ajax({
            		type:'post',
            		url:'/order/mycart',
            		dataType:"json",
      	            data:{"qty":$("#value").val(), "id":$(this).attr("id"), "val":$("#qty").text(),       	   
      	            },      				           		
            	})
            	
            	Swal.fire({
                icon: 'success',
                title: '商品已加入購物車',
                showConfirmButton: false,
                timer: 1500
                 })
            })
            
            $('.min').on('click',function(){
            
            	var a =$('#value').val();
            	var b = Number(1)
            	console.log(a)
            	if(a>=2){
            	 $('#value').val(a-=b)
            	}else{
            		$('#value').val(1)
            	}
            	
            })
            
            $('.ad').on('click',function(){
            	var a =Number($('#value').val());
            	console.log(a)
            	var b = 1
            	b=b+a
            	var max=Number($('#value').attr("max"));
            	if(a<max){
            	$('#value').val(b);  		
            	}else{
            		$('#value').val(max); 
            	}
            })
            
 </script>
</body>
</html>