<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/8
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%--
    private Integer id;
    private Integer userId;
    private Integer tBookId;
    // 使用订单中教材的班级
    private String orderClass;
    private String orderDate;
    private Integer num;
    private BigDecimal sumPrice;
    private Integer orderState;
    private String note;
    private TextBook textBook;
    private User user;
--%>
<br>
<br>
<form id="orderForm" class="form-horizontal">

    <input type="hidden" name="id">
    <input type="hidden" name="userId" value="${user.userId}"/>
    <input type="hidden" id="tBookId" name="tBookId" value=""/>
    <div class="container-fluid">
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="bookName" class="col-sm-2 col-xs-2 control-label">书籍名称</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="bookName"
                       placeholder="书籍名称">
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <div align="center">
                <label for="orderClass" class="col-sm-2 col-xs-2 control-label">使用班级</label>
                <div class="col-xs-4 col-md-2">
                    <input type="text" class="form-control col-md-3 col-xs-3" id="orderClass" name="orderClass"
                           placeholder="使用班级">
                </div>
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="num" class="col-sm-2 col-xs-2 control-label">数量</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="num" name="num"
                       placeholder="数量">
            </div>
        </div>

    </div>
</form>

<div class="container-fluid">
    <div align="center">
        <button class="btn bg-success" onclick="insertOrder()">保存</button>
    </div>
</div>
<br>
<br>
<br>


<%--<form id="orderForm">
    <table>
        <input type="hidden" name="id">
        <input type="hidden" name="userId" value="${user.userId}"/>
        <input type="hidden" id="tBookId" name="tBookId" value=""/>
        <tr>
            <td>书籍名称</td>
            <td><input type="text" id="bookName"value=""/>
            </td>
        </tr>
        <tr>
            <td>使用班级</td>
            <td><input type="text" id="orderClass" name="orderClass" value=""/></td>
        </tr>
        <tr>
            <td>数量</td>
            <td><input type="text" id="num" name="num" value=""/></td>
        </tr>
    </table>
</form>--%>

<div class="container-fluid">
    <table class="table table-hover table-bordered">
        <c:forEach var="book" items="${textbookList}">
            <tr onclick="getBook(${book.bookId},'${book.bookName}')">
                <td><input type="radio" name="bookCheck"></td>
                <td>${book.bookName}</td>
                <td>${book.author}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>

<script>

    function getBook(bookId, bookName) {
        $("#tBookId").val(bookId);
        $("#bookName").val(bookName);
    }

    function insertOrder() {
        $.ajax({
            url: "<%=path%>/system/insertOrder",
            type: "post",
            data: $("#orderForm").serialize()
            /*{
                "userId":${userId},
                "tBookId":$("#tBookId").val(),
                "orderClass":$("#orderClass").val(),
                "num":$("#num").val()
            }*/,
            success: function (obj) {

                if (obj > 0) {
                    alert("添加成功")
                    location.href = "<%=path%>/system/router?role=${user.userType}&userName=${user.userName}";
                } else {
                    alert("添加失败")
                }
            }
        })
    }

</script>

</html>
