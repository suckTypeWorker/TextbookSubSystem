<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/6
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>update</title>
</head>
<%
    //获取到web端的绝对路径 映射到工程的web文件夹
    String path = request.getContextPath();
%>
<%--导入css样式--%>
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
<script src="../../JQuery/jquery-1.7.2.js"></script>
<body>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<form id="updateFrom" class="form-horizontal">
    <input type="hidden" id="userId" name="userId" value="${userInfo.userId}">
    <div class="container-fluid">
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="user" class="col-sm-2 col-xs-2 control-label">用户名</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="user" name="userName"
                       placeholder="${userInfo.userName}" value="${userInfo.userName}">
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="ser" class="col-sm-2 col-xs-2 control-label">工号</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="ser" name="serialId"
                       placeholder="${userInfo.serialId}" value="${userInfo.serialId}">
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label class="col-sm-2 col-xs-2 control-label">职务</label>
            <div class="col-xs-4 col-md-2">
                <c:if test="${userInfo.userType==1}">管理员</c:if>
                <c:if test="${userInfo.userType==2}">教材科</c:if>
                <c:if test="${userInfo.userType==3}">系主任</c:if>
                <c:if test="${userInfo.userType==4}">教学秘书</c:if>
                <c:if test="${userInfo.userType==5}">授课教师</c:if>
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="dept" class="col-sm-2 col-xs-2 control-label">院系</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="dept" name="userDept"
                       placeholder="${userInfo.userDept}" value="${userInfo.userDept}">
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="phone" class="col-sm-2 col-xs-2 control-label">电话</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="phone" name="userPhone"
                       placeholder="${userInfo.userPhone}" value="${userInfo.userPhone}">
            </div>
        </div>
    </div>
</form>
<div class="container-fluid">
    <div align="center">
        <button class="btn bg-success" onclick="updateUser()">保存</button>
        <button class="btn bg-success" onclick="getPwd()">修改密码</button>
    </div>
</div>

</body>
<script>

/*
    // radio动态回显
    $(function (){
        $("input:radio[name='userType'][value='${userInfo.userType}']").prop("checked",true);
    })*/

    function updateUser() {
        $.ajax({
            url:"<%=path%>/system/updateUser",
            data:$("#updateFrom").serialize(),
            success:function (obj){
                if (obj >0){
                    alert("修改成功，返回主页")
                    location.href="<%=path%>/system/router?role=${user.userType}&userName=${user.userName}";
                }else {
                    alert("修改失败，请重试")
                }
            },
            dataType:"json"
        })
    }

    function getPwd(){
        var url = "<%=path%>/system/getPwd";
        var form = $("<form></form>").attr("action", url).attr("method", "post");//定义post或get请求
        //设置表单值
        form.append($("<input></input>").attr("type", "hidden").attr("name", "userId").attr("value", $('[id = userId]').val()));
        //提交相对较大的参数体，json字符串
        form.append($("<input></input>").attr("type", "hidden").attr("name", "password").attr("value", ${userInfo.password}));
        form.appendTo('body').submit();
        //location.href="<%=path%>/system/getPwd?method=post&userId="+$("#userId").val()+"&password="+$("#password").val();
    }
</script>
</html>
