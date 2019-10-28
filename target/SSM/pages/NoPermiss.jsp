<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/6/19
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>管理</title>

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
    <link href="${pageContext.request.contextPath}/css/lib/owl.carousel.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/owl.theme.default.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/weather-icons.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/simdahs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>


</head>

<body onload="">

<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <li class="label">Main</li>
                <li class="active"><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="ti-home"></i> 今日槽点 </a></li>
                <li><a href="${pageContext.request.contextPath}/pages/user.jsp"><i class="ti-user"></i> 个人信息</a></li>
                <li><a href="${pageContext.request.contextPath}/pages/sendPost.jsp"><i class="ti-view-list-alt"></i> 发表帖子 </a></li>
                <li><a class="sidebar-sub-toggle"><i class="ti-target"></i> 管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/pages/management.jsp">删除</a></li>
                        <li><a href="${pageContext.request.contextPath}/pages/movie.jsp">添加</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div><!-- /# sidebar -->




<div class="header">
    <div class="pull-left">
        <div class="logo" id="sideLogo">
            <a href="index.html">
                <img class="full-logo" src="${pageContext.request.contextPath}/images/logo-big.png" alt="SimDahs">
                <img class="small-logo" src="${pageContext.request.contextPath}/images/logo-small.png" alt="SimDahs">
            </a>
        </div>
        <div class="hamburger sidebar-toggle">
            <span class="ti-menu"></span>
        </div>
    </div>

    <div class="pull-right p-r-15">
        <ul>
            <li class="header-icon dib"><i class="ti-bell"></i>
                <div class="drop-down">
                    <div class="dropdown-content-heading">
                        <span class="text-left">无</span>
                    </div>


            <li class="header-icon dib chat-sidebar-icon"><i class="ti-comment"></i></li>
            <li class="header-icon dib"><img class="avatar-img" src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt="" />
                <span class="user-avatar">用户 <i class="ti-angle-down f-s-10"></i></span>
                <div class="drop-down dropdown-profile">
                    <div class="dropdown-content-heading">
                        <span class="text-left">吐吐吐</span>
                        <p class="trial-day">槽点</p>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li><a href="#"><i class="ti-user"></i> <span>Profile</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/pages/login.jsp"><i class="ti-wallet"></i> <span>登陆</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/pages/regist.jsp"><i class="ti-write"></i> <span>注册</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/exit"><i class="ti-calendar"></i> <span>退出</span></a></li>

                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>


<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <h1>主页</h1>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">欢迎</a></li>
                                <li class="active"></li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->
            <div>
                <h3>你没有权限,请登陆管理员账号</h3>
            </div>


                <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script><!-- jquery vendor -->
                <script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script><!-- nano scroller -->
                <script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
                <script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
                <script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
                <!--  Chart js -->
                <script src="${pageContext.request.contextPath}/js/lib/chart-js/Chart.bundle.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/chart-js/chartjs-init.js"></script>
                <!-- // Chart js -->


                <script src="${pageContext.request.contextPath}/js/lib/sparklinechart/jquery.sparkline.min.js"></script><!-- scripit init-->
                <script src="${pageContext.request.contextPath}/js/lib/sparklinechart/sparkline.init.js"></script><!-- scripit init-->

                <!--  Datamap -->
                <script src="${pageContext.request.contextPath}/js/lib/datamap/d3.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/datamap/topojson.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/datamap/datamaps.world.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/datamap/datamap-init.js"></script>
                <!-- // Datamap -->-->
                <script src="${pageContext.request.contextPath}/js/lib/weather/jquery.simpleWeather.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/weather/weather-init.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/owl-carousel/owl.carousel.min.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/owl-carousel/owl.carousel-init.js"></script>
                <script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->
</body>
</html>
