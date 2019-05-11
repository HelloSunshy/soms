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
    <title>诊断信息模块</title>
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

                    <h1 style="margin-left:10%">诊断详细信息</h1>

                </div>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="inputEmail3" style=" width:150px " readonly="true" value="${username.userName}" />
                    </div>
                </div>

                <div class="form-group" >
                    <label for="inputPassword3" class="col-sm-2 control-label">性别：</label>

                    <div class="col-sm-10"  >
                        <label>

                            <c:if test="${username.userSex==1}">
                            <input type="radio"    readonly="true"  checked="true"  onclick="return false" /><label style="margin-left:10px">男</label>
                            <input type="radio"    readonly="true"   onclick="return false" /><label style="margin-left:10px">女</label>
                            </c:if>

                                <c:if test="${username.userSex==2}">
                                    <input type="radio"    readonly="true"    onclick="return false" /><label style="margin-left:10px">男</label>

                                    <input type="radio"    readonly="true" checked="true" onclick="return false"  style="margin-left:10px" /><label style="margin-left:10px">女</label>
                            </c:if>
                        </label>

                    </div>

                </div>

                <div class="form-group" >
                    <label for="inputPassword3" class="col-sm-2 control-label">学院：</label>

                    <div class="col-sm-10"  >
                        <input type="text" class="form-control"   style=" width:150px " readonly="true" value="${username.userDept}" />
                    </div>

                </div>



                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">班级：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   style=" width:150px " readonly="true" value="${username.userClass}" />
                    </div>

                </div>

                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">电话：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputPassword3"  style=" width:150px " readonly="true"  value="${username.userPhone}" />
                    </div>

                </div>

                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">主治医师：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"  style=" width:150px " readonly="true"  value="${doctor.doctorName}" />
                    </div>

                </div>

                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">订单详情：</label>
                    <div class="col-sm-10">
                        <div class="container">
                            <div class="row clearfix">
                                <div class="col-md-12 column left">
                                    <table class="table" style="width: 300px">
                                        <thead>
                                        <tr>
                                            <th>药品</th>
                                            <th>数量</th>
                                            <th>诊断时间</th>
                                        </tr>
                                        </thead>
                                        <c:forEach var="orderDetil" items="${orderDetailList}" >
                                        <tr>
                                            <th>${orderDetil.drugName}</th>

                                            <th>${orderDetil.drugQuentily}</th>

                                            <th>${orderDetil.updateTime}</th>


                                        </tr>
                                        </c:forEach>
                                    </table>
                                </div>

                        </div>
                    </div>
                </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">医嘱：</label>
                        <div class="col-sm-10">
                            <div class="container">
                                <div class="row clearfix">
                                    <div class="col-md-12 column left">

                                        <textarea readonly rows="7">${orderMaster.orderNotes}</textarea>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >

                    <button type="button" class="btn btn-success btn-default active" style="margin-left:60px"><a href="/soms/admin/success" style="color: white">确认</a></button>

                    <%--<button type="button" class="btn btn-default active btn-danger" style="margin-left:20%"><a href="/soms/user/loginout" style="color: white">退出</a></button>--%>

                </div>






        </form>
    </div>
</div>
</body>
</html>
