<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/18
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Title</title>

    <%
        //获取到web端的绝对路径 映射到工程的web文件夹
        String path = request.getContextPath();
        System.out.println(request.getSession().getAttribute("pubMap"));
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
    <link rel="stylesheet" href="<%=path%>/static/css/style.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>

    <script src="<%=path%>/JQuery/jquery-1.7.2.js"></script>
    <script src="<%=path%>/static/js/SimpleChart.js"></script>
    <script src="<%=path%>/static/js/circularProgressBar.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/assets/flexbox-bar-graph.css">
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
            <h1>系主任-${user.userName}</h1>
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
                <li><a href="<%=path%>/system/router?role=3&userName=${user.userName}" class="active">
                    <i class="fa fa-home fa-fw"></i>主页</a>
                </li>
                <li><a href="<%=path%>/system/waitOrderList?userName=${user.userName}">
                    <i class="fa fa-bar-chart fa-fw"></i>审核订单</a>
                </li>
                <li><a href="<%=path%>/system/passedOrderList?userName=${user.userName}">
                    <i class="fa fa-database fa-fw"></i>查看已通过订单</a>
                </li>
                <li>
                    <a href="<%=path%>/system/getSubData?userName=${user.userName}">
                        <i class="fa fa-database fa-fw"></i>征订信息统计</a>
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
                <li><a href="#">
                    <i></i></a>
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

<%--
        <div class="templatemo-content-container">
            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <span>班级订购率</span>
                        <table data-id="flexbox-bar-graph" data-layout="horizontal">
                            <c:forEach var="rate" items="${classRate}">
                                <tr>
                                    <td>${rate.key}</td>
                                    <td>
                                        <span style="--data-set:${rate.value}/100;"></span>
                                        <p>${rate.value}%</p>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
            </div>
--%>
        <div class="templatemo-content-container">

            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <span>班级订购率</span>
                    <table id="classRateTable">
                        <canvas id="classBar" style="height: 500px" class="col-md-12"></canvas>
                    </table>
                </div>
            </div>

            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <span>教材订购率</span>
                    <table id="bookRateTable">
                        <canvas id="bookBar" style="height: 500px" class="col-md-12"></canvas>
                    </table>
                </div>
            </div>

            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <span>出版社订购数量</span>
                    <table id="publishNumTable">
                        <canvas id="pNumBar" style="height: 500px" class="col-md-12"></canvas>
                    </table>
                </div>
            </div>

            <div class="templatemo-flex-row flex-content-row">
                <div class="templatemo-content-widget white-bg col-2">
                    <i class="fa fa-times"></i>
                    <div class="square"></div>
                    <span>年段订购率</span>
                    <table id="gradeRateTable">
                        <canvas id="gradeRateBar" style="height: 500px" class="col-md-12"></canvas>
                    </table>
                </div>
            </div>

        </div>

    </div>
</div>

<c:forEach var="book" items="${bookRate}">

    <input type="hidden" name="111" value="${book.key}">

</c:forEach>

<%--

            <div class="templatemo-content-widget white-bg col-1">
              <i class="fa fa-times"></i>
              <h2 class="text-uppercase">Dictum</h2>
              <h3 class="text-uppercase">Sedvel Erat Non</h3><hr>
              <div class="progress">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
              </div>
              <div class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
              </div>
              <div class="progress">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
              </div>
--%>

</body>

<script>

    var classKeySet = ${classRate.keySet()}
    var classValueSet = ${classRate.values()}
    const classBars = new SimpleBarChart({
        id: 'classBar',
        values: classValueSet,
        labels: classKeySet,
        scale: 25,
        backgroundColor: 'white',
        unit: '%',
        gridLineStyle: 'dashed',
        colors: ['#1baf74', '#fda145'],
        barSpacing: 40,
        xAxisFontColor: 'gray',
        xAxisLine: true,
        gridLineColor: 'gray',
        gridFontColor: 'gray',
        dashes: 30,
        cornerRadius: 0,
        labelSpace: 60,
        barHoverFontColor: 'gray'
    })

    //Listener for hover interaction
    classBars.addEventListener('hover', e => {
        console.log(e.detail)
    })

    classBars.draw()

</script>
<script>

    var booKeySet = ${bookRate.keySet()}
    var bookValueSet = ${bookRate.values()}
    const bookBars = new SimpleBarChart({
        id: 'bookBar',
        values: bookValueSet,
        labels: booKeySet,
        scale: 25,
        backgroundColor: 'white',
        unit: '%',
        gridLineStyle: 'dashed',
        colors: ['#1baf74', '#fda145'],
        barSpacing: 40,
        xAxisFontColor: 'gray',
        xAxisLine: true,
        gridLineColor: 'gray',
        gridFontColor: 'gray',
        dashes: 30,
        cornerRadius: 0,
        labelSpace: 60,
        barHoverFontColor: 'gray'
    })

    //Listener for hover interaction
    bookBars.addEventListener('hover', e => {
        console.log(e.detail)
    })

    bookBars.draw()
</script>

<script>
    var pubNameList = ${pubMap.keySet()}
    var pubNumList = ${pubMap.values()}

    const pubBars = new SimpleBarChart({
        id: 'pNumBar',
        values: pubNumList,
        labels: pubNameList,
        scale: 50,
        backgroundColor: 'white',
        unit: '',
        gridLineStyle: 'dashed',
        colors: ['#1baf74', '#fda145'],
        barSpacing: 300,
        xAxisFontColor: 'gray',
        xAxisLine: true,
        gridLineColor: 'gray',
        gridFontColor: 'gray',
        dashes: 30,
        cornerRadius: 0,
        labelSpace: 60,
        barHoverFontColor: 'gray'
    })

    //Listener for hover interaction
    pubBars.addEventListener('hover', e => {
        console.log(e.detail)
    })

    pubBars.draw()

</script>


</html>
