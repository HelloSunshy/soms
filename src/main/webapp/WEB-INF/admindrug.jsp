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
    <title>药品管理模块</title>
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
                            药品Id
                        </th>
                        <th>
                            药品名称
                        </th>

                        <th>
                            药品类别
                        </th>

                        <th>
                            药品描述
                        </th>

                        <th>
                            药品价格
                        </th>

                        <th>
                            药品数量
                        </th>

                        <th>
                            状态
                        </th>

                        <th colspan="2">
                            操作
                        </th>

                    </tr>
                    </thead>
                    <tbody>



                    <c:forEach var="master" items="${drugList.content}">
                    <tr>
                        <td>${master.drugInfoId}</td>

                        <td>${master.drugInfoName}</td>

                        <c:set var="hls" value="3"></c:set>

                        <c:forEach items="${drugCategory}" end="${hls}" var="user">

                            <c:if test="${user.drugCategoryId.equals(master.drugInfoType)}">

                                <td>${user.drugCategoryName}</td>

                                <c:set var="hls" value="0"></c:set>
                            </c:if>

                        </c:forEach>

                        <td>${master.drugInfoDescription}</td>
                        <td>${master.drugInfoPrice}</td>

                        <td>${master.drugInfoQuenity}</td>

                        <c:if  test="${master.drugInfoStatue==1}">

                        <td style="color: red"> 未出售</td>
                            <td style="color: green"><a style="color: green" href="/soms/admin/changedrugon?drugId=${master.drugInfoId}">上架</a></td>
                            <td style="color: green"><a style="color: red" href="/soms/admin/requiredrugon?drugId=${master.drugInfoId}">修改</a></td>


                        </c:if>


                        <c:if  test="${master.drugInfoStatue==2}">

                            <td style="color: green"> 在售</td>

                            <td style="color: red" colspan="2"><a style="color: red" href="/soms/admin/changedrugoff?drugId=${master.drugInfoId}">下架</a></td>

                        </c:if>

                    </tr>
                    </c:forEach>


                    </tbody>
                </table>

                <c:if test="${drugList.totalPages>1}">
                <ul class="pagination pull-right" style="width: auto;position: absolute; height: auto;margin-left: 70% " >

                    <c:if test="${currentPage==1}">

                        <li class="disabled">
                            <a href="#">上一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage>1}">

                        <li>
                            <a href="/soms/admin/drugmanage?page=${currentPage-1}&size=5">上一页</a>
                        </li>

                    </c:if>

                    <c:forEach var="i" begin="1" step="1" end="${drugList.totalPages}">

                        <li>
                            <a href="/soms/admin/drugmanage?page=${i+1}&size=5">${i}</a>
                        </li>

                    </c:forEach>



                    <c:if test="${currentPage>=drugList.totalPages}">

                        <li class="disabled">
                            <a href="#">下一页</a>
                        </li>

                    </c:if>

                    <c:if test="${currentPage<drugList.totalPages}">

                        <li>
                            <a href="/soms/admin/drugmanage?page=${currentPage+1}&size=5">下一页</a>
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
