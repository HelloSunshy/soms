<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-13
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>信息确认</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div>
    <%--<%@include file="top.jsp"%>--%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form">

                <div>

                    <h1 style="margin-left:9%; ">诊断详细信息</h1>

                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">诊断医生姓名：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="inputEmail3" style=" width:150px " readonly="true" value="${doctorIndo.doctorName}" />
                    </div>
                </div>



                <div class="form-group">
                    <label  class="col-sm-2 control-label">订单详情：</label>
                                <div class="col-md-10">
                                    <table class="table" style="width: 160px;">
                                        <thead>
                                        <tr>
                                            <th>药品</th>
                                            <th>数量</th>
                                        </tr>
                                        </thead>
                                        <c:forEach var="orderDetil" items="${orderMasterlist}" >
                                        <tr>
                                            <th>${orderDetil.drugName}</th>

                                            <th>${orderDetil.drugQuentily}</th>

                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>

                        </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">诊断时间：</label>
                        <div class="col-sm-10">
                          <input readonly  class="form-control"  value="${orderMasterlist.get(0).updateTime}" type="text" style="width:160px">
                        </div>
                    </div>



                        <div class="form-group">
                            <label  class="col-sm-2 control-label">订单总价：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  style=" width:160px " readonly="true" value="${orderMaster.orderPrice}" />
                            </div>
                        </div>


                    <div class="form-group">

                        <label  class="col-sm-2 control-label" >医嘱：</label>

                        <div class="col-sm-10">
                            <textarea readonly rows="7" class="form-control" style="width:160px">  ${orderMaster.orderNotes}</textarea>
                        </div>

                    </div>



                            <%--<div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >--%>

                <c:if test="${orderMaster.payStatus==1}"  >

                <div class="col-sm-10">

                    <button type="button" class="btn btn-success btn-default active" style="margin-left:60px"><a href="/soms/user/login" style="color: white">确认</a></button>



                        <button type="button" class="btn btn-success btn-default active" style="margin-left:270px"><a href="/soms/user/payOrder?orderMasterId=${orderMaster.orderMasterId}" style="color: white">支付订单</a></button>



                </div>

                </c:if>

                <c:if test="${orderMaster.payStatus!=1}">

                <div class="col-sm-10">

                    <button type="button" class="btn btn-success btn-default active" style="margin-left:25%"><a href="/soms/user/login" style="color: white">确认</a></button>

                </div>

                </c:if>




<%--<button type="button" class="btn btn-default active btn-danger" style="margin-left:20%"><a href="/soms/user/loginout" style="color: white">退出</a></button>--%>

                </div>






        </form>
    </div>
</div>
</body>
</html>
