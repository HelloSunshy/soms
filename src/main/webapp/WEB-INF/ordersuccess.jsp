<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-12
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div>
    <%@include file="top.jsp"%>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>
                    注意!
                </h4> <strong>${msg}!</strong>同学你好 订单预约成功 请等待确认 <a href="/soms/user/toindex" class="alert-link">未跳转请单击这里</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    setTimeout(function(){
        window.location.href="/soms/user/login";
    },3000)

</script>
</html>
