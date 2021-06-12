<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/2
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
</head>
<%
    //获取到web端的绝对路径 映射到工程的web文件夹
    String path = request.getContextPath();
%>
<%--导入css样式--%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
      integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/templatemo-style.css" type="text/css">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>
<script src="../../JQuery/jquery-1.7.2.js"></script>
<body class="light-gray-bg">

<br>
<br>
<br>
<br>
<br>
<br>
<div class="templatemo-content-widget templatemo-login-widget white-bg">

    <header class="text-center">
        <%--<div class="square"></div>--%>
        <h1>网上教材征订系统</h1>
    </header>
    <form id="loginForm" class="templatemo-login-form">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>
                <input type="text" id="user" name="userName" class="form-control" placeholder="用户名">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>
                <input type="password" name="password" class="form-control" placeholder="密码">
            </div>
        </div>
<%--        <div class="form-group">
            <div class="checkbox squaredTwo">
                <input type="checkbox" id="c1" name="cc" />
                <label for="c1"><span></span>Remember me</label>
            </div>
        </div>--%>
        <div class="form-group">
            <button class="templatemo-blue-button width-100" onclick="login()">Login</button>
        </div>
    </form>

</div>
<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
    <p>Not a registered user yet? <strong><a href="<%=path%>/system/signup" class="blue-text">Sign up now!</a></strong></p>
</div>

<%--    <div class="container-fluid">
        <div class="col-md-4"></div>
        <div class="col-md-4"><h1 align="center">网上教材征订系统</h1></div>
        <div class="col-md-2"></div>
    </div>
    <br>

    <form id="loginForm" class="templatemo-login-form">
        <div class="container-fluid">
            <div class="form-group col-xs-12">
                <label for="user" class="control-label">用户名</label>
                <div>
                    <input type="email" class="form-control" id="user" name="userName"
                           placeholder="userName">
                </div>
            </div>
            <div class="form-group col-xs-12">
                <div>
                    <label for="pwd" class="control-label">密码</label>
                    <div>
                        <input type="password" class="form-control" id="pwd" name="password"
                               placeholder="Password">
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="container-fluid">
        <div align="center">
            <button class="btn bg-success" onclick="login()">登录</button>
            <button class="btn bg-primary" onclick="signup()">注册</button>
        </div>
    </div>--%>
</div>

</body>

<script type="text/javascript">

    function login() {
        // 1.成功登录
        // 2.密码错误
        // 3.用户名不存在
        $.ajax({
            url: "/system/checkUser",
            type: "post",
            data: $('[id = loginForm]').serialize(),
            success: function (obj) {
                if (obj === 7) {
                    alert("密码错误，请重新输入");
                    location.href = "<%=path%>/system/login";
                } else if (obj === 8) {
                    alert("该用户不存在，请重新输入");
                    location.href = "<%=path%>/system/login";
                } else if (obj === 9) {
                    alert("用户未审核通过，请联系管理员");
                } else {
                    switch (obj) {
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                            alert("登录成功");
                            location.href = "<%=path%>/system/router?role=" + obj + "&userName=" + $("#user").val();
                            break;
                        default:
                            alert("无此权限，请联系管理员");
                            break;
                    }
                    /*                    alert("登录成功");
                                        location.href = "

                    <%=path%>/system/router?role=" + obj + "&userName=" + user;*/
                }
            }
        })
    }

    function signup() {
        location.href = "<%=path%>/system/signup";
    }

</script>

</html>
