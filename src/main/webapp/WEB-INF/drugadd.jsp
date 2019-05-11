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
    <title>药品信息添加</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<script>

    function checksdrug() {


        var drugname = $("#names").val();


        if (drugname==""){

            alert("药品名称不能为空");

            return false;

        }


        var category = $("#cate option:selected").val();

        if (category=="请选择药品类别"){
            alert("请选择药品类别");
            return false;
        }

        var drugdescr = $("#drugdes").val();

        if (drugdescr == ""){

            alert("请添加药品描述");

            return false;
        }

        var drugpricr = $("#price").val();

        if (drugpricr ==""){

            alert("请添加药品价格");

        }

        var drugquen = $("#quentity").val();

        if (drugquen==""){

            alert("数量不能为空");

            return false;
        }





    }

</script>
<div>
    <%--<%@include file="top.jsp"%>--%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/admin/adddrug" method="post">

                <div>

                    <h1 style="margin-left:10%">药品信息添加</h1>

                </div>





                <div class="form-group">
                    <label  class="col-sm-2 control-label">药品名称：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="names" name="drugInfoName" style=" width:150px "  value="${drugInfo.drugInfoName}" />
                    </div>
                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">药品类别：</label>

                    <div class="col-sm-10"  >
                        <select name="drugInfoType" id="cate">

                            <option> 请选择药品类别</option>

                            <c:forEach items="${drugcategorylist}" var="drugcategory">



                                    <option name="drugInfoType" value="${drugcategory.drugCategoryId}">${drugcategory.drugCategoryName}</option>


                            </c:forEach>

                        </select>

                    </div>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">药品描述：</label>

                    <div class="col-sm-10"  >

                        <textarea name="drugInfoDescription" rows="7" id="drugdes"></textarea>


                    </div>

                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">药品价格：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="price"   name="drugInfoPrice" style=" width:150px "  />
                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">药品数量：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="quentity"  name="drugInfoQuenity" style=" width:150px "  />

                    </div>

                </div>




                <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >

                    <button type="submit" class="btn btn-success btn-default active" style="margin-left:60px" onclick="return checksdrug()">确认</button>

                    <button type="button" class="btn btn-default active btn-danger" style="margin-left:20%" onclick="history.go(-1)">返回</button>

                </div>





        </form>
    </div>
</div>

</body>
</html>
