<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/8
  Time: 17:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>editOrder</title>
    <%
        //获取到web端的绝对路径 映射到工程的web文件夹
        String path = request.getContextPath();
    %>
    <%--导入css样式--%>
    <%--<link rel="stylesheet" href="../../../CSS/css.css" type="text/css"/>--%>
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

    <script src="<%=path%>/JQuery/jquery-1.7.2.js"></script>
</head>
<body>

<form id="orderForm" class="form-horizontal">
    <input type="hidden" name="id" value="${order.id}">
    <input type="hidden" name="userId" value="${order.userId}"/>
    <input type="hidden" id="tBookId" name="tBookId" value=""/>
    <input type="hidden" id="orderState" name="orderState" value="0"/>
    <div class="container-fluid">
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="bookName" class="col-sm-2 col-xs-2 control-label">书籍名称</label>
            <div class="col-xs-4 col-md-2">
                <input type="text" class="form-control col-md-3 col-xs-3" id="bookName"
                       placeholder="${order.textBook.bookName}">
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <div align="center">
                <label for="orderClass" class="col-sm-2 col-xs-2 control-label">使用班级</label>
                <div class="col-xs-4 col-md-2">
                    <input type="text" class="form-control col-md-3 col-xs-3" id="orderClass" name="orderClass"
                           placeholder="${order.orderClass}">
                </div>
            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="num" class="col-sm-2 col-xs-2 control-label">数量</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="num" name="num"
                       placeholder="${order.num}">
            </div>
        </div>

    </div>
</form>

<div class="container-fluid">
    <div align="center">
        <button class="btn bg-success" onclick="updateOrder()">保存</button>
    </div>
</div>
<br>
<br>
<br>


<table class="table table-bordered table-hover">
    <c:forEach var="book" items="${textbookList}">
        <tr onclick="chooseBook(${book.bookId},'${book.bookName}')">
            <td><input type="radio" id="bookId+${book.bookId}" name="bookCheck"></td>
            <td>${book.bookName}</td>
            <td>${book.author}</td>
        </tr>
    </c:forEach>
</table>

</body>

<script>

    function chooseBook(bookId,bookName){
        $("#tBookId").val(bookId);
        $("#bookName").val(bookName);
    }

    function updateOrder(){
        $.ajax({
            url:"<%=path%>/system/updateOrder",
            type:"post",
            data:$("#orderForm").serialize(),
            success:function (obj){
                if (obj> 0){
                    alert("修改成功");
                    location.href="<%=path%>/system/router?role=${order.user.userType}&userName=${order.user.userName}";
                }else {
                    alert("修改失败");
                }
            },
            dataType:"json"
        })
    }
</script>
</html>
