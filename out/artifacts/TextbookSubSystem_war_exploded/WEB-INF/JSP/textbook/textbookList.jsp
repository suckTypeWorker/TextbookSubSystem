<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/3
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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

    <script src="<%=path%>/JQuery/jquery-1.7.2.js"></script>
</head>
<body>

<table class="table table-striped table-bordered">
    <h1 align="center" style="font-size: 30px">教材管理</h1>


    <hr>
    <tr>
        <td colspan="12" align="center">
            <input type="button" class="btn bg-success" value="添加教材" onclick="addTextbook()"/>
            <input type="button" class="btn bg-danger" value="批量下架" onclick="deleteGoodsByList()"/>
            <input type="button" class="btn bg-warning" value="注销"/>
        </td>
    </tr>
    <tr>
        <th><input type="checkbox" id="selectAllButton">全选/反选</th>
        <th>书籍名称</th>
        <th>ISBN号</th>
        <th>CIP号</th>
        <th>丛书名</th>
        <th>出版社</th>
        <th>作者</th>
        <th>出版时间</th>
        <th>价格</th>
        <th>分类</th>
        <th>主题词</th>
        <th>操作</th>
    </tr>

    <c:forEach var="book" items="${textbookList}">
        <tr>
            <td><input type="checkbox" class="idCheckbox" value="${book.bookId}"> ${book.bookId}</td>
            <td>${book.bookName}</td>
            <td>${book.ISBNId}</td>
            <td>${book.CIPId}</td>
            <td>${book.seriesName}</td>
            <td>
                <c:forEach var="publish" items="${publishList}">
                    <c:if test="${book.publishId == publish.publishId}">
                        ${publish.publishName}
                    </c:if>
                </c:forEach>
            </td>
            <td>${book.author}</td>
            <td>${book.publishDate}</td>
            <td>${book.price}</td>
            <td>${book.classification}</td>
            <td>${book.theme}</td>
            <td>
                <button class="btn bg-success" onclick="editBookInfo(${book.bookId})">编辑</button>
                <button class="btn bg-danger" onclick="deleteBookById(${book.bookId},'${book.bookName}')">删除</button>
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

    /**
     * 查询所有部门的信息
     */
    function addTextbook() {
        location.href = "<%=path%>/system/addTextbook?userName=${user.userName}";
    }

    function editBookInfo(bookId) {
        location.href = "<%=path%>/system/editTextbook?bookId=" + bookId;
    }


    /**
     * 下架商品
     */
    function deleteBookById(bookId,bookName) {
        var deleteCheck = confirm("确认删除"+bookName+"吗？")
        if (deleteCheck == true) {
            $.ajax({
                //提交的地址
                url: "<%=path%>/system/deleteTextbookById",
                //提交的类型
                type: "post",
                //传递的数据
                data: {
                    "bookId": bookId,
                },
                //回调函数
                success: function (obj) {
                    if (obj) {
                        alert("删除成功")
                        location.href = "<%=path%>/system/textbookList";
                    } else {
                        alert("删除失败")
                    }
                },
                //服务器返回的数据类型
                dataType: "json"

            })
        }
    }

    function deleteGoodsByList() {
        //获取多选框，判断是不是选中状态
        var length = $(".idCheckbox:checked").length;

        if (length > 0) {
            var idString = "";
            if (confirm("确定删除？")) {
                $(".idCheckbox:checked").each(function () {
                    idString += "," + $(this).val();
                })
                idString = idString.substring(1);
                alert(idString)
                $.ajax({
                    //提交的地址
                    url: "<%=path%>/goods/deleteGoodsByList",
                    //提交的类型
                    type: "post",
                    //传递的数据
                    data: {
                        idString:idString,
                    },
                    //回调函数
                    success: function (obj) {
                        if (obj == length) {
                            alert("下架成功")
                            location.href = "<%=path%>/goods/list";
                        } else {
                            alert("下架失败")
                        }
                    },
                    //服务器返回的数据类型
                    dataType: "json"

                })
            }
        } else {
            alert("未选中下架商品")
        }


    }

    $(function () {

        //动态绑定单击事件
        $("#selectAllButton").click(function () {
            //全选全不选反选
            $(".idCheckbox").each(function () {
                this.checked = !this.checked;
            })
        })
    })


    function limitPage(currentPage){
        location.href= "<%=path%>/goods/list?currentPage=" + currentPage;
    }

</script>
</html>
