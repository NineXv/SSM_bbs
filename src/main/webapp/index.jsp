<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/5/21
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title></title>

        <!-- ================= Favicon ================== -->
        <!-- Standard -->
        <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
        <!-- Retina iPad Touch Icon-->
        <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
        <!-- Retina iPhone Touch Icon-->
        <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
        <!-- Standard iPad Touch Icon-->
        <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
        <!-- Standard iPhone Touch Icon-->
        <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">

        <!-- Styles -->
        <link href="${pageContext.request.contextPath}/css/lib/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/lib/themify-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/lib/simdahs.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    </head>
</head>

<body class="bg-primary">
<div class="unix-login">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="${pageContext.request.contextPath}/pages/main.jsp"><span>首页</span></a>
                    </div>
                    <div class="login-form">
                        <h4>Administratior Login</h4>
                        <form id="form1"  action="${pageContext.request.contextPath}/user/login" method="post" >
                            <div class="form-group">
                                <label>账号</label>
                                <input required id="username" name="username" type="text" class="form-control"/><hr />

                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <input required id="password" name="password" type="password" class="form-control"><hr/><br>
                            </div>
                            <input type="reset" value="重置" ></p>
                            <p><input type="submit" value="登陆" class="btn btn-primary btn-flat m-b-30 m-t-30">&nbsp;


                                <div class="register-link m-t-15 text-center">
                            <p>没有账户? <a href="${pageContext.request.contextPath}/pages/regist.jsp"> 点击注册</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</body>
</html>