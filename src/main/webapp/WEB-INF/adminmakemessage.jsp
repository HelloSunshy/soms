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
    <title>医保报销模块</title>
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
                            订单id
                        </th>
                        <th>
                            医生姓名
                        </th>
                        <th>
                            学生姓名
                        </th>
                        <th>
                            订单备注
                        </th>

                        <th>
                            订单描述
                        </th>

                        <th>
                            完成时间
                        </th>

                        <th colspan="2">
                            操作
                        </th>

                    </tr>
                    </thead>
                    <tbody>



                    <c:forEach var="master" items="${orderMasterList.content}">
                    <tr>
                        <td>${master.orderMasterId}</td>

                        <c:set var="hls" value="1"></c:set>

                        <c:forEach items="${doctorList}" end="${hls}" var="user">

                            <c:if test="${user.doctorId.equals(master.doctorId)}">

                                <td>${user.doctorName}</td>

                                <c:set var="hls" value="0"></c:set>
                            </c:if>

                        </c:forEach>

                        <c:set var="hlsd" value="1"></c:set>

                        <c:forEach items="${userList}" end="${hlsd}" var="user">

                            <c:if test="${user.userId.equals(master.userId)}">

                                <td>${user.userName}</td>

                                <c:set var="hlsd" value="0"></c:set>
                            </c:if>

                        </c:forEach>

                        <td>${master.orderNotes}</td>
                        <td>${master.orderDescription}</td>
                        <td>${master.updateTime}</td>
                        <c:if test="${master.orderStatusToup==1}">
                        <td style="color: green"><a href="/soms/admin/agree?orderMasterId=${master.orderMasterId}">同意</a></td>

                        <td style="color: red"><a href="/soms/admin/dissagree?orderMasterId=${master.orderMasterId}">不同意</a></td>
                        </c:if>

                        <c:if test="${master.orderStatusToup==3}">
                            <td  colspan="2" style="color: green">报销成功</td>

                        </c:if>

                        <c:if test="${master.orderStatusToup==2}">
                            <td  colspan="2" style="color: red">报销失败</td>

                        </c:if>

                    </tr>
                    </c:forEach>


                    </tbody>
                </table>

                <c:if test="${allpagemaster.totalPages>1}">
                <ul class="pagination pull-right" style="width: auto;position: absolute; height: auto;margin-left: 70% " >

                    <c:if test="${currentPage==1}">

                        <li class="disabled">
                            <a href="#">上一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage>1}">

                        <li>
                            <a href="/soms/admin/success?page=${currentPage-1}&size=3">上一页</a>
                        </li>

                    </c:if>

                    <c:forEach var="i" begin="1" step="1" end="${allpagemaster.totalPages}">

                        <li>
                            <a href="/soms/admin/success?page=${i+1}&size=3">${i}</a>
                        </li>

                    </c:forEach>



                    <c:if test="${currentPage>=allpagemaster.totalPages}">

                        <li class="disabled">
                            <a href="#">下一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage<allpagemaster.totalPages}">

                        <li>
                            <a href="/soms/admin/success?page=${currentPage+1}&size=3">下一页</a>
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
