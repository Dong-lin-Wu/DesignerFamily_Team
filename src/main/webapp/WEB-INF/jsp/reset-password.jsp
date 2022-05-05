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
                        <img src="/assets/logob.png" alt="">
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
                            <form action="/checkreset-password" method="post" onsubmit="return checkAll()">
                                <input type="hidden" name="account" value="${account}">
                                <div class="input-group custom">
                                    <input id="password" type="password" class="form-control form-control-lg"
                                        name="password" placeholder="密碼" required>
                                    <div class="input-group-append custom">
                                        <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                    </div>
                                </div>
                                <div class="input-group custom">
                                    <input id="passwordCheck" type="password" class="form-control form-control-lg"
                                        name="passwordCheck" placeholder="密碼確認" required>
                                    <div class="input-group-append custom">
                                        <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                    </div>
                                </div>
                                <div style="margin-bottom: 20px; text-align: center;">
                                    <span class="passwordsp" style="color: red;"></span>
                                </div>
                                <div class="row align-items-center">
                                    <div class="col-5" style="margin: auto;">
                                        <div class="input-group mb-0">
                                            <!--
                                                use code for form submit
                                                <input class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
                                            -->
                                            <button class="btn btn-primary btn-lg btn-block" type="submit">送出</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
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

        <script>
            let password = false;
            $("#password").bind("input propertychange", checkPassword1);
            $("#passwordCheck").bind("input propertychange", checkPassword2);
            function checkPassword1() {
                let passwordVal = $(this).val();
                let checkVal = $(this).parent("div").next("div").children("#passwordCheck").val();
                if (checkVal == passwordVal) {
                    $(this).parent("div").next("div").next("div").children(".passwordsp").html(``);
                    password = true;
                } else {
                    $(this).parent("div").next("div").next("div").children(".passwordsp").html(`兩次密碼輸入不同，請重新輸入`);
                    password = false;
                }
            }

            function checkPassword2() {
                let checkVal = $(this).val();
                let passwordVal = $(this).parent("div").prev("div").children("#password").val();
                if (checkVal == passwordVal) {
                    $(this).parent("div").next("div").children(".passwordsp").html(``);
                    password = true;
                } else {
                    $(this).parent("div").next("div").children(".passwordsp").html(`兩次密碼輸入不同，請重新輸入`);
                    password = false;
                }
            }

            function checkAll() {
                return password;
            }
        </script>
    </body>

    </html>