<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-10
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="" rel="stylesheet">
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: white;
        }
    </style>
</head>
<body>
<ul style="background: #1a1a1a">
    <li><a class="active" href="/soms/user/login">首页</a></li>
    <li><a href="/soms/user/order">预约</a></li>
    <li><a href="/soms/user/reimburse">医保报销</a></li>
    <%--<c:if test="${successMasterlist.content.size() <= 0}">--%>
    <%--<li class="disabled"><a href="/soms/user/lastorder">以往病历12</a></li>--%>
    <%--</c:if>--%>
    <c:if test="${sessionScope.ordersize > 0}">
        <li class="disabled"><a href="/soms/user/lastorder">以往病历</a></li>
    </c:if>
    <li style="margin-top:14px;display:block;margin-left:70%"><span style="color:white" >用户：</span></li>
    <li style="margin-top:14px"> <span style="color:white">${username.userName}</span></li>
    <li style="margin-left:2% "><a href="/soms/user/loginout">登出</a></li>
</ul>
</spann>
</li>
</ul>
</body>
</html>
