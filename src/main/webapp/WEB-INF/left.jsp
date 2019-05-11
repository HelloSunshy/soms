<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-14
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>


        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 15%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }

        li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        li a.active {
            background-color: #4CAF50;
            color: white;
        }

        li a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
    </style>


        </head>
<body>
<ul>

    <li style ="height:50px;">当前用户：${doctor.doctorName}</li>
    <li style="height:35px">当前时间：${date}</li>

    <li ><a class="active" style="background: red; color: white">未处理预约订单</a></li>

    <li><a href="/soms/doctor/login">列表</a></li>

    <li><a class="active" style="background: blue;color: white">未完成订单</a></li>

    <li><a href="/soms/doctor/tostatue">列表</a></li>

    <li><a class="active">完结订单</a></li>

    <li><a  href="/soms/doctor/success">列表</a></li>

    <li><a class="active" >操作</a></li>

    <%--<li><a href="#home">诊断</a></li>--%>

    <li><a href="/soms/doctor/logout">登出</a></li>

</ul>
</body>

</html>
