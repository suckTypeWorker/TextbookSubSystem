<%--
  Created by IntelliJ IDEA.
  User: ZY152
  Date: 2021/5/13
  Time: 21:52
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
</head>
<body>

<div class="container .container">

    <br><br>
    <div class="media">
        <div class="media-left media-middle">
            <a href="#">
                <img class="media-object" src="<%=path%>/static/IMG/paper-clip-academic-note-exam-128.png" alt="...">
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading">公告1</h4>
            <div class="col-md-6">
                公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容
                公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容
            </div>
        </div>

        <div class="media-body">
            <div class="media-body">
            <h4 class="media-heading">公告2</h4>
            <div class="col-md-6">
                公告2内容公告2内容公告2内容公告2内容公告2内容公告2内容公告2内容公告2内容公告2内容公告2内容
                公告2内容公告2内容公告2内容公告2内容公告2内容
            </div>
        </div>
    </div>
    </div>

    <br>

    <div class="media">
        <div class="media-left media-middle">
            <a href="#">
                <img class="media-object" src="<%=path%>/static/IMG/paper-clip-academic-note-exam-128.png" alt="...">
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading">公告3</h4>
            <div class="col-md-6">
                公告3内容公告3内容公告3内容公告3内容公告3内容公告3内容公告3内容公告3内容公告3内容
                公告3内容公告3内容公告3内容公告3内容<br>
                公告3内容公告3内容公告3内容公告3内容公告3内容公告3内容
                公告3内容公告3内容公告3内容公告3内容
            </div>
        </div>
        <div class="media-body">
            <div class="media-body">
            <h4 class="media-heading">公告4</h4>
            <div class="col-md-6">
                公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容
                公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容公告1内容
            </div>
        </div>
    </div>

</div>
</div>

</body>
</html>
