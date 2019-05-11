<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>


<html ng-app="app">
<head>
    <title>在线预约</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/datajs/angular.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/datajs/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/datajs/wui-date.js"></script>

    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js" ></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datacss/wui.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/datacss/style.css">


    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js" ></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js" ></script>


</head>
<script>

    var app = angular.module('app', ["wui.date"]);

    function doctomessage() {

        var li = $("#se option:selected").val();

        $.ajax({



            url:"/soms/user/doctor",
            async:true,
            type:"get",
            data:{"doctorId":li},
            success:function(da){

                alert(da.data.doctorNotes)

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
    <%@include file="top.jsp"%>
</div>
<c:if test="${username.userStatue ==1}">
<div class="container" style="margin-left:32%">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form class="form-horizontal" role="form" action="/soms/user/create" method="post">


                <div>

                    <h1 style="margin-left:10%">预约信息确定</h1>

                </div>

                <div class="form-group" >
                    <label  class="col-sm-2 control-label">医生选择：</label>

                    <div class="col-sm-10"  >

                        <select style="width: 150px;" name="doctorId" id="se" onchange="doctomessage()">

                            <option>请选择预约医生</option>

                            <c:forEach var="doctor" items="${doctorlist}">

                                <option name="doctorId"  value="${doctor.doctorId}">${doctor.doctorName}</option>

                            </c:forEach>

                        </select>




                    </div>

                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">症状：</label>
                    <div class="col-sm-10" style="width:180px">

                        <select style="width: 150px;" name="notesname" id="sr">

                            <option>简单症状描述</option>

                            <c:forEach var="sym" items="${allSymptom}">

                                <option value="${sym.notesName}" name="notesname">${sym.notesName}</option>

                            </c:forEach>

                        </select>

                    </div>
                </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">其他：</label>
                    <div class="col-sm-10" style="width:180px">
                        <textarea name="orderDescription" cols="25" rows="7" id="otheronte"></textarea>
                    </div>
                </div>




                <div class="form-group">
                    <label  class="col-sm-2 control-label">预约时间：</label>
                    <div class="col-sm-10" >
                    <div class="wui-area">
                        <wui-date format="yyyy-mm-dd hh:mm" name="dataname"
                                  placeholder="请选择日期"
                                  id="date3"
                                  btns="{'ok':'确定','now':'此刻'}"
                                  ng-model="date3">
                        </wui-date>
                    </div>
                    </div>
                </div>

                <input name="userId" value="${sessionScope.get("id")}" hidden/>


                <div class="col-md-12 column" style="margin-left:6%;margin-top:10px" >
                    <button type="submit" class="btn btn-success btn-default active" style="margin-left:60px"  onclick="return sure()">确认</button>

                    <button type="button" class="btn btn-default active btn-danger" style="margin-left:10%"><a href="/soms/user/toindex" style="color:white">退出</a></button>

                </div>






        </form>
    </div>
</div>
</div>
</c:if>

<c:if test="${username.userStatue!=1}">

    <div>
        <script>
            alert("请先确认信息");
        </script>

        <script>

            setTimeout(function(){
                window.location.href="/soms/user/login";
            },1000)

        </script>

    </div>

</c:if>

<script>
    function  sure(){

        var flag =false;

        var datas =   $("input[name='dataname']").val();


        if (datas==""){

            alert("时间未选择");

            return false;

        }

        var li = $("#se option:selected").val();


        if (li=="请选择预约医生"){

            alert("医生未选择");

            return false;
        }

        var simenotes = $("#sr option:selected").val();

        var notes = $("#otheronte").val();

        if (simenotes =="简单症状描述" && notes ==""){

            alert("未添加症状描述");

            return false;

        }


        $.ajax({

            url:"/soms/user/createsure",
            async:false,
            type:"get",
            success:function(da){


                if (da.data.length >= 1){

                    alert("你有订单未处理完毕");

                    flag = true;
                }

            },
            error:function(){

                alert("请求失败");

            },
            dataType:"json",
        });

        if (flag){

            return false;
        }


    }


</script>
</body>
</html>
