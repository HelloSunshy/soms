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
    <title>医生管理模块</title>
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
                            医生id
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
                            擅长
                        </th>

                        <th>
                            创建时间
                        </th>
                        <th colspan="2" style="text-align: center">
                            操作
                        </th>

                    </tr>
                    </thead>
                    <tbody>



                    <c:forEach var="master" items="${alldoctorList.content}">
                    <tr>
                        <td>${master.doctorId}</td>

                        <td>${master.doctorName}</td>

                        <c:if test="${master.doctorSex==1}">
                            <td>男</td>
                        </c:if>

                        <c:if test="${master.doctorSex==2}">
                            <td>女</td>
                        </c:if>

                        <td>${master.doctorUsername}</td>
                        <td>${master.doctorPassword}</td>
                        <td>${master.doctorNotes}</td>
                        <td>${master.createTime}</td>
                        <td style="color: red"> <a href="/soms/admin/deletedoctorId?doctorId=${master.doctorId}" style="color: red">删除</a></td>

                        <td style="color: green"><a href="/soms/admin/doctorrequire?doctorId=${master.doctorId}" style="color: green">修改</a></td>
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
