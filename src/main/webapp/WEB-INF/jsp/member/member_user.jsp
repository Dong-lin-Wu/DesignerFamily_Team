<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>Mega|會員中心</title>

            <!-- Site favicon -->
            <link rel="shortcut icon" type="image/x-icon" href="/assets/img/logo/logo2.png">

            <!-- Mobile Specific Metas -->
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">

            <!-- CSS -->
            <link rel="stylesheet" type="text/css" href="/vendors/styles/core.css">
            <link rel="stylesheet" type="text/css" href="/vendors/styles/icon-font.min.css">
            <link rel="stylesheet" type="text/css" href="src/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">
            <link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">

            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() { dataLayer.push(arguments); }
                gtag('js', new Date());

                gtag('config', 'UA-119386393-1');
            </script>
            <style>

            </style>
        </head>

        <body>
            <%@ include file="../userheader.jsp" %>
                <div class="pd-ltr-20 xs-pd-20-10">
                    <div style="margin: 50px 100px;">
                        <div class="row clearfix">
                            <div class="col-md-12 mb-30">
                                <div class="pd-20">
                                    <div class="tab">
                                        <div class="row clearfix">
                                            <div class="col-md-3 col-sm-12 order_box">
                                                <h2 class="mb-20" style="margin: 0px 12px 25px 12px;font-size:24px">
                                                    ${sessionScope.login.account}</h2>
                                                <ul class="nav flex-column" role="tablist">
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link active" data-toggle="tab" href="#member"
                                                            role="tab" aria-selected="true"
                                                            style="color: black;">我的帳戶</a>
                                                    </li>
                                                    <c:if test="${sessionScope.login.status.statusId == '1' || sessionScope.login.status.statusId == '9'}">
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#product" role="tab"
                                                            aria-selected="false" style="color: black;">我的商品</a>
                                                    </li>
                                                    </c:if>
                                                    
                                                    <c:if test="${sessionScope.login.status.statusId == '1'}">
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#shiporder" role="tab"
                                                            aria-selected="false" style="color: black;">出貨訂單</a>
                                                    </li>
                                                    </c:if>
                                                    
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#order" role="tab"
                                                            aria-selected="false" style="color: black;">我的訂單</a>
                                                    </li>
                                                    
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#coupon" role="tab"
                                                            aria-selected="false" style="color: black;">我的優惠券</a>
                                                    </li>
                                                  
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#forum" role="tab"
                                                            aria-selected="false" style="color: black;">我的討論區</a>
                                                    </li>
                                                    <li class="nav-item" style="margin-bottom: 15px;font-size:20px">
                                                        <a class="nav-link" data-toggle="tab" href="#raise" role="tab"
                                                            aria-selected="false" style="color: black;">我的募資</a>
                                                    </li>
                                                    <c:choose>
                                                        <c:when
                                                            test="${sessionScope.login.status.statusId == '9' || sessionScope.login.status.statusId == '8'}">
                                                            <li class="nav-item" style="margin-top: 50px;font-size:20px">
                                                                <a class="nav-link" href="/admin"
                                                                    style="color: black;">管理中心</a>
                                                            </li>
                                                        </c:when>
                                                        <c:when test="${sessionScope.login.status.statusId == '0'}">
                                                            <li class="nav-item" style="margin-top: 50px;font-size:20px">
                                                                <a class="nav-link" data-toggle="tab" href="#apply"
                                                                    role="tab" aria-selected="false"
                                                                    style="color: black;">申請成為設計師</a>
                                                            </li>
                                                        </c:when>
                                                        <c:otherwise>

                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </div>

                                            <div class="col-md-9 col-sm-12">
                                                <div class="tab-content checkout_area">
                                                    <div class="tab-pane fade show active" id="member" role="tabpanel">
                                                        <div class="pd-20">
                                                            <h1 style="margin-bottom: 20px;">我的帳戶</h1>
                                                            <form class="contact_form" action="/user/user.update"
                                                                method="post" onsubmit="return checkAll()">
                                                                <input type="hidden" name="id" value="${member.id}">
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">使用者名稱* :</label>
                                                                    <input type="text" class="form-control"
                                                                        name="account" value="${member.account}"
                                                                        required style="font-size:20px">
                                                                </div>
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">Email* :</label>
                                                                    <input id="email" type="email" class="form-control"
                                                                        name="email" value="${member.email}" required style="font-size:20px">
                                                                    <span class="emailsp" style="color: red;"></span>
                                                                </div>
                                                                <div class="col-md-6 form-group"
                                                                    style="margin-bottom: 50px;">
                                                                    <label style="font-size:20px">手機* :</label>
                                                                    <input id="phone" type="tel" class="form-control"
                                                                        name="phone" value="${member.phone}" required style="font-size:20px">
                                                                    <span class="phonesp" style="color: red;"></span>
                                                                </div>
                                                                <input type="hidden" name="statusId"
                                                                    value="${member.status.statusId}">
                                                                <input type="hidden" name="statusName"
                                                                    value="${member.status.statusName}">
                                                                <!-- Step 2 -->
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">姓名 :</label>
                                                                    <input type="text" class="form-control" name="name"
                                                                        value="${member.name}" style="font-size:20px">
                                                                </div>
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">性別 :</label><br>
                                                                    <div class="btn-group btn-group-toggle"
                                                                        data-toggle="buttons" style="margin-top: 2px;">
                                                                        <c:choose>
                                                                            <c:when test="${member.gender == 'male'}">
                                                                                <label
                                                                                    class="btn btn-outline-secondary active">
                                                                                    <input type="radio" name="gender"
                                                                                        id="male" autocomplete="off"
                                                                                        value="male" checked>
                                                                                    男
                                                                                </label>
                                                                                <label
                                                                                    class="btn btn-outline-secondary">
                                                                                    <input type="radio" name="gender"
                                                                                        id="female" autocomplete="off"
                                                                                        value="female">
                                                                                    女
                                                                                </label>
                                                                            </c:when>
                                                                            <c:when test="${member.gender == 'female'}">
                                                                                <label
                                                                                    class="btn btn-outline-secondary">
                                                                                    <input type="radio" name="gender"
                                                                                        id="male" autocomplete="off"
                                                                                        value="male">
                                                                                    男
                                                                                </label>
                                                                                <label
                                                                                    class="btn btn-outline-secondary active">
                                                                                    <input type="radio" name="gender"
                                                                                        id="female" autocomplete="off"
                                                                                        value="female" checked>
                                                                                    女
                                                                                </label>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <label
                                                                                    class="btn btn-outline-secondary">
                                                                                    <input type="radio" name="gender"
                                                                                        id="male" autocomplete="off"
                                                                                        value="male">
                                                                                    男
                                                                                </label>
                                                                                <label
                                                                                    class="btn btn-outline-secondary">
                                                                                    <input type="radio" name="gender"
                                                                                        id="female" autocomplete="off"
                                                                                        value="female">
                                                                                    女
                                                                                </label>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">生日 :</label>
                                                                    <input type="text" class="form-control date-picker"
                                                                        placeholder="點此選擇日期" name="birthday"
                                                                        value="${member.birthday}" style="font-size:20px">
                                                                </div>
                                                                <div class="col-md-6 form-group">
                                                                    <label style="font-size:20px">圖片 :</label><br>
                                                                    <div style="margin-top: 4px;">
                                                                        <input
                                                                            class="photo form-control-file height-auto"
                                                                            type="file" name="photo"
                                                                            style="width: 250px" >
                                                                        <input class="photoBase64" type="hidden"
                                                                            name="photoBase64" value="" >
                                                                    </div>
                                                                    <div class="previewPhoto" style="margin-top: 10px;">
                                                                        <img src="${member.photo}" style="width: 250px">
                                                                    </div>
                                                                    <img class="hideImg" src="${member.photo}"
                                                                        style="display: none;">
                                                                </div>
                                                                <div class="text-right">
                                                                    <button class="btn btn-primary"
                                                                        type="submit">儲存</button>
                                                                    <button class="btn btn-secondary" type="reset"
                                                                        onclick="resetAll()">復原</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="product" role="tabpanel">
                                                        <div class="pd-20">
                                                            <%@ include file="../product/userproduct.jsp" %>
                                                        </div>
                                                    </div>
                                                                                     
                                                    <div class="tab-pane fade" id="shiporder" role="tabpanel">
                                                        <div class="pd-20">
                                                             <%@ include file="../order/ordershipping.jsp" %>
                                                        </div>
                                                    </div>

                                                    <div class="tab-pane fade" id="order" role="tabpanel">
                                                        <div class="pd-20">
                                                            <%@ include file="../order/foruser.jsp" %>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="tab-pane fade" id="coupon" role="tabpanel">
                                                        <div class="pd-20">
                                                            <%@ include file="../news/mycoupon.jsp" %>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="tab-pane fade" id="forum" role="tabpanel">
                                                        <div class="pd-20">
                                                         <%@ include file="../forum/userMyForum.jsp" %>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="raise" role="tabpanel">
                                                        <div class="pd-20">
                                                            <%@ include file="../raise/front_myRaise.jsp" %>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="apply" role="tabpanel">
                                                        <div class="pd-20">
                                                            <h1 style="margin-bottom: 20px;">確定申請成為設計師？</h1>
                                                            <div>
                                                                <a class="btn btn-primary" href="/user/apply.designer">確定</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="../userfooter.jsp" %>

                    <!-- js -->
                    <script src="/vendors/scripts/core.js"></script>
                    <script src="/vendors/scripts/script.min.js"></script>
                    <script src="/vendors/scripts/process.js"></script>
                    <script src="/vendors/scripts/layout-settings.js"></script>
                    <script src="src/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
                    <script src="src/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
                    <script src="src/plugins/jquery-asColorPicker/jquery-asColorPicker.js"></script>
                    <script src="vendors/scripts/colorpicker.js"></script>

                    <script>
                        let email = true, phone = true;
                        $("#email").bind("input propertychange", checkEmail);
                        $("#phone").bind("input propertychange", checkPhone);
                        function checkEmail() {
                            let emailVal = $(this).val();
                            let reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                            if (reg.test(emailVal)) {
                                $(this).next(".emailsp").html(``);
                                email = true;
                            } else {
                                $(this).next(".emailsp").html(`格式錯誤`);
                                email = false;
                            }
                        }

                        function checkPhone() {
                            let phoneVal = $(this).val();
                            let reg = /^09\d{8}$/;
                            if (reg.test(phoneVal)) {
                                $(this).next(".phonesp").html(``);
                                phone = true;
                            } else {
                                $(this).next(".phonesp").html(`格式錯誤`);
                                phone = false;
                            }
                        }

                        function checkAll() {
                            return email && phone;
                        }

                        function resetAll() {
                            email = true;
                            phone = true;
                            $(".emailsp").html(``);
                            $(".phonesp").html(``);
                            $(".previewPhoto").children("img").attr("src", $(".previewPhoto").next(".hideImg").attr("src"));
                        }

                        // 當上傳檔案改變時清除目前預覽圖，並且呼叫previewFiles()
                        $(".photo").change(function () {
                            $(this).parent("div").next("div").empty() // 清空當下預覽
                            previewFiles.call(this, this.files) // this即為<input>元素
                        });

                        // 預覽圖片，將取得的files一個個取出丟到convertFile()
                        function previewFiles(files) {
                            if (files && files.length >= 1) {
                                $.map(files, file => {
                                    convertFile(file)
                                        .then(data => {
                                            //console.log(data) // 把編碼後的字串輸出到console
                                            showPreviewImage.call(this, data, file.name)
                                        })
                                        .catch(err => console.log(err))
                                })
                            }
                        }

                        // 使用FileReader讀取檔案，並且回傳Base64編碼後的source
                        function convertFile(file) {
                            return new Promise((resolve, reject) => {
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
                        function showPreviewImage(src, fileName) {
                            let image = new Image(250) // 設定寬250px
                            image.name = fileName
                            image.src = src // <img>中src屬性除了接url外也可以直接接Base64字串
                            $(this).parent("div").next("div").append(image);
                            $(this).next(".photoBase64").attr("value", `\${src}`);
                        }
                    </script>
        </body>

        </html>