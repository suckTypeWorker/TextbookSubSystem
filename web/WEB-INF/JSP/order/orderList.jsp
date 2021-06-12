<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/8
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>orderList</title>

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

<table class="table table-bordered">
    <hr>
    <tr>
        <td colspan="12" align="center">
            <input type="button" class="btn bg-danger" value="批量删除" onclick="deleteGoodsByList()"/>
            <input type="button" class="btn bg-success" value="注销"/>
        </td>
    </tr>
    <tr>
        <th><input type="checkbox" id="selectAllButton">全选/反选</th>
        <th>订单号</th>
        <th>教材名称</th>
        <th>申请者</th>
        <th>适用班级</th>
        <th>申请日期</th>
        <th>教材单价</th>
        <th>教材数量</th>
        <th>教材总价</th>
        <th>订单状态</th>
        <th>操作</th>
    </tr>

    <c:forEach var="order" items="${orderList}">
        <tr>
            <td><input type="checkbox" class="idCheckbox" value="${order.id}"></td>
            <td>${order.id}</td>
            <td>${order.textBook.bookName}</td>
            <td>${order.user.userName}</td>
            <td>${order.orderClass}</td>
            <td>${order.orderDate}</td>
            <td>${order.textBook.price}</td>
            <td>${order.num}</td>
            <td>${order.sumPrice}</td>
            <td>
                <%--
                0.待审核
                1.通过审核
                2.已付款
                --%>
                <c:if test="${order.orderState == 0}">
                    待审核
                </c:if>
                    <c:if test="${order.orderState == 1}">
                        通过初步审核
                    </c:if>
                    <c:if test="${order.orderState == 2}">
                        通过最终审核
                    </c:if>
                    <c:if test="${order.orderState == 3}">
                        未通过审核
                    </c:if>
                    <c:if test="${order.orderState == 4}">
                        教材科已处理
                    </c:if>
            </td>
            <td>
                <button class="btn bg-warning" onclick="editOrder(${order.id})">打回</button>
                <button class="btn bg-danger" onclick="editOrder(${order.id})">删除</button>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="15" align="center">
            <a onclick="limitPage(1)">首页</a>
            <input type="button" onclick="limitPage(${limitPageUtil.prevPage})" value="&lt;">
            ${limitPageUtil.currentPage}/${limitPageUtil.lastPage}
            <input type="button" onclick="limitPage(${limitPageUtil.nextPage})" value="&gt;">
            <a onclick="limitPage(${limitPageUtil.lastPage})">尾页</a>
        </td>
    </tr>
</table>

</body>

<script>

function editOrder(id){
    location.href="<%=path%>/system/editOrder?id="+id;
}

</script>

</html>
