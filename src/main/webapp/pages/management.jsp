<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

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
    <script>
        var mydata = new Array();
        $(document).ready(
            function getData() {
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "${pageContext.request.contextPath}/post/findPost" ,//url
                    data: "",
                    processData:false,
                    contentType: 'text/json,charset=utf-8',
                    cache: false,

                    success: function (result) {
                        for (var i=0;i<=result.length;i++)
                        {
                            mydata[i] = result[i];
                        }
                        console.log(mydata)
                        var topics = document.getElementsByName('topic');
                        var user = document.getElementsByName('user');
                        var datetime = document.getElementsByName('datetime');
                        var dlt = document.getElementsByName('dlt');
                        var look = document.getElementsByName('look');
                        for (let q=0;q<mydata.length;q++){
                            topics[q].innerText=mydata[q].mname;
                            user[q].innerText=mydata[q].pname;
                            datetime[q].innerText=mydata[q].pdate;
                            dlt[q].onclick = function () {
                                deletePost(mydata[q].pid)
                            };

                            look[q].innerHTML="<a href=\"${pageContext.request.contextPath}/pages/post.jsp?pid="+mydata[q].pid+"\" class=\"btn btn-warning\">浏览</a>";
                        }
                    },
                    error : function() {
                        alert("异常");
                    }
                });
            })
    </script>

    <script>
        function deletePost(q) {
            console.log(q);
            var mydata = new Array();
            // var id = pid[q].id;
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/post/deletePost" ,//url
                data: JSON.stringify({
                    pid: q.valueOf(),
                }),
                contentType:'application/json;charset=UTF-8',

                success : function () {
                    alert("删除成功");
                    getData();
                },
                error : function() {
                    alert("异常");
                }
            });
        }
    </script>
    <script>
        function findPost() {
            var mydata = new Array();
            var movie = $('#movie').val();
            console.log(movie);
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/post/findPostByName" ,//url
                data: JSON.stringify({
                    movie: movie
                }),
                contentType:'application/json;charset=UTF-8',


                success: function (result) {
                    var topics = document.getElementsByName('topic');
                    var user = document.getElementsByName('user');
                    var datetime = document.getElementsByName('datetime');
                    var look = document.getElementsByName('look');
                    var dlt = document.getElementsByName('dlt');
                    for (let q=0;q<6;q++){
                        topics[q].innerText="";
                        user[q].innerText="";
                        datetime[q].innerText="";
                        look[q].innerHTML="";
                        dlt[q].innerText=""
                    }


                    console.log(result);
                    for (var i=0;i<result.length;i++)
                    {
                        mydata[i] = result[i];
                    }

                    for (let q=0;q<mydata.length;q++){
                        topics[q].innerText=mydata[q].mname;
                        user[q].innerText=mydata[q].pname;
                        datetime[q].innerText=mydata[q].pdate;
                        dlt[q].onclick = function () {
                            deletePost(mydata[q].pid)
                        };
                        look[q].innerHTML="<a href=\"${pageContext.request.contextPath}/pages/post.jsp?pid="+mydata[q].pid+"\" class=\"btn btn-warning\">浏览</a>";
                    }
                },
                error : function() {
                    alert("异常");
                }
            });
        }
    </script>

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
            <div class="main-content">


                <div class="row">

                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>搜索</h4>
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
                                        <div class="form-group">
                                            <div class="input-group input-group-rounded">
                                                <span class="input-group-btn"><button class="btn btn-primary input-group-close-icon btn-group-left" type="submit"><i class="ti-close"></i></button></span>
                                                <input id="movie" type="text" class="form-control" placeholder="名字">
                                                <span class="input-group-btn"><button onclick="findPost()" class="btn btn-primary btn-group-right" type="button"><i class="ti-search"></i></button></span>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div><!-- /# column -->


                    <div class="col-lg-8">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>最新</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                            <ul class="card-option-dropdown dropdown-menu">
                                                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="ti-loop"></i> 刷新</a></li>
                                                <%--<li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>--%>
                                                <%--<li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>--%>
                                                <%--<li><a href="#"><i class="ti-power-off"></i> Clear ist</a></li>--%>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-responsive table-hover ">
                                    <thead>
                                    <tr>
                                        <th>帖子</th>
                                        <th>发表人</th>
                                        <th>更新时间</th>
                                        <th> </th>
                                        <th> </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    <tr>
                                        <td name="topic"></td>
                                        <td name="user"></td>
                                        <td name="datetime"></td>
                                        <td name="look"><a href="/post/addNice?pid=" class="btn btn-warning">浏览</a></td>
                                        <td name="dlt"><span onclick="" class="btn btn-danger">删除</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- /# column -->
                </div><!-- /# row -->




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