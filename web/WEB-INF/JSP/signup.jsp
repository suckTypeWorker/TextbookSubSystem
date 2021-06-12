<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/4
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
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

<%--导入js控件--%>
<script src="../../JQuery/jquery-1.7.2.js"></script>

<body class="light-gray-bg">
<%--
     private Integer userId;
    private String userName;
    private String password;
    private String serialId;
    private Integer userType;
    private String userDept;
    private String userPhone;
--%>

<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>注册</h1>
    </header>
    <form id="signFrom" class="templatemo-login-form">

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>
                <input type="text" name="userName" class="form-control" placeholder="用户名">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>
                <input type="password" name="password" class="form-control" placeholder="密码">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-file-text-o fa-fw"></i></div>
                <input type="text" name="serialId" class="form-control" placeholder="工号">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-coffee fa-fw"></i></div>
                <input type="password" name="userDept" class="form-control" placeholder="院系">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fa fa-phone fa-fw"></i></div>
                <input type="password" name="userPhone" class="form-control" placeholder="电话">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">职<br>务</div>
                <label>
                    <input type="radio" name="userType" id="type1" value="2" class="a-radio">
                    <span class="b-radio"></span>
                    <span style="font-weight: normal;font-size: medium">教材科</span>
                </label>

                <label>
                    <input type="radio" name="userType" id="type2" value="3" class="a-radio">
                    <span class="b-radio"></span>
                    <span style="font-weight: normal;font-size: medium">系主任</span>
                </label>
                <br>
                <label>
                    <input type="radio" name="userType" id="type3" value="4" class="a-radio">
                    <span class="b-radio"></span>
                    <span style="font-weight: normal;font-size: medium">教学秘书</span>
                </label>

                <label>
                    <input type="radio" name="userType" id="type4" value="5" class="a-radio">
                    <span class="b-radio"></span>
                    <span style="font-weight: normal;font-size: medium">授课教师</span>
                </label>
            </div>
        </div>

        <div class="form-group">
            <button class="templatemo-blue-button width-100" onclick="insert()">SignUp</button>
        </div>
    </form>
</div>

</body>
<script>

    function insert() {
        $.ajax({
            url: "<%=path%>/system/insertUser",
            data: $('[id = signFrom]').serialize(),
            success: function (obj) {
                if (obj == 1) {
                    alert("注册成功，请等待审核通过后登录");
                    location.href = "<%=path%>/system/login";
                } else if (obj == 0) {
                    alert("注册失败，请重试")
                } else if (obj == -1) {
                    alert("部分信息不全，请重新提交")
                }
            }
        })
    }

</script>

<style>
    body{
        font-size: 18px;
        line-height: 20px;
    }
    label{
        margin:10px;
    }
    .a-radio{
        display: none;
    }
    .b-radio{
        display: inline-block;
        border:1px solid #ccc;
        width:16px;
        height: 16px;
        border-radius:2px;
        vertical-align: middle;
        margin-right: 5px;
        position: relative;
    }
    .b-radio:before{
        content: '';
        font-size: 0;
        width: 10px;
        height: 10px;
        background: rgb(143, 188, 238);
        position: absolute;
        left:50%;
        top:50%;
        margin-left: -5px;
        margin-top: -5px;
        border-radius: 2px;
        display: none;
    }
    .a-radio:checked~.b-radio:before{
        display: block;
    }
</style>

</html>
