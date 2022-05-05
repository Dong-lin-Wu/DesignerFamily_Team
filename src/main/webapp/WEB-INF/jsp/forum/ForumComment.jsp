<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                    crossorigin="anonymous"></script>
                <title>raise_admin</title>

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
                                                <h4>評論區</h4>
                                            </div>
                                            <nav aria-label="breadcrumb" role="navigation">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item">
                                                        <a href="/admin">首頁</a>
                                                    </li>
                                                    <li class="breadcrumb-item">
                                                        <a href="/forum/forum_backend.controller">討論區</a>
                                                    </li>
                                                    <li class="breadcrumb-item active" aria-current="page">評論區</li>
                                                </ol>
                                            </nav>
                                        </div>

                                    </div>
                                </div>

                                <!-- Simple Datatable start -->
                                <div class="card-box mb-30">
                                    <div class="pd-20">
                                        <h4 class="text-blue h4">評論</h4>
                                    </div>
                                    <div class="pb-20">
                                        <table class="table hover stripe data-table-export nowrap">
                                            <thead>
                                                <tr>
                                                    <th >編號</th>
                                                    <th>內容</th>
                                                    <th>建立時間</th>
                                                    <th>更新時間</th>
                                                    <th>帳號</th>
                                                    <th>討論編號</th>
                                                    <th class="datatable-nosort">功能</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% int count=0 ;%>
                                                    <c:forEach var="cl" items="${fBean.commentBean}">
                                                        <!-- ${fBean.commentBean}是一個set -->
                                                        <tr>
                                                            <td >${cl.getCommentId()}</td>
                                                            <td>${cl.getCommentDescription()}</td>
                                                            <td>${cl.getCommentCreatetime().substring(0, 16)}</td>
                                                            <td>${cl.getCommentUpdatetime().substring(0, 16)}</td>
                                                            <td>${cl.getCommentAccount()}</td>
                                                            <td>${cl.forumBean.forumid}</td>
                                                            <td>
                                                                <div class="dropdown">
                                                                    <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
                                                                        href="#" role="button" data-toggle="dropdown">
                                                                        <i class="dw dw-more"></i>
                                                                    </a>
                                                                    <div
                                                                        class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">

                                                                        
                                                                        <button type="button"
                                                                            class="dropdown-item delcomm"
                                                                            id="sa-warning"><i
                                                                                class="dw dw-delete-3"></i>
                                                                            刪除</button>

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
                    <!-- js -->
                    <script src="https://code.jquery.com/jquery-3.6.0.js"
                        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
                        crossorigin="anonymous"></script>
                    <script src="/src/plugins/apexcharts/apexcharts.min.js"></script>
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
                        //$("#select").attr("action", "raiseindexsearch.controller");
                        //Warning Message
                        $('.delcomm').click(function () {
                            console.log("delraise out!!");
                            let id = $(this).parent().parent().parent().parent().children(".table-plus").text();

                            swal({
                                title: '確定刪除?',
                                text: "資料刪除後將無法復原!",
                                type: 'warning',
                                showCancelButton: true,
                                confirmButtonClass: 'btn btn-success',
                                cancelButtonClass: 'btn btn-danger',
                                confirmButtonText: '確定',
                                cancelButtonText: '取消'
                            }).then((result) => {
                                if (result.dismiss !== 'cancel') {
                                    $.ajax({
                                        type: 'post',
                                        url: '/forum/forum_backend_delete_comment.controller/'
                                    });

                                    swal({
                                        title: '已刪除!',
                                        type: 'success',
                                        confirmButtonText: '確定'
                                    }).then(() => {
                                        window.location.href = 'forum_backend.controller';
                                    })
                                }
                            })

                        });

                    </script>

            </body>

            </html>