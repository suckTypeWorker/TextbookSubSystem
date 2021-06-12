<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/8
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>addTextbook</title>
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

<br>
<br>
<br>
<br>
<h4 align="center">添加教材</h4>
<br>

<form id="bookForm" class="form-horizontal">
    <input type="hidden" name="bookId" value="${textbook.bookId}">
    <div class="container-fluid">
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="user" class="col-sm-2 col-xs-2 control-label">书名</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="user" name="bookName"
                       placeholder="书名">
            </div>
        </div>
        <%--name="bookName" value="${textbook.bookName}"--%>


        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="isbn" class="col-sm-2 col-xs-2 control-label">ISBN号</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="isbn" name="ISBNId"
                       placeholder="ISBN">
            </div>
        </div>
        <%--<td><input type="text" name="ISBNId" value="${textbook.ISBNId}"/></td>--%>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="cip" class="col-sm-2 col-xs-2 control-label">CIP号</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="cip" name="CIPId"
                       placeholder="CIP">
            </div>
        </div>
        <%--<td><input type="text" name="CIPId" value="${textbook.CIPId}"/></td>--%>


        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="ser" class="col-sm-2 col-xs-2 control-label">丛书名</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="ser" name="seriesName"
                       placeholder="丛书名">
            </div>
        </div>
        <%--<td><input type="text" name="seriesName" value="${textbook.seriesName}"/></td>--%>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="pub" class="col-sm-2 col-xs-2 control-label">出版社</label>
            <div class="col-xs-4 col-md-2">
                <select id="pub" class="btn bg-info" name="publishId">
                    <option value="0">---请选择---</option>
                    <c:forEach var="publish" items="${publishList}">
                        <option value="${publish.publishId}">${publish.publishName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="author" class="col-sm-2 col-xs-2 control-label">作者</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="author" name="author"
                       placeholder="作者">
            </div>
        </div>
        <%--<td><input type="text" name="author" value="${textbook.author}"/></td>--%>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="date" class="col-sm-2 col-xs-2 control-label">出版时间</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="date" name="publishDate"
                       placeholder="出版时间">
            </div>
        </div
        <%--<td><input type="text" name="publishDate" value="${textbook.publishDate}"/></td>--%>

        <%--保证格式相同，无实际作用--%>
        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <div class="col-xs-4 col-md-2">

            </div>
        </div>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="price" class="col-sm-2 col-xs-2 control-label">价格</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="price" name="price"
                       placeholder="价格">
            </div>
        </div>
        <%--<td><input type="text" name="price" value="${textbook.price}"/></td>--%>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="classi" class="col-sm-2 col-xs-2 control-label">分类</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="classi" name="classification"
                       placeholder="分类">
            </div>
        </div>
        <%--<td><input type="text" name="classification" value="${textbook.classification}"/></td>--%>

        <div class="form-group col-xs-12">
            <div class="col-xs-3"></div>
            <label for="theme" class="col-sm-2 col-xs-2 control-label">主题词</label>
            <div class="col-xs-4 col-md-2">
                <input type="email" class="form-control col-md-3 col-xs-3" id="theme" name="theme"
                       placeholder="主题词">
            </div>
        </div>
        <%--<td><input type="text" name="theme" value="${textbook.theme}"/></td>--%>

    </div>
</form>
<div class="container-fluid">
    <div align="center">
        <button class="btn bg-success" onclick="insertTextbook()">保存</button>
    </div>
</div>

<%--<form id="bookForm">
    <table>
        <input type="hidden" name="bookId"/>
        <tr>
            <td>书籍名称</td>
            <td><input type="text" name="bookName"/></td>
        </tr>
        <tr>
            <td>ISBN号</td>
            <td><input type="text" name="ISBNId"/></td>
        </tr>
        <tr>
            <td>CIP号</td>
            <td><input type="text" name="CIPId"/></td>
        </tr>
        <tr>
            <td>丛书名</td>
            <td><input type="text" name="seriesName"/></td>
        </tr>
        <tr>
            <td>出版社</td>
            <td>
                <select name="publishId">
                    <option value="0">---请选择---</option>
                    <c:forEach var="publish" items="${publishList}">
                        <option value="${publish.publishId}">${publish.publishName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>作者</td>
            <td><input type="text" name="author"/></td>
        </tr>
        <tr>
            <td>出版时间</td>
            <td><input type="text" name="publishDate"/></td>
        </tr>
        <tr>
            <td>价格</td>
            <td><input type="text" name="price"/></td>
        </tr>
        <tr>
            <td>分类</td>
            <td><input type="text" name="classification"/></td>
        </tr>
        <tr>
            <td>主题词</td>
            <td><input type="text" name="theme"/></td>
        </tr>
    </table>
</form>--%>


</body>
<script>

    function insertTextbook(){
        $.ajax({
            url:"<%=path%>/system/insertTextbook",
            type:"post",
            data:$("#bookForm").serialize(),
            success:function (obj){
                if (obj > 0){
                    alert("添加成功");
                    location.href="<%=path%>/system/textbookList?userName=${user.userName}&userType=${user.userType}";
                }else {
                    alert("添加失败")
                }
            },
            dataType:"json"
        })
    }

</script>
</html>
