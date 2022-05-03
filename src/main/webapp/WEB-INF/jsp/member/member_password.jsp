<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>member_password</title>

        <style>

        </style>
    </head>

    <body>
        <%@ include file="../userheader.jsp" %>
            <div style="margin: 100px auto; width: 500px;">
                <div class="checkout_area">
                    <h1 style="margin-bottom: 50px;">更改密碼</h1>
                    <form action="/user/checkchange-password" method="post" onsubmit="return checkAll()">
                        <input type="hidden" name="account" value="${account}">
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label>現在的密碼 :</label>
                            <input id="oldpassword" type="password" class="form-control" name="oldpassword" required>
                        </div>
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label>新的密碼 :</label>
                            <input id="password" type="password" class="form-control" name="password" required>
                        </div>
                        <div class="form-group" style="margin-bottom: 50px;">
                            <label>密碼確認 :</label>
                            <input id="passwordCheck" type="password" class="form-control" name="passwordCheck"
                                required>
                        </div>
                        <div style="margin-bottom: 20px; text-align: center;">
                            <p class="passwordsp1" style="color: red;"></p>
                            <p class="passwordsp2" style="color: red;"></p>
                        </div>
                        <div style="text-align: center;">
                            <button class="btn btn-primary" type="submit">儲存</button>
                        </div>
                    </form>
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
                    let password = false;
                    $("#oldpassword").bind("input propertychange", checkPassword1);
                    $("#password").bind("input propertychange", checkPassword2);
                    $("#passwordCheck").bind("input propertychange", checkPassword3);
                    function checkPassword1() {
                        let oldVal = $(this).val();
                        let passwordVal = $(this).parent("div").next("div").children("#password").val();
                        if (oldVal != passwordVal) {
                            $(this).parent("div").next("div").next("div").next("div").children(".passwordsp1").html(``);
                            password = true;
                        } else {
                            $(this).parent("div").next("div").next("div").next("div").children(".passwordsp1").html(`現在的密碼與新的密碼相同，請重新輸入`);
                            password = false;
                        }
                    }

                    function checkPassword2() {
                        let oldVal = $(this).parent("div").prev("div").children("#oldpassword").val();
                        let passwordVal = $(this).val();
                        let checkVal = $(this).parent("div").next("div").children("#passwordCheck").val();
                        if (oldVal != passwordVal) {
                            $(this).parent("div").next("div").next("div").children(".passwordsp1").html(``);
                            password = true;
                        } else {
                            $(this).parent("div").next("div").next("div").children(".passwordsp1").html(`現在的密碼與新的密碼相同，請重新輸入`);
                            password = false;
                        }
                        if (checkVal == passwordVal) {
                            $(this).parent("div").next("div").next("div").children(".passwordsp2").html(``);
                            password = true;
                        } else {
                            $(this).parent("div").next("div").next("div").children(".passwordsp2").html(`新的密碼與密碼確認不同，請重新輸入`);
                            password = false;
                        }
                    }

                    function checkPassword3() {
                        let passwordVal = $(this).parent("div").prev("div").children("#password").val();
                        let checkVal = $(this).val();
                        if (checkVal == passwordVal) {
                            $(this).parent("div").next("div").children(".passwordsp2").html(``);
                            password = true;
                        } else {
                            $(this).parent("div").next("div").children(".passwordsp2").html(`新的密碼與密碼確認不同，請重新輸入`);
                            password = false;
                        }
                    }

                    function checkAll() {
                        return password;
                    }
                </script>
    </body>

    </html>