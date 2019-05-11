<%--
  Created by IntelliJ IDEA.
  User: sunshy
  Date: 2019-04-13
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

    <title></title>
</head>
<body>
<div style="position:relative; background-color:black">
    <input type='text' class="form-control" id='datetime'  onclick="hel()" />
</div>
<script>
    function hel() {
        $("#datetime").datetimepicker({
            format: 'YYYY-MM-DD hh:mm',
            locale: moment.locale('zh-cn')
        });
    };
</script>
</body>
</html>
