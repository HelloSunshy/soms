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
    <title>医生信息</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<script>
    function isOK(){

        var li = $("#usernames").val();

    $.ajax({
        url:"/soms/admin/adddoctorByname",
        async:true,
        type:"get",
        data:{"username":li},
        success:function(da){

            if (da.data != null){

                document.getElementById("eroes").style.display="block";

            }else {

                document.getElementById("eroes").style.display="none";
            }



        },
        error:function(){

            alert("请求失败");

        },
        dataType:"json",
    });

    }


</script>
<div>
    <%--<%@include file="top.jsp"%>--%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/admin/savedoctor" method="post">

                <div>

                    <h1 style="margin-left:10%">医生信息</h1>

                </div>



                    <input name="doctorId" value="${doctor.doctorId}" hidden>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="inputEmail3" name="doctorName" style=" width:150px "  value="${doctor.doctorName}" />
                    </div>
                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">性别：</label>

                    <div class="col-sm-10"  >
                        <label>

                            <c:if test="${doctor.doctorSex==1}">
                            <input type="radio" name="doctorSex"  value="1"   checked="true"   /><label style="margin-left:10px">男</label>
                            <input type="radio"  name="doctorSex"   value="2"  /><label style="margin-left:10px">女</label>
                            </c:if>

                            <c:if test="${doctor.doctorSex==2}">
                                    <input type="radio"   name="doctorSex"  value="1"  /><label style="margin-left:10px">男</label>

                                    <input type="radio" name="doctorSex" style="margin-left:10px" checked="true"  value="2"/><label style="margin-left:10px">女</label>
                            </c:if>

                            <c:if test="${doctor.doctorSex==null}">

                                <input type="radio"   name="doctorSex"  value="1"  /><label style="margin-left:10px">男</label>

                                <input type="radio" name="doctorSex" style="margin-left:10px" checked="true"  value="2"/><label style="margin-left:10px">女</label>

                            </c:if>

                        </label>

                    </div>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">登录名：</label>

                    <div class="col-sm-10"  >
                        <input type="text" class="form-control" id="usernames" onchange="isOK()"   style=" width:150px "  name="doctorUsername" value="${doctor.doctorUsername}" />
                        <label id="eroes" style="color: red; display: none" > 登录名不可用</label>
                    </div>

                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">密码：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="doctorPassword" style=" width:150px " value="${doctor.doctorPassword}" />
                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">主治：</label>

                    <div class="col-sm-10">
                        <textarea rows="7" name="doctorNotes" >${doctor.doctorNotes}</textarea>
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
