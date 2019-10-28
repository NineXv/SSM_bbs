<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/6/11
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>今日槽点</title>

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

<script>
    window.onload=function getData() {
        var mydata = new Array();
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${pageContext.request.contextPath}/user/findUser" ,//url
            data: "",
            contentType:'application/json;charset=UTF-8',

            success: function (result) {
                console.log(result)
                var resume = document.getElementById("resume");
                var uname = document.getElementById("uname");
                var company =  document.getElementById("company");
                var job =  document.getElementById("job");
                var role = document.getElementById("role");
                var email =  document.getElementById("ema");

                resume.src = result.resume;
                uname.innerText = result.username;
                company.innerText = result.company;
                job.innerText = result.job;
                role.innerText = result.role;
                email.innerText = result.email;
            },
            error : function() {
                alert("异常");
            }
        });
        getComments();
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
            <a href="main.jsp">
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
            <li class="header-icon dib"><img class="avatar-img" src="${pageContext.request.contextPath}/images/avatar/1.jpg" alt="" /> <span class="user-avatar">用户 <i class="ti-angle-down f-s-10"></i></span>
                <div class="drop-down dropdown-profile">
                    <div class="dropdown-content-heading">
                        <span class="text-left">吐吐吐</span>
                        <p class="trial-day">在线</p>
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
            <div class="main-content">



                <div class="main-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card alert">
                                <div class="card-body">
                                    <div class="user-profile">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="user-photo m-b-30">
                                                    <img id="resume" class="img-responsive" src="${pageContext.request.contextPath}/images/user-profile.jpg" alt="" />
                                                </div>
                                                <div class="user-work">
                                                    <h4>工作</h4>
                                                    <div class="work-content">
                                                        <h3>公司：</h3> <span id="company"></span>
                                                        <h3>职业：</h3> <span id="job"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div id="uname" class="user-profile-name">姓名</div>
                                                <div class="user-Location"><i class="ti-location-pin"></i> 中国</div>

                                                <div class="ratings">
                                                    <h4>帖子好评度</h4>
                                                    <div class="rating-star">
                                                        <span>8.9</span>
                                                        <i class="ti-star color-primary"></i>
                                                        <i class="ti-star color-primary"></i>
                                                        <i class="ti-star color-primary"></i>
                                                        <i class="ti-star color-primary"></i>
                                                        <i class="ti-star"></i>
                                                    </div>
                                                </div>
                                                <div>
                                                    <h4>权限：</h4> <h4 id="role"></h4>
                                                </div>
                                                <div class="user-send-message"><button class="btn btn-primary btn-addon" type="button"><i class="ti-email"></i>Send Message</button></div>
                                                <div class="custom-tab user-profile-tab">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">About</a></li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane active" id="1">
                                                            <div class="contact-information">
                                                                <h4>个人资料</h4>
                                                                <div class="phone-content">
                                                                    <span class="contact-title">Phone:</span>
                                                                    <span class="phone-number">未填写</span>
                                                                </div>

                                                                <div class="email-content">
                                                                    <span class="contact-title">Email:</span>
                                                                    <span id="ema" class="contact-email">邮箱地址</span>
                                                                </div>
                                                                <div class="website-content">
                                                                    <span class="contact-title">github</span>
                                                                    <span class="contact-website">ninexv</span>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /# column -->

                    </div>     </div>
                <!-- /# main content -->






                <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script><!-- jquery vendor -->
                <script src="${pageContext.request.contextPath}/js/lib/jquery.nanoscroller.min.js"></script><!-- nano scroller -->
                <script src="${pageContext.request.contextPath}/js/lib/sidebar.js"></script><!-- sidebar -->
                <script src="${pageContext.request.contextPath}/js/lib/bootstrap.min.js"></script><!-- bootstrap -->
                <script src="${pageContext.request.contextPath}/js/lib/mmc-common.js"></script>
                <script src="${pageContext.request.contextPath}/js/lib/mmc-chat.js"></script>
                <script src="${pageContext.request.contextPath}/js/scripts.js"></script><!-- scripit init-->

</div></div></div></div>

</body>

</html>