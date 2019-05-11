<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-13
  Time: 09:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>


<html>
<head>
    <title>药品信息修改</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<div>
    <%--<%@include file="top.jsp"%>--%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/admin/savedrug" method="post">

                <div>

                    <h1 style="margin-left:10%">药品信息修改</h1>

                </div>



                    <input name="drugInfoId" value="${drugInfo.drugInfoId}" hidden>

                    <input name="drugInfoStatue" value="${drugInfo.drugInfoStatue}" hidden>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">药品名称：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="inputEmail3" name="drugInfoName" style=" width:150px "  value="${drugInfo.drugInfoName}" />
                    </div>
                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">药品类别：</label>

                    <div class="col-sm-10"  >
                        <select name="drugInfoType">

                            <%--<option> 请选择药品类别</option>--%>

                                <c:forEach items="${drugcategorylist}" var="drugcategory">


                                    <c:if test="${drugcategory.drugCategoryId==drugInfo.drugInfoType}">

                                    <option name="drugInfoType" value="${drugcategory.drugCategoryId}">${drugcategory.drugCategoryName}</option>

                                    </c:if>

                                </c:forEach>

                            <c:forEach items="${drugcategorylist}" var="drugcategory">



                                    <option name="drugInfoType" value="${drugcategory.drugCategoryId}">${drugcategory.drugCategoryName}</option>


                            </c:forEach>

                        </select>

                    </div>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">药品描述：</label>

                    <div class="col-sm-10"  >

                        <textarea name="drugInfoDescription" rows="7">${drugInfo.drugInfoDescription}</textarea>


                    </div>

                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">药品价格：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="drugInfoPrice" style=" width:150px " value="${drugInfo.drugInfoPrice}" />
                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">药品数量：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="drugInfoQuenity" style=" width:150px " value="${drugInfo.drugInfoQuenity}" />

                    </div>

                </div>




                <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >

                    <button type="submit" class="btn btn-success btn-default active" style="margin-left:60px">确认</button>

                    <button type="button" class="btn btn-default active btn-danger" style="margin-left:20%" onclick="history.go(-1)">返回</button>

                </div>





        </form>
    </div>
</div>
</body>
</html>
