<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="zh-cn">
<head>
    <title>高校医务室管理系统</title>
    ﻿<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate icon" type="image/png" href="i${pageContext.request.contextPath}/mages/favicon.png">
<link rel='icon' href='favicon.ico' type='image/x-ico' />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.min.css?t=227" />

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/handlebars/handlebars.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/iscroll/iscroll-probe.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/amazeui/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/raty/jquery.raty.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.min.js?t=1"></script>

</head>
<body>
<header class="hd">
    <div class="cml-g" >
        <div class="hd-left">
            <div class="hd-logo">

            </div>
            <div class="hd-company">
                <span style="color:#ed3da1;font-size:32px">太原理工大学高校医务室管理系统</span>

            </div>
        </div>

    </div>
</header>

<div class="hd-nav" style="background-color: darkblue"  >
    <button class="am-show-sm-only am-collapsed" data-am-collapse="{target: '.hd-navul'}">&#xe68b;</button>
    <nav >
        <ul class="hd-navul am-collapse" style="height: 0px; font-color:whites">
            <li class="one"><a href="">首页</a></li>
            <!--&lt;!&ndash; <li  ><a href="about.html">医师介绍</a></li> &ndash;&gt;-->
            <li><a href="/soms/user/order">在线预约</a></li>
            <%--<li><a href="/soms/">新闻中心</a></li>--%>
            <li><a href="/soms/base/tologin">用户登陆</a>
        </ul>
    </nav>
</div>


    <div class="am-cf"></div>
    <div class="am-slider am-slider-default" data-am-flexslider="{playAfterPaused: 8000}">
        <ul class="am-slides">
            <li><img src="${pageContext.request.contextPath}/images/1.png" /></li>
            <li><img src="${pageContext.request.contextPath}/images/2.png" /></li>
            <!-- <li><img src="images/lunbo.jpg" /></li> -->
        </ul>
    </div>


    ﻿<footer class="footer">
    <div class="cml-g">
        <h1>
          <a href="#">法律申明</a>
          <a href="#">隐私安全</a>
          <a href="#">网站地图</a>
          <a href="#">联系我们</a>
        </h1>
        <h2>
            <span>版权所有 2019-</span>
            <span>太原理工大学高校医务室管理系统</span>
            <span>备14010602060240</span>
        </h2>
        <h3>
            <span>地址:山西省太原市迎泽西大街79号 </span>
            <span>邮编:030024</span>
            <span>电话:0351-6010300</span>
        </h3>
<h3>
    </div>
</footer>
</body>
</html>