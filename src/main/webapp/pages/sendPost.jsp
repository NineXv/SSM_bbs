<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/6/18
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>个人帖子</title>

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
    <link href="${pageContext.request.contextPath}/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/lib/sidebar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/lib/simdahs.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
    <script>
        function sendPost() {
            // var movie = $('#movie').val();
            var topic = $('#topic').val();
            var content = $('#pcontent').val();
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/post/sendPost" ,//url
                data: JSON.stringify({
                    // movieName: movie,
                    mname: topic,
                    pcontent: content
                }),
                contentType:'application/json;charset=UTF-8',

                success: function () {
                    alert("成功");
                },
                error : function() {
                    alert("失败----原因：未找到电影或您的账号未激活");
                }
            });
        }
    </script>
</head>
<body>

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
            <a href="${pageContext.request.contextPath}/pages/main.jsp">
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
                            <h1>发帖子</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="#">写</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>发表你的想法</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="doc-link"><a href="#"><i class="ti-link"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">

                                    <form>
                                        <%--<div class="form-group">--%>
                                            <%--<p class="text-muted m-b-15 f-s-12">电影</p>--%>
                                            <%--<input  id="movie" type="text" class="form-control input-flat" placeholder="...">--%>
                                        <%--</div>--%>
                                        <div class="form-group">
                                            <p class="text-muted m-b-15 f-s-12">主题</p>
                                            <input id="topic" type="text" class="form-control input-default " placeholder="...">
                                        </div>
                                        <div class="form-group">
                                            <p class="text-muted m-b-15 f-s-12">内容</p>
                                            <input  id="pcontent" type="text" class="form-control input-flat" placeholder="...">
                                        </div>
                                        <div>
                                            <<input type="button" onclick="sendPost()" class="btn btn-warning"  value="提交" />
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div><!-- /# column -->


                    <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script><!-- jquery vendor -->
                    <script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script><!-- nano scroller -->
                    <script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
                    <script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
                    <script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
                    <script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
                    <script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->
</body>
</html>
