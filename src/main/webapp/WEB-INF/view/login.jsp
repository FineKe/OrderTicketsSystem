<%--
  Created by IntelliJ IDEA.
  User: finefine.com
  Date: 2017/12/21
  Time: 下午4:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>KOS后台管理 登录</title>
    <link rel="shortcut icon" href="favicon.ico"> <link href="../../static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../../static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="../../static/css/animate.css" rel="stylesheet">
    <link href="../../static/css/style.css?v=4.1.0" rel="stylesheet">

    <style>
        body{
            text-align: center;
            background:#fff url("../../static/img/login-background.jpg") no-repeat left top;
            background-size:100%;
        }
    </style>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body background="../../static/img/login-background.jpg">

<div class="middle-box text-center loginscreen  animated fadeInDown" >
    <div>
        <div>

            <h1 class="logo-name">O</h1>

        </div>
        <h3>欢迎使用 O+</h3>

        <form class="m-t" role="form" action="/login" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="用户名" required="" value="admin" name="username">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="密码" required="" value="123456" name="password">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>


            <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
            </p>

        </form>
    </div>
</div>
<jsp:include page="common/footer.jsp"></jsp:include>
<!-- 全局js -->
<script src="../../static/js/jquery.min.js?v=2.1.4"></script>
<script src="../../static/js/bootstrap.min.js?v=3.3.6"></script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
<!--统计代码，可删除-->

</body>

</html>
