<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>forgot-password</title>

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
        <div class="login-header box-shadow">
            <div class="container-fluid d-flex justify-content-between align-items-center">
                <div class="brand-logo">
                    <a href="/login">
                        <img src="/vendors/images/deskapp-logo.svg" alt="">
                    </a>
                </div>
                <div class="login-menu">
                    <ul>
                        <li><a href="/login">登入</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <img src="/vendors/images/forgot-password.png" alt="">
                    </div>
                    <div class="col-md-6">
                        <div class="login-box bg-white box-shadow border-radius-10">
                            <div class="login-title">
                                <h2 class="text-center text-primary">重新設定密碼</h2>
                            </div>
                            <form action="/checkforgot-password" method="post" onsubmit="return checkAll()">
                                <div class="input-group custom">
                                    <input id="email" type="text" class="form-control form-control-lg" name="email"
                                        placeholder="Email" required>
                                    <div class="input-group-append custom">
                                        <span class="input-group-text"><i class="fa fa-envelope-o"
                                                aria-hidden="true"></i></span>
                                    </div>
                                </div>
                                <div style="margin-bottom: 20px; text-align: center;">
                                    <span class="emailsp" style="color: red;"></span>
                                </div>
                                <div class="row align-items-center">
                                    <div class="col-5">
                                        <div class="input-group mb-0">
                                            <!--
                                                use code for form submit
                                                <input class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
                                            -->
                                            <button class="btn btn-primary btn-lg btn-block" type="submit">送出</button>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="font-16 weight-600 text-center" data-color="#707373">或</div>
                                    </div>
                                    <div class="col-5">
                                        <div class="input-group mb-0">
                                            <a class="btn btn-outline-primary btn-lg btn-block" href="/login">登入</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div style="margin-top: 10px;">
                                <em style="color:red">${error}</em>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- js -->
        <script src="/vendors/scripts/core.js"></script>
        <script src="/vendors/scripts/script.min.js"></script>
        <script src="/vendors/scripts/process.js"></script>
        <script src="/vendors/scripts/layout-settings.js"></script>

        <script>
            let email = false;
            $("#email").bind("input propertychange", checkEmail);
            function checkEmail() {
                let emailVal = $(this).val();
                let reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
                if (reg.test(emailVal)) {
                    $(this).parent().next("div").children(".emailsp").html(``);
                    email = true;
                } else {
                    $(this).parent().next("div").children(".emailsp").html(`格式錯誤`);
                    email = false;
                }
            }

            function checkAll() {
                return email;
            }
        </script>
    </body>

    </html>