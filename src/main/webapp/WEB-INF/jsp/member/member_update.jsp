<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>後台管理-成員</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
                crossorigin="anonymous">
                </script>

            <!-- Site favicon -->
            <link rel="apple-touch-icon" sizes="180x180" href="/vendors/images/apple-touch-icon.png">
            <link rel="icon" type="image/png" sizes="32x32" href="/vendors/images/favicon-32x32.png">
            <link rel="icon" type="image/png" sizes="16x16" href="/vendors/images/favicon-16x16.png">

            <!-- Mobile Specific Metas -->
            <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">

            <!-- CSS -->
            <link rel="stylesheet" type="text/css" href="/vendors/styles/core.css">
            <link rel="stylesheet" type="text/css" href="/vendors/styles/icon-font.min.css">
            <link rel="stylesheet" type="text/css" href="/src/plugins/jquery-steps/jquery.steps.css">
            <link rel="stylesheet" type="text/css" href="/src/plugins/sweetalert2/sweetalert2.css">
            <link rel="stylesheet" type="text/css" href="/src/plugins/jquery-asColorPicker/dist/css/asColorPicker.css">
            <link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">
            <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
            <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/responsive.bootstrap4.min.css">

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
            <%@ include file="../header.jsp" %>
                <div class="main-container">
                    <div class="pd-ltr-20 xs-pd-20-10">
                        <div class="min-height-200px">
                            <div class="page-header">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="title">
                                            <h4>修改</h4>
                                        </div>
                                        <nav aria-label="breadcrumb" role="navigation">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item">
                                                    <a href="/admin">首頁</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">成員</li>
                                                <li class="breadcrumb-item">
                                                    <a href="/member/members">成員清單</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">${member.account}
                                                </li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                        <a class="btn btn-primary" href="/member/members.insert" role="button">新增</a>
                                    </div>
                                </div>
                            </div>

                            <div class="pd-20 card-box mb-30">
                                <div class="row">
                                    <div class="col">
                                        <div style="margin-bottom: 20px;">
                                            <h4 class="text-blue">詳細</h4>
                                        </div>
                                        <h5>詳細資料</h5><br>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>編號 :</label>
                                                <p style="margin-top: 14px;">
                                                    ${member.id}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>使用者名稱 :</label>
                                                <p style="margin-top: 14px;">
                                                    ${member.account}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>Email :</label>
                                                <p style="margin-top: 14px;">
                                                    ${member.email}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>手機 :</label>
                                                <p style="margin-top: 14px;">
                                                    ${member.phone}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 54px;">
                                            <div class="form-group">
                                                <label>權限 :</label>
                                                <p style="margin-top: 14px;">
                                                    ${member.status.statusName}</p>
                                            </div>
                                        </div>

                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>姓名 :</label>
                                                <c:choose>
                                                    <c:when test="${member.name != null}">
                                                        <p style="margin-top: 14px;">
                                                            ${member.name}</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="margin-top: 55px;">
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>性別 :</label>
                                                <c:choose>
                                                    <c:when test="${member.gender == 'male'}">
                                                        <p style="margin-top: 12px;">
                                                            男</p>
                                                    </c:when>
                                                    <c:when test="${member.gender == 'female'}">
                                                        <p style="margin-top: 12px;">
                                                            女</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="margin-top: 54px;">
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>生日 :</label>
                                                <c:choose>
                                                    <c:when test="${member.birthday != null}">
                                                        <p style="margin-top: 14px;">
                                                            ${member.birthday}</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="margin-top: 55px;">
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="margin-bottom: 30px;">
                                            <div class="form-group">
                                                <label>圖片 :</label>
                                                <c:choose>
                                                    <c:when test="${member.photo != null}">
                                                        <p style="margin-top: 12px;">
                                                            <img src="${member.photo}" style="width: 250px">
                                                        </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p style="margin-top: 55px;">
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <c:if test="${member.status.statusId < sessionScope.login.status.statusId}">
                                            <div style="margin-bottom: 20px;">
                                                <h4 class="text-blue">修改</h4>
                                            </div>
                                            <h5>基本資料</h5><br>
                                            <form action="/member/members.checkupdate" method="post">
                                                <input type="hidden" name="id" value="${member.id}">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>使用者名稱* :</label>
                                                        <input type="text" class="form-control" name="account"
                                                            value="${member.account}" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email* :</label>
                                                        <input type="email" class="form-control" name="email"
                                                            value="${member.email}" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>手機* :</label>
                                                        <input type="tel" class="form-control" name="phone"
                                                            value="${member.phone}" disabled>
                                                    </div>
                                                </div>
                                                <br>
                                                <!-- Step 2 -->
                                                <h5>額外資料(非必填)</h5><br>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>姓名 :</label>
                                                        <input type="text" class="form-control" name="name"
                                                            value="${member.name}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>性別 :</label><br>
                                                        <div class="btn-group btn-group-toggle" data-toggle="buttons"
                                                            style="margin-top: 2px;">
                                                            <c:choose>
                                                                <c:when test="${member.gender == 'male'}">
                                                                    <label class="btn btn-outline-secondary active">
                                                                        <input type="radio" name="gender" id="male"
                                                                            autocomplete="off" value="male" checked>
                                                                        男
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="gender" id="female"
                                                                            autocomplete="off" value="female">
                                                                        女
                                                                    </label>
                                                                </c:when>
                                                                <c:when test="${member.gender == 'female'}">
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="gender" id="male"
                                                                            autocomplete="off" value="male">
                                                                        男
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary active">
                                                                        <input type="radio" name="gender" id="female"
                                                                            autocomplete="off" value="female" checked>
                                                                        女
                                                                    </label>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="gender" id="male"
                                                                            autocomplete="off" value="male">
                                                                        男
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="gender" id="female"
                                                                            autocomplete="off" value="female">
                                                                        女
                                                                    </label>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>生日 :</label>
                                                        <input type="text" class="form-control date-picker"
                                                            placeholder="點此選擇日期" name="birthday"
                                                            value="${member.birthday}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>圖片 :</label><br>
                                                        <div style="margin-top: 2px;">
                                                            <input
                                                                class="photo form-control-file form-control height-auto"
                                                                type="file" name="photo" style="width: 250px">
                                                            <input class="photoBase64" type="hidden" name="photoBase64"
                                                                value="">
                                                        </div>
                                                        <div class="previewPhoto" style="margin-top: 10px;">
                                                            <img src="${member.photo}" style="width: 250px">
                                                        </div>
                                                        <img class="hideImg" src="${member.photo}"
                                                            style="display: none;">
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <label>權限 :</label><br>
                                                        <div class="btn-group btn-group-toggle" data-toggle="buttons"
                                                            style="margin-top: 2px;">
                                                            <c:choose>
                                                                <c:when test="${member.status.statusId == '8'}">
                                                                    <label class="btn btn-outline-secondary active">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="8,管理員" checked>
                                                                        管理員
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="1,設計師">
                                                                        設計師
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="0,一般會員">
                                                                        一般會員
                                                                    </label>
                                                                </c:when>
                                                                <c:when test="${member.status.statusId == '1'}">
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="8,管理員">
                                                                        管理員
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary active">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="1,設計師" checked>
                                                                        設計師
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="0,一般會員">
                                                                        一般會員
                                                                    </label>
                                                                </c:when>
                                                                <c:when test="${member.status.statusId == '0'}">
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="8,管理員">
                                                                        管理員
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="1,設計師">
                                                                        設計師
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary active">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="0,一般會員" checked>
                                                                        一般會員
                                                                    </label>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="8,管理員">
                                                                        管理員
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="1,設計師">
                                                                        設計師
                                                                    </label>
                                                                    <label class="btn btn-outline-secondary">
                                                                        <input type="radio" name="statusId"
                                                                            autocomplete="off" value="0,一般會員">
                                                                        一般會員
                                                                    </label>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-right">
                                                    <button class="btn btn-primary" type="submit">儲存</button>
                                                    <button class="btn btn-secondary" type="reset"
                                                        onclick="resetAll()">復原</button>
                                                </div>
                                            </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Responsive tables End -->
                    </div>
                </div>
                </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.6.0.js"
                    integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
                    </script>
                <!-- js -->
                <script src="/vendors/scripts/core.js"></script>
                <script src="/vendors/scripts/script.min.js"></script>
                <script src="/vendors/scripts/process.js"></script>
                <script src="/vendors/scripts/layout-settings.js"></script>
                <script src="/src/plugins/jquery-steps/jquery.steps.js"></script>
                <script src="/vendors/scripts/steps-setting.js"></script>
                <script src="/src/plugins/jquery-asColor/dist/jquery-asColor.js"></script>
                <script src="/src/plugins/jquery-asGradient/dist/jquery-asGradient.js"></script>
                <script src="/src/plugins/jquery-asColorPicker/jquery-asColorPicker.js"></script>
                <script src="/vendors/scripts/colorpicker.js"></script>
                <script src="/src/plugins/apexcharts/apexcharts.min.js"></script>
                <script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                <script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                <script src="/vendors/scripts/dashboard.js"></script>
                <!-- add sweet alert js & css in footer -->
                <script src="/src/plugins/sweetalert2/sweetalert2.all.js"></script>
                <script src="/src/plugins/sweetalert2/sweet-alert.init.js"></script>

                <script>
                    $("#select").attr("action", "/admin/search.members");

                    function resetAll() {
                        for (let i = 0; i < $(".previewPhoto").length; i++)
                            $(".previewPhoto").eq(i).children("img").attr("src", $(".previewPhoto").eq(i).next(".hideImg").attr("src"));
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