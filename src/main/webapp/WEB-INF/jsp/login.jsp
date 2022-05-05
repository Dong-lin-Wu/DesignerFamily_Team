<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8">
            <title>login</title>

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

        <body class="login-page">
            <div class="login-header box-shadow">
                <div class="container-fluid d-flex justify-content-between align-items-center">
                    <div class="brand-logo">
                        <a href="/login">
                            <img src="/assets/logob.png" alt="">
                        </a>
                    </div>
                    <div class="login-menu">
                        <ul>
                            <li><a href="/registerform" style="color:black">註冊</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6 col-lg-7">
                            <img src="/vendors/images/login-page-img.png" alt="">
                        </div>
                        <div class="col-md-6 col-lg-5">
                            <div class="login-box bg-white box-shadow border-radius-10">
                                <div class="login-title">
                                    <h2 class="text-center">登入Mega</h2>
                                </div>
                                <form action="/login" method="post">
                                    <div class="input-group custom">
                                        <input type="text" class="form-control form-control-lg" name="username"
                                            id="account" placeholder="電話號碼/使用者名稱/Email" required>
                                        <div class="input-group-append custom">
                                            <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
                                        </div>
                                    </div>
                                    <div class="input-group custom">
                                        <input type="password" class="form-control form-control-lg" name="password"
                                            id="password" placeholder="密碼" required>
                                        <div class="input-group-append custom">
                                            <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                        </div>
                                    </div>
                                    <div class="row pb-30">
                                        <div class="col-6">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1"
                                                    name="remember-me">
                                                <label class="custom-control-label" for="customCheck1">記住我</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="forgot-password"><a href="/forgot-password">忘記密碼</a></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="input-group mb-0">
                                                <!--
                                                        use code for form submit
                                                        <input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
                                                    -->
                                                <button class="btn btn-primary btn-lg btn-block"
                                                    type="submit">登入</button>
                                            </div>
                                            <div class="font-16 weight-600 pt-10 pb-10 text-center"
                                                data-color="#707373">Mega新朋友? <a href="/registerform" style="color:#d9ab48">註冊</a></div>
                                        </div>
                                    </div>
                                </form>
                                <div style="margin-top: 30px; text-align: center;">
                                    <button class="btn btn-secondary" type="button"
                                        onclick="oneClick()">一鍵輸入(管理員)</button>
                                    <button class="btn btn-secondary" type="button"
                                        onclick="twoClick()">一鍵輸入(一般會員)</button>
                                </div>
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
                function oneClick() {
                    $("input").eq(0).val("王薪豪");
                    $("input").eq(1).val("123456");
                }

                function twoClick() {
                    $("input").eq(0).val("吳東霖");
                    $("input").eq(1).val("123456");
                }
            </script>
        </body>

        </html>