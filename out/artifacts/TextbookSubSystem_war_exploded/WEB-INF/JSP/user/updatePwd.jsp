<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/6
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>updatePassword</title>
</head>

<%
    //获取到web端的绝对路径 映射到工程的web文件夹
    String path = request.getContextPath();
%>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<link rel="stylesheet" href="<%=path%>/static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<%=path%>/static/css/templatemo-style.css" type="text/css">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<%--导入js控件--%>
<script src="../../JQuery/jquery-1.7.2.js"></script>
<body>

<br>
<br>
<br>
<br>
<br>
<br><br>
<br>
<br>
<br>
<h3 align="center">修改密码</h3>
<br>
<form id="loginForm" class="form-horizontal">
    <div class="container-fluid">
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="old" class="col-sm-2 col-xs-2 control-label">旧密码</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="old" name="oldPwd"
                       placeholder="旧密码">
            </div>
        </div>
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <div align="center">
                <label for="new" class="col-sm-2 col-xs-2 control-label">新密码</label>
                <div class="col-xs-4 col-md-2">
                    <input type="password" class="form-control col-md-3 col-xs-3" id="new" name="password"
                           placeholder="新密码">
                </div>
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <div align="center">
                <label for="check" class="col-sm-2 col-xs-2 control-label">确认密码</label>
                <div class="col-xs-4 col-md-2">
                    <input type="password" class="form-control col-md-3 col-xs-3" id="check" name="checkword"
                           placeholder="确认密码">
                </div>
            </div>
        </div>
    </div>
</form>

<div class="container-fluid">
    <div align="center">
        <button class="btn bg-success" onclick="updatePwd()">保存</button>
    </div>
</div>


<%--
<form>
    ${user.password}
    <table>
        <tr>
            <td>旧密码</td>
            <td>
               <input type="text" id="old" name="oldPwd"/>
            </td>
        </tr>
        <tr>
            <td>新密码</td>
            <td>
                <input type="password" id="new" name="password"/>
            </td>
        </tr>
        <tr>
            <td>确认密码</td>
            <td>
                <input type="password" id="check" name="checkword"/>
            </td>
        </tr>
    </table>
</form>--%>
</body>
<script>

    function updatePwd(){
        var password = $("#new").val();
        if ($('[id = old]').val() === "${user.password}"){
            if ($('[id = new]').val()===$('[id = check]').val()){
                $.ajax({
                    url:"<%=path%>/system/updatePwd",
                    type:"post",
                    data: {
                        "userId":${user.userId},
                        "password":password
                    },
                    success:function (obj){
                        if (obj > 0) {
                            alert("修改成功，请重新登录");
                            location.href="<%=path%>/system/login";
                        }else {
                            alert("修改失败，请重试");

                        }
                    }
                })
            }else {
                alert("两次密码不一致")
            }
        }else {
            alert("旧密码错误")
        }
    }

</script>
</html>
