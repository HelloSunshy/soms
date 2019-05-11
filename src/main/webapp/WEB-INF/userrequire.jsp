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
    <title>学生信息修改</title>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">

</head>
<script>
    function isOK(){

        var li = $("#usernames").val();

        $.ajax({
            url:"/soms/admin/adduserByname",
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
<body>
<div>
    <%--<%@include file="top.jsp"%>--%>
</div>
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/admin/saveuser" method="post">

                <div>

                    <h1 style="margin-left:10%">学生信息</h1>

                </div>



                    <input name="userId" value="${user.userId}" hidden>

                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
                    <div class="col-sm-10" style="width:100px">
                        <input type="text" class="form-control" id="inputEmail3" name="userName" style=" width:150px "  value="${user.userName}" />
                    </div>
                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">性别：</label>

                    <div class="col-sm-10"  >
                        <label>

                            <c:if test="${user.userSex==1}">
                            <input type="radio" name="userSex"  value="1"   checked="true"   /><label style="margin-left:10px">男</label>
                            <input type="radio"  name="userSex"   value="2"  /><label style="margin-left:10px">女</label>
                            </c:if>

                                <c:if test="${user.userSex==2}">
                                    <input type="radio"   name="userSex"  value="1"  /><label style="margin-left:10px">男</label>

                                    <input type="radio" name="userSex" style="margin-left:10px" checked="true"  value="2"/><label style="margin-left:10px">女</label>
                            </c:if>

                            <c:if test="${user.userSex==null}">
                                <input type="radio"   name="userSex"  value="1"  /><label style="margin-left:10px">男</label>

                                <input type="radio" name="userSex" style="margin-left:10px" checked="true"  value="2"/><label style="margin-left:10px">女</label>
                            </c:if>
                        </label>

                    </div>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">登录名：</label>

                    <div class="col-sm-10"  >
                        <input type="text" class="form-control" id="usernames"  style=" width:150px " onchange="isOK()" name="userUsername" value="${user.userUsername}" />
                        <label id="eroes" style="color: red; display: none" > 登录名不可用</label>

                    </div>

                </div>



                <div class="form-group">
                    <label class="col-sm-2 control-label">密码：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="userPassword" style=" width:150px " value="${user.userPassword}" />
                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">系部：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="userDept" style=" width:150px " value="${user.userDept}" />

                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">班级：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="userClass" style=" width:150px " value="${user.userClass}" />

                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">电话：</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"   name="userPhone" style=" width:150px " value="${user.userPhone}" />

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
