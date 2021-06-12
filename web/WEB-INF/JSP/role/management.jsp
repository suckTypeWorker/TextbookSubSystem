<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/4
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>教材科</title>
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
<%--
 private Integer userId;
    private String userName;
    private String password;
    private String serialId;
    /**
     * 用户类型
     * 1.管理员(啥都能管)
     * 2.教材科(审核)
     * 3.系主任(查看、提交订单，修改还未支付的订单)
     * 4.教学秘书(查看、汇总订单)
     * 5.教师(提交订单)
     * 6.学生(查看与自己相关的订单)
     */
    private Integer userType;
    private String userDept;
    private String userPhone;

--%>


<body>

<div class="templatemo-flex-row">
    <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
            <div class="square"></div>
            <h1>教材科-${user.userName}</h1>
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
                <li><a href="<%=path%>/system/router?role=${user.userType}&userName=${user.userName}" class="active">
                    <i class="fa fa-home fa-fw"></i>主页</a>
                </li>
                <li><a href="<%=path%>/system/manPassedOrderList?userName=${user.userName}">
                    <i class="fa fa-bar-chart fa-fw"></i>处理订单</a>
                </li>
                <li>
                    <a href="<%=path%>/system/getUser?userName=${user.userName}&userType=${user.userType}&userId=${user.userId}&op=2">
                        <i class="fa fa-database fa-fw"></i>修改个人信息</a>
                </li>
                <li><a href="<%=path%>/system/updatePassword?userName=${user.userName}&userType=${user.userType}">
                    <i class="fa fa-database fa-fw"></i>修改密码</a>
                </li>
                <li><a href="<%=path%>/system/login">
                    <i class="fa fa-eject fa-fw"></i>Sign Out</a>
                </li>
                <li><a href="#">
                    <i class="fa fa-eject fa-fw"></i>TOP</a>
                </li>
                <li><a href="">
                    <i></i></a>
                </li>
                <li><a href="">
                    <i></i></a>
                </li>
                <li><a href="">
                    <i></i></a>
                </li>
                <li><a href="">
                    <i></i></a>
                </li>
                <li><a href="">
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
            <div class="templatemo-flex-row flex-content-row" style="background: #39ADB4">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <jsp:include page="notice.jsp"></jsp:include>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<%--        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="<%=path%>/system/router?role=${user.userType}&userName=${user.userName}">主页
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/system/manPassedOrderList?userName=${user.userName}">处理订单</a>
                </li>
                <li>
                    <a href="<%=path%>/system/getUser?userName=${user.userName}&userId=${user.userId}&op=2">修改个人信息</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>--%>


</body>

<script>

</script>

</html>
