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

    <li style ="height:50px;">当前用户：${admin.adminUsername}</li>

    <li style="height:35px">当前时间：${date}</li>

    <li ><a class="active" style="background: red; color: white">未处理预约订单</a></li>

    <li><a href="/soms/admin/login">列表</a></li>

    <li><a class="active" style="background: blue;color: white">未完成订单</a></li>

    <li><a href="/soms/admin/tostatue">列表</a></li>

    <li><a class="active">完结订单</a></li>

    <li><a  href="/soms/admin/success">列表</a></li>

    <li><a class="active" >药品操作</a></li>

    <li><a href="/soms/admin/drugmanage">药品管理</a></li>
    <li><a href="/soms/admin/adddruginfo">药品添加</a></li>

    <li><a class="active" >用户操作</a></li>

    <li><a href="/soms/admin/doctormanage">医生管理</a></li>

    <li><a href="/soms/admin/doctorrequire">医生添加</a></li>

    <li><a href="/soms/admin/usermanage">学生管理</a></li>

    <li><a href="/soms/admin/userrequire">学生添加</a></li>

    <li><a class="active" >系统操作</a></li>

    <li><a href="/soms/admin/handlemessage">信息处理</a></li>

    <li><a href="/soms/admin/makesuremessage">报销信息确认</a></li>

    <li><a href="/soms/admin/logout">登出</a></li>



</ul>
</body>

</html>
