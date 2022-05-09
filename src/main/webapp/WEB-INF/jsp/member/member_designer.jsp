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
                                            <h4>成員</h4>
                                        </div>
                                        <nav aria-label="breadcrumb" role="navigation">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item">
                                                    <a href="/admin">首頁</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">成員</li>
                                                <li class="breadcrumb-item">
                                                    <a href="/member/designers">設計師清單</a>
                                                </li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="col-md-6 col-sm-12 text-right">
                                        <a class="btn btn-primary" href="/member/members.insert" role="button">新增</a>
                                    </div>
                                </div>
                            </div>

                            <!-- Simple Datatable start -->
                            <div class="card-box mb-30">
                                <div class="pd-20">
                                    <h4 class="text-blue h4">設計師清單</h4>
                                </div>
                                <div class="pb-20">
                                    <table class="table hover stripe data-table-export nowrap">
                                        <thead>
                                            <tr>
                                                <th class="table-plus">編號</th>
                                                <th>使用者名稱</th>
                                                <th>Email</th>
                                                <th>手機</th>
                                                <th>權限</th>
                                                <th class="datatable-nosort">功能</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="member" items="${members}">
                                                <tr>
                                                    <td class="table-plus">${member.id}</td>
                                                    <td>${member.account}</td>
                                                    <td>${member.email}</td>
                                                    <td>${member.phone}</td>
                                                    <td>${member.status.statusName}</td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                                                href="#" role="button" data-toggle="dropdown">
                                                                <i class="dw dw-more"></i>
                                                            </a>
                                                            <div
                                                                class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                                                                <a class="dropdown-item"
                                                                    href="/member/members.update/${member.id}"><i
                                                                        class="dw dw-eye"></i>
                                                                    詳細</a>
                                                                <c:if
                                                                    test="${member.status.statusId < sessionScope.login.status.statusId}">
                                                                    <a class="dropdown-item"
                                                                        href="/member/members.update/${member.id}"><i
                                                                            class="dw dw-edit2"></i> 修改</a>
                                                                    <button type="button" class="dropdown-item deldesigner"
                                                                        id="sa-warning"><i class="dw dw-delete-3"></i>
                                                                        取消設計師資格</button>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- Simple Datatable End -->
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
                <script src="/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
                <script src="/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
                <script src="/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
                <script src="/vendors/scripts/dashboard.js"></script>
                <!-- buttons for Export datatable -->
                <script src="/src/plugins/datatables/js/dataTables.buttons.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.bootstrap4.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.print.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.html5.min.js"></script>
                <script src="/src/plugins/datatables/js/buttons.flash.min.js"></script>
                <script src="/src/plugins/datatables/js/pdfmake.min.js"></script>
                <script src="/src/plugins/datatables/js/vfs_fonts.js"></script>
                <!-- Datatable Setting js -->
                <script src="/vendors/scripts/datatable-setting.js"></script>
                <!-- add sweet alert js & css in footer -->
                <script src="/src/plugins/sweetalert2/sweetalert2.all.js"></script>
                <script src="/src/plugins/sweetalert2/sweet-alert.init.js"></script>

                <script>
                    $("#select").attr("action", "/admin/search.members");
                </script>
        </body>

        </html>