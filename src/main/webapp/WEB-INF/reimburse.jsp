<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-11
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线预约</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" ></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js" ></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" ></script>


</head>
<body>

<div>
    <%@include file="top.jsp"%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/user/toreimburse" method="post">


                <div>

                    <h1 style="margin-left:10%">医保报销</h1>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">请选择需要报销到订单号：</label>

                    <div class="col-sm-10"  >

                        <select style="width: 150px;" name="orderMasterId">

                            <option>请选择</option>

                            <c:forEach var="doctor" items="${byUserIdAndPayStatus}">

                                <option name="orderMasterId" value="${doctor.orderMasterId}">${doctor.orderMasterId}</option>

                            </c:forEach>

                        </select>




                    </div>

                </div>




                <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >
                    <%--<button type="submit" class="btn btn-success btn-default active" style="margin-left:60px" >确认</button>--%>

                    <button type="submit" class="btn btn-default active btn-danger" style="margin-left:10%">确认</button>

                </div>





        </form>
    </div>
</div>
</div>



</body>
</html>
