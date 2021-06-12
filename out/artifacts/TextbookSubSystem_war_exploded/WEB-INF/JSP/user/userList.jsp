<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Title</title>

    <%
        //获取到web端的绝对路径 映射到工程的web文件夹
        String path = request.getContextPath();
    %>
    <%--导入css样式--%>
    <%--<link rel="stylesheet" href="../../../CSS/css.css" type="text/css"/>--%>
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

    <script src="<%=path%>/JQuery/jquery-1.7.2.js"></script>
</head>
<body>

<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>ADMIN-${user.userName}</h1>
        </header>
        <div class="profile-photo-container">
            <img src="<%=path%>/static/images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
            <div class="profile-photo-overlay"></div>
        </div>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
            <ul>
                <li><a href="<%=path%>/system/router?role=1&userName=${user.userName}" class="active">
                    <i class="fa fa-home fa-fw"></i>主页</a>
                </li>
                <li><a href="<%=path%>/system/userList?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-bar-chart fa-fw"></i>用户管理</a>
                </li>
                <li><a href="<%=path%>/system/textbookList?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-database fa-fw"></i>教材管理</a>
                </li>
                <li><a href="<%=path%>/system/orderList?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-map-marker fa-fw"></i>订单管理</a></li>
                <li><a href="<%=path%>/system/classList?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-users fa-fw"></i>班级管理</a>
                </li>
                <li><a href="<%=path%>/system/publishList?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-sliders fa-fw"></i>出版社管理</a>
                </li>
                <li><a href="<%=path%>/system/login">
                    <i class="fa fa-eject fa-fw"></i>Sign Out</a>
                </li>
                <li><a href="#">
                    <i class="fa fa-eject fa-fw"></i>TOP</a>
                </li>
                <li><a href="#">
                    <i></i></a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
            <div class="row">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                    <ul class="text-uppercase">
                        <li><a href="" class="active">Admin panel</a></li>
                        <li><a href="">Dashboard</a></li>
                        <li><a href="">Overview</a></li>
                        <li><a href="login.html">Sign in form</a></li>
                    </ul>
                </nav>
            </div>
        </div>


        <div class="templatemo-content-container">
            <table class="table table-striped table-bordered templatemo-user-table">
                <tr>
                    <th><input type="checkbox" id="selectAllButton">全选/反选</th>
                    <th>用户Id</th>
                    <th>用户名</th>
                    <th>工号</th>
                    <th>用户类型</th>
                    <th>院系</th>
                    <th>电话号码</th>
                    <th>用户状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="useritem" items="${userList}">
                    <tr>
                        <td><input type="checkbox" class="idCheckbox" value="${useritem.userId}"></td>
                        <td>${useritem.userId}</td>
                        <td>${useritem.userName}</td>
                        <td>${useritem.serialId}</td>
                        <td>${useritem.userType}</td>
                        <td>${useritem.userDept}</td>
                        <td>${useritem.userPhone}</td>
                        <td>${useritem.userState}</td>
                        <td>
                            <button class="btn bg-primary" onclick="userInfo(${useritem.userId})">查看</button>
                            <button class="btn bg-primary" onclick="editUserInfo(${useritem.userId})">编辑</button>
                            <button class="btn bg-danger" onclick="deleteUserById(${useritem.userId})">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="15" align="center">
                        <a onclick="limitPage(1)">首页</a>
                        <input type="button" class="btn bg-success" onclick="limitPage(${limitPageUtil.prevPage})"
                               value="&lt;">
                        ${limitPageUtil.currentPage}/${limitPageUtil.lastPage}
                        <input type="button" class="btn bg-success" onclick="limitPage(${limitPageUtil.nextPage})"
                               value="&gt;">
                        <a onclick="limitPage(${limitPageUtil.lastPage})">尾页</a>
                    </td>
                </tr>
            </table>
        </div>

    </div>

</div>


</body>
<script>

    function userInfo(userId) {
        location.href = "<%=path%>/system/getUser?userName=${user.userName}&userType=${user.userType}&userId=" + userId + "&op=1";
    }

    function editUserInfo(userId) {
        location.href = "<%=path%>/system/getUser?userName=${user.userName}&userType=${user.userType}&userId=" + userId + "&op=2";
    }


    function deleteUserById(userId) {
        var deleteCheck = confirm("确认删除？")
        if (deleteCheck == true) {
            $.ajax({
                //提交的地址
                url: "<%=path%>/system/deleteUserById",
                //提交的类型
                type: "post",
                //传递的数据
                data: {
                    "userId": userId,
                },
                //回调函数
                success: function (obj) {
                    if (obj > 0) {
                        alert("删除成功")
                        location.href = "<%=path%>/system/userList?userName=${user.userName}&userType=${user.userType}";
                    } else {
                        alert("删除失败")
                        location.href = "<%=path%>/system/userList?userName=${user.userName}&userType=${user.userType}";
                    }
                },
                //服务器返回的数据类型
                dataType: "json"

            })
        }
    }


</script>
</html>
