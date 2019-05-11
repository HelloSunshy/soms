<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-11
  Time: 08:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生以往病例</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div>
    <%@include file="top.jsp"%>
</div>

<c:if test="${username.userStatue==1}">

<div class="container-left" >
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-bordered table-condensed">
                <thead>
                <tr>
                    <th>
                        订单Id
                    </th>
                    <th>
                        医生
                    </th>

                    <th>
                        订单状态
                    </th>
                    <th>
                        症状描述
                    </th>
                    <th>
                        创建时间
                    </th>

                    <th>
                        预约时间
                    </th>

                    <th>
                        更新时间
                    </th>

                    <th>
                        支付状态
                    </th>

                    <th>
                        操作
                    </th>
                </tr>
                </thead>
                <tbody>

                <c:forEach var="master" items="${pageMasterlist.content}" >

                <tr>
                    <td>${master.orderMasterId}</td>

                    <c:set var="hl" value="1"></c:set>

                    <c:forEach var="doctor" items="${doctorlist}" end="${hl}">
                    <c:if test="${doctor.doctorId.equals(master.doctorId)}">
                    <td>${doctor.doctorName}</td>
                        <c:set var="hl" value="0"></c:set>
                    </c:if>
                    </c:forEach>


                    <c:if test="${master.orderStatus==1}">
                    <td style="color: red">待预约</td>
                    </c:if>


                    <c:if test="${master.orderStatus==2}">
                        <td style="color: #c85e0b">预约成功</td>
                    </c:if>

                    <c:if test="${master.orderStatus==3}">
                        <td style="color: #1b961b">完结</td>
                    </c:if>


                    <td>${master.orderDescription}</td>
                    <td>${master.createTime}</td>
                    <td>${master.orderTime}</td>

                    <td>${master.updateTime}</td>

                    <c:if test="${master.payStatus==1}">
                    <td style="color: red">未支付</td>
                    </c:if>
                    <c:if test="${master.payStatus==2}">
                    <td style="color: green">已支付 </td>

                </c:if>
                    <c:if test="${master.payStatus==3}">
                        <td style="color: green">已支付 </td>

                    </c:if>
                    <c:if test="${master.orderStatus==3}">
                    <td><a href="/soms/user/touserMessage?orderMasterId=${master.orderMasterId}">详情</a></td>
                    </c:if>
                    <c:if test="${master.orderStatus!=3}">
                        <td>详情</td>
                    </c:if>
                </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column ">
                <ul class="pagination pull-right">

                    <c:if test="${currentPage==1}">
                    <li class="disabled">
                        <a href="#">上一页</a>
                    </li>
                    </c:if>

                    <c:if test="${currentPage>1}">

                        <li>
                            <a href="/soms/user/login?page=${currentPage-1}&size=3">上一页</a>
                        </li>

                    </c:if>



                    <c:forEach var="i" begin="1"  end="${allpage}" step="1" >

                        <li>
                            <a href="/soms/user/login?page=${i+1}&size=3">${i}</a>
                        </li>

                    </c:forEach>

                    <%--<li>--%>
                        <%--<a href="#">1</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">2</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">3</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">4</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">5</a>--%>
                    <%--</li>--%>
                    <c:if test="${currentPage==allpage}">
                        <li class="disabled">
                            <a href="#">下一页</a>
                        </li>
                    </c:if>

                    <c:if test="${currentPage!=allpage}">
                        <li >
                            <a href="/soms/user/login?page=${currentPage+1}&size=3">下一页</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${username.userStatue !=1}">
    <div class="container">
        <div class="row clearfix" style="margin-top: 30%; margin-left: 35%">
            <div class="col-md-12 column" style="margin-left: 10%">
                <button type="button" class="btn btn-default btn-warning active" style="position: center" ><a style="color: white" href="/soms/user/tomessage">请先确认信息</a></button>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>
