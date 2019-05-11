
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>

<html>
<head>
    <title>信息确认</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<script>

    function drug(){

        var li = $("#se option:selected").val();

        $.ajax({
                    url:"/soms/doctor/drug",
                    async:true,
                    type:"get",
                    data:{"drugCategoryId":li},
                    success:function(da){
                        var i;
                        var html = "";//用一个变量来存储json中的数据



                        for (i = 0; i < da.data.length; i++) { //用for循环遍历数组将数据存入html变量中

                            html += "\<tr style='width: 200px'>"+

                            "<td>"+da.data[i].drugInfoId+"</td>"+

                            "<td>"+da.data[i].drugInfoName+"</td>"+

                            "<td>"+da.data[i].drugInfoQuenity+"</td>"+

                            "<td> <a onclick='adddrug("+da.data[i].drugInfoId+",`"+da.data[i].drugInfoName+"`)'>" +"添加"+" </a></td>"+

                            "</tr>"

                       }

                        document.getElementById("drugs").innerHTML +=html;

                        html ="";

                     },
                     error:function(){

                      alert("请求失败");

                       },
                       dataType:"json",
        });

        document.getElementById("min").removeAttribute("hidden");

    }




    function adddrug(v1,v2) {


        document.getElementById("drugadd").removeAttribute("hidden");

        document.getElementById("adddrug").append(v2+", 数量:"+1+"\n ");

        document.getElementById("drugids").value.append(v1+",")


    }




</script>
<body>
<div>
    <%@include file="tops.jsp"%>
</div>
<div class="container" style="margin-left:32%; " >
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal"  action="/soms/doctor/diagnose" method="post" onsubmit="return checks()">

                <div>

                    <h1 style="margin-left:10%">诊断信息模块</h1>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">症状描述</label>
                    <div class="col-sm-10" style="width:100px">
                        <textarea name="orderDescription" cols="25" rows="7" readonly="true" >${orderMaster.orderDescription}</textarea>
                    </div>
                </div>



                <input  name="orderMasterId" value="${orderMaster.orderMasterId}" hidden/>



        <div class="form-group">
                    <label  class="col-sm-2 control-label">药品类别选择：</label>

                    <div class="col-sm-10">
                        <select name="drugCategoryId" onchange="drug()" id="se">

                            <option>请先选择药品类别</option>

                            <c:forEach items="${drugCategory}" var="cateroty">

                                <option name="drugCategoryId"  id="helo" value="${cateroty.drugCategoryId}">${cateroty.drugCategoryName}</option>

                            </c:forEach>

                        </select>


                    </div>

        </div>

                <div class="form-group" >

                    <div  class="col-sm-6 control-label" style="margin-left: 15px">


                        <table class="table">
                            <tbody id="toy" style="width:200px;">
                            <tr id="min" hidden="true">

                                <th>药品Id</th>
                                <th>药品名称</th>
                                <th>药品数量</th>
                                <th>操作</th>

                            </tr>

                            </tbody>
                            <tbody id="drugs" style="width:200px">
                            </tbody>
                        </table>

                    </div>
                </div>


        <div class="form-group"  hidden id="drugadd">
                    <label  class="col-sm-2 control-label">已开药品清单：</label>

                    <div class="col-sm-10"  >
                        <textarea name="ids" cols="25" rows="7"  id="adddrug"></textarea>
                    </div>

                </div>




                <div class="form-group" >
                    <label  class="col-sm-2 control-label">备注：</label>

                    <div class="col-sm-10"  >
                        <textarea name="notes" cols="25" rows="7" id="nots" ></textarea>
                    </div>

                </div>



                <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >
                    <button type="submit" class="btn btn-success btn-default active" style="margin-left:60px"  onchange="return checks()" >确认</button>

                    <button type="button" class="btn btn-default active btn-danger" style="margin-left:20%"><a href="/soms/doctor/login" style="color: white">退出</a></button>

                </div>









            </form>
    </div>
</div>
</body>
<script>

    function checks() {


        var vale =   $("#se option:selected").val();


        if (vale=="药品类别选择") {

            alert("请先选择药品类别");

            return false;

        }

        var res = $("#adddrug").val();


        if (res==""){

            alert("请添加药品")

            return false;
        }
        var notess = $("#nots").val();


        if (notess==""){

            alert("请添加医嘱")

            return false;
        }



    }

</script>
</html>
