
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>高校医务室管理系统</title>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery1.7.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery1.42.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.SuperSlide.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var $tab_li = $('#tab ul li');
            $tab_li.hover(function(){
                $(this).addClass('selected').siblings().removeClass('selected');
                var index = $tab_li.index(this);
                $('div.tab_box > div').eq(index).show().siblings().hide();
            });
        });
    </script>
    <script type="text/javascript">
        $(function(){
            /*学生登录信息验证*/
            $("#stu_username_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入学号'){
                    $(this).val('');
                }
            });
            $("#stu_username_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入学号');
                }
            });
            $("#stu_password_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入密码'){
                    $(this).val('');
                }
            });
            $("#stu_password_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入密码');
                }
            });
            $("#stu_code_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入验证码'){
                    $(this).val('');
                }
            });
            $("#stu_code_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入验证码');
                }
            });
            $(".stu_login_error").Validform({
                tiptype:function(msg,o,cssctl){
                    var objtip=$(".stu_error_box");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                },
                ajaxPost:true
            });
            /*导师登录信息验证*/
            $("#tea_username_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入医师号'){
                    $(this).val('');
                }
            });
            $("#tea_username_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入医师号');
                }
            });
            $("#tea_password_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入密码'){
                    $(this).val('');
                }
            });
            $("#tea_password_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入密码');
                }
            });
            $("#tea_code_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入验证码'){
                    $(this).val('');
                }
            });
            $("#tea_code_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入验证码');
                }
            });
            $(".tea_login_error").Validform({
                tiptype:function(msg,o,cssctl){
                    var objtip=$(".tea_error_box");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                },
                ajaxPost:true
            });
            /*教务登录信息验证*/
            $("#sec_username_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入管理员账号'){
                    $(this).val('');
                }
            });
            $("#sec_username_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入管理员账号');
                }
            });
            $("#sec_password_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入密码'){
                    $(this).val('');
                }
            });
            $("#sec_password_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入密码');
                }
            });
            $("#sec_code_hide").focus(function(){
                var username = $(this).val();
                if(username=='输入验证码'){
                    $(this).val('');
                }
            });
            $("#sec_code_hide").focusout(function(){
                var username = $(this).val();
                if(username==''){
                    $(this).val('输入验证码');
                }
            });
            $(".sec_login_error").Validform({
                tiptype:function(msg,o,cssctl){
                    var objtip=$(".sec_error_box");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                },
                ajaxPost:true
            });
        });
    </script>
    <script type="text/javascript">
        $(function(){
            $(".screenbg ul li").each(function(){
                $(this).css("opacity","0");
            });
            $(".screenbg ul li:first").css("opacity","1");
            var index = 0;
            var t;
            var li = $(".screenbg ul li");
            var number = li.size();
            function change(index){
                li.css("visibility","visible");
                li.eq(index).siblings().animate({opacity:0},3000);
                li.eq(index).animate({opacity:1},3000);
            }
            function show(){
                index = index + 1;
                if(index<=number-1){
                    change(index);
                }else{
                    index = 0;
                    change(index);
                }
            }
            t = setInterval(show,8000);
            //根据窗口宽度生成图片宽度
            var width = $(window).width();
            $(".screenbg ul img").css("width",width+"px");
        });
    </script>
</head>

<body>
<div id="tab">
    <ul class="tab_menu">
        <li class="selected">学生登录</li>
        <li>医师登录</li>
        <li>管理员登录</li>
    </ul>
    <div class="tab_box">
        <!-- 学生登录开始 -->
        <div>
            <div class="stu_error_box"></div>
            <form action="/soms/user/login" method="post" >
                <div id="username">
                    <label>学&nbsp;&nbsp;&nbsp;号：</label>
                    <input type="text" id="stu_username_hide" name="username" value="输入学号" nullmsg="学号不能为空！" datatype="s6-18" errormsg="学号范围在6~18个字符之间！" sucmsg="学号验证通过！"/>
                    <!--ajaxurl="demo/valid.jsp"-->
                </div>
                <div id="password">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" id="stu_password_hide" name="password" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <%--<div id="code">--%>
                    <%--<label>验证码：</label>--%>
                    <%--<input type="text" id="stu_code_hide" name="code"  value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4" errormsg="验证码有4位数！" sucmsg="验证码验证通过！"/>--%>
                    <%--<img src="images/captcha.jpg" title="点击更换" alt="验证码占位图"/> </div>--%>

                <div id="login">
                    <button type="submit">登录</button>
                </div>
            </form>
        </div>
        <!-- 学生登录结束-->


        <!-- 医师登录开始-->
        <div class="hide">
            <div class="tea_error_box"></div>
            <form action="/soms/doctor/login" method="post" >
                <div id="username">
                    <label>医师号：</label>
                    <input type="text" id="tea_username_hide" name="username" value="输入医师号" nullmsg="医师号不能为空！" datatype="s6-18" errormsg="医师号范围在6~18个字符之间！" sucmsg="医师号验证通过！"/>
                    <!-- ajaxurl="demo/valid.jsp" -->
                </div>
                <div id="password">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" id="tea_password_hide" name="password" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <%--<div id="code">--%>
                    <%--<label>验证码：</label>--%>
                    <%--<input type="text" id="tea_code_hide" name="code"  value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4" errormsg="验证码有4位数！" sucmsg="验证码验证通过！"/>--%>
                    <%--<img src="images/captcha.jpg" title="点击更换" alt="验证码占位图"/> </div>--%>



                <div id="login">
                    <button type="submit">登录</button>
                </div>

                <!-- 医师登录开始-->

            </form>
        </div>

        <!-- 医师登录开始-->

        <div class="hide">
            <div class="sec_error_box"></div>
            <form action="/soms/admin/login" method="post" >
                <div id="username">
                    <label>管理账号：</label>
                    <input type="text" id="sec_username_hide" name="username" value="输入管理员账号" nullmsg="输入管理员账号不能为空！" datatype="s6-18" errormsg="输入管理员账号范围在6~18个字符之间！" sucmsg="输入管理员账号验证通过！"/>
                    <!--ajaxurl="demo/valid.jsp"-->
                </div>
                <div id="password">
                    <label>密&nbsp;&nbsp;&nbsp;码：</label>
                    <input type="password" id="sec_password_hide" name="password" value="输入密码" nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！" sucmsg="密码验证通过！"/>
                </div>
                <%--<div id="code">--%>
                    <%--<label>验证码：</label>--%>
                    <%--<input type="text" id="sec_code_hide" name="code"  value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4" errormsg="验证码有4位数！" sucmsg="验证码验证通过！"/>--%>
                    <%--<img src="images/captcha.jpg" title="点击更换" alt="验证码占位图"/> --%>
                <%--</div>--%>

                <div id="login">
                    <button type="submit">登录</button>
                </div>
            </form>
        </div>

    </div>
</div>

<div class="screenbg">
    <ul>
        <li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/0.jpg"></a></li>
        <li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/2.jpg"></a></li>
        <li><a href="javascript:;"><img src="${pageContext.request.contextPath}/images/3.jpg"></a></li>
    </ul>
</div>
</body>
</html>
