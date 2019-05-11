<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-14
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>学生报错信息处理</title>
</head>
<link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

<body style="width: 100%; height: 100%">
<div>
<div >

    <%@include file="adminleft.jsp"%>

</div>

<div class="container-left" style="width:83%;margin-left: 15.5%;">
    <div class="container-fluid" >
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-bordered table-hover table-condensed">
                    <thead>
                    <tr>
                        <th>
                            学生id
                        </th>
                        <th>
                            姓名
                        </th>
                        <th>
                            性别
                        </th>
                        <th>
                            登录名
                        </th>
                        <th>
                            密码
                        </th>


                        <th>
                            系部
                        </th>

                        <th>
                            班级
                        </th>

                        <th>
                            电话
                        </th>

                        <th  style="text-align: center">
                            操作
                        </th>

                    </tr>
                    </thead>
                    <tbody>



                    <c:forEach var="master" items="${alldoctorList.content}">
                    <tr>
                        <td>${master.userId}</td>

                        <td>${master.userName}</td>

                        <c:if test="${master.userSex==1}">
                            <td>男</td>
                        </c:if>

                        <c:if test="${master.userSex==2}">
                            <td>女</td>
                        </c:if>

                        <td>${master.userUsername}</td>
                        <td>${master.userPassword}</td>
                        <td>${master.userDept}</td>
                        <td>${master.userClass}</td>
                        <td>${master.userPhone}</td>
                        <td style="color: green"><a href="/soms/admin/userrequire?userId=${master.userId}" style="color: green">修改</a></td>
                    </tr>
                    </c:forEach>


                    </tbody>
                </table>

                <c:if test="${alldoctorList.totalPages>1}">
                <ul class="pagination pull-right" style="width: auto;position: absolute; height: auto;margin-left: 70% " >

                    <c:if test="${currentPage==1}">

                        <li class="disabled">
                            <a href="#">上一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage>1}">

                        <li>
                            <a href="/soms/admin/doctormanage?page=${currentPage-1}&size=10">上一页</a>
                        </li>

                    </c:if>

                    <c:forEach var="i" begin="1" step="1" end="${alldoctorList.totalPages}">

                        <li>
                            <a href="/soms/admin/doctormanage?page=${i+1}&size=10">${i}</a>
                        </li>

                    </c:forEach>



                    <c:if test="${currentPage>=alldoctorList.totalPages}">

                        <li class="disabled">
                            <a href="#">下一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage<alldoctorList.totalPages}">

                        <li>
                            <a href="/soms/admin/doctormanage?page=${currentPage+1}&size=10">下一页</a>
                        </li>

                    </c:if>
                </ul>
                </c:if>
            </div>

        </div>


    </div>
</div>



</div>

</body>
</html>
