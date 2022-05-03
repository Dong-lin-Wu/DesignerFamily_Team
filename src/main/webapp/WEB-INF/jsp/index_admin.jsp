<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>index_admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
        <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="/src/plugins/datatables/css/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="/vendors/styles/style.css">

        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'UA-119386393-1');
        </script>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <style>

        </style>
    </head>

    <body>
        <%@ include file="header.jsp" %>
            <div class="main-container">
                <div class="pd-ltr-20">
                    <div class="card-box pd-20 height-100-p mb-30">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <img src="vendors/images/banner-img.png" alt="">
                            </div>
                            <div class="col-md-8">
                                <h4 class="font-20 weight-500 mb-10 text-capitalize">
                                    歡迎回來 <div class="weight-600 font-30 text-blue">${sessionScope.login.account}</div>
                                </h4>
                                <p class="font-18 max-width-600">
                                    您的權限是
                                    ${sessionScope.login.status.statusName}，點選左方導覽列可以對成員、商品、訂單、活動、討論區與募資進行增刪查改，或是在下方選擇功能以顯示統計圖表。
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="page-header">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <div class="title">
                                    <h4>首頁</h4>
                                </div>
                                <nav aria-label="breadcrumb" role="navigation">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item active" aria-current="page">首頁</li>
                                    </ol>
                                </nav>
                            </div>
                            <div class="col-md-6 col-sm-12 text-right">
                                <div class="dropdown">
                                    <a class="btn btn-primary dropdown-toggle" href="/admin" role="button"
                                        data-toggle="dropdown">
                                        成員
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">商品</a>
                                        <a class="dropdown-item" href="#">訂單</a>
                                        <a class="dropdown-item" href="#">活動</a>
                                        <a class="dropdown-item" href="#">討論區</a>
                                        <a class="dropdown-item" href="#">募資</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-6 mb-30">
                            <div class="card-box height-80-p pd-20">
                                <h4 class="h4 mb-20">流量</h4>
                                <div id="chart5"></div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-30">
                            <div class="card-box height-80-p pd-20">
                                <h4 class="h4 mb-20">性別</h4>
                                <div id="donutchart" style="width: 450px; height: 350px; margin-left: 80px;"></div>
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
            <script src="/src/plugins/apexcharts/apexcharts.min.js"></script>
            <script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
            <script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
            <script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
            <script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
            <script src="/vendors/scripts/dashboard.js"></script>

            <script>
                $("#select").attr("action", "/admin/search");

                google.charts.load("current", { packages: ["corechart"] });
                google.charts.setOnLoadCallback(drawChart);
                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Task', '成員數'],
                        ['男', 64],
                        ['女', 159],
                        ['未填寫', 182]
                    ]);

                    var options = {
                        pieHole: 0.4,
                        chartArea: { width: 400, height: 300 }
                    };

                    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                    chart.draw(data, options);
                }
            </script>
    </body>

    </html>