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
    <title>info</title>
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
<table class="table-striped">

    <tr>
        <td>姓名</td>
        <td>${userInfo.userName}</td>
    </tr>
    <tr>
        <td>学号/工号</td>
        <td>${userInfo.serialId}</td>
    </tr>
    <tr>
        <td>身份</td>
        <td>
            <c:if test="${userInfo.userType==1}">管理员</c:if>
            <c:if test="${userInfo.userType==2}">教材科</c:if>
            <c:if test="${userInfo.userType==3}">系主任</c:if>
            <c:if test="${userInfo.userType==4}">教学秘书</c:if>
            <c:if test="${userInfo.userType==5}">授课教师</c:if>
        </td>
    </tr>
    <tr>
        <td>班级/部门</td>
        <td>${userInfo.userDept}</td>
    </tr>
    <tr>
        <td>电话</td>
        <td>${userInfo.userPhone}</td>
    </tr>
</table>

</body>

<script>

</script>

</html>
