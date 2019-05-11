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
    <title>医生未处理订单</title>
</head>
<link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

<body style="width: 100%; height: 100%">
<div>
<div >
    <%@include file="left.jsp"%>

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
                            描述
                        </th>
                        <th>
                            创建时间
                        </th>

                        <th>
                            预定时间
                        </th>

                        <th>
                            状态
                        </th>

                        <th>
                            操作
                        </th>

                    </tr>
                    </thead>
                    <tbody>


                    <c:forEach var="master" items="${allpagemaster.content}">
                    <tr>
                        <td>${master.userId}</td>

                        <c:set var="hls" value="1"></c:set>

                        <c:forEach items="${alluser}" end="${hl}" var="user">

                            <c:if test="${user.userId.equals(master.userId)}">

                                <td>${user.userName}</td>

                                <c:set var="hls" value="0"></c:set>
                            </c:if>

                        </c:forEach>

                        <td>${master.orderDescription}</td>
                        <td>${master.createTime}</td>
                        <td>${master.orderTime}</td>
                        <td style="color: red">未处理</td>
                        <td style="color: green"><a href="/soms/doctor/receivermessage?orderMasterId=${master.orderMasterId}">详情</a></td>
                    </tr>
                    </c:forEach>


                    </tbody>
                </table>
                <ul class="pagination pull-right" style="width: auto;position: absolute; height: auto;margin-left: 70% " >

                    <c:if test="${currentPage==1}">

                        <li class="disabled">
                            <a href="#">上一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage>1}">

                        <li>
                            <a href="/soms/doctor/login?page=${currentPage-1}&size=3">上一页</a>
                        </li>

                    </c:if>

                    <c:forEach var="i" begin="1" step="1" end="${allpagemaster.totalPages}">

                        <li>
                            <a href="/soms/doctor/login?page=${i+1}&size=3">${i}</a>
                        </li>

                    </c:forEach>



                    <c:if test="${currentPage>=allpagemaster.totalPages}">

                        <li class="disabled">
                            <a href="#">下一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage<allpagemaster.totalPages}">

                        <li>
                            <a href="/soms/doctor/login?page=${currentPage+1}&size=3">下一页</a>
                        </li>

                    </c:if>
                </ul>
            </div>

        </div>


    </div>
</div>



</div>

</body>
</html>
