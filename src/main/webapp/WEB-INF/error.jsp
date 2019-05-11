<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-11
  Time: 08:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>404</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="alert alert-dismissable alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>

                </h4> <strong> ${msg}!</strong> 页面将在三秒后跳转！！！ <a href="/soms/base/tologin" class="alert-link">若页面无响应请点击</a>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    setTimeout(function(){
        window.location.href="/soms/base/tologin";
    },3000)

</script>
</html>
