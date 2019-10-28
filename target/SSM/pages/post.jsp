<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/6/17
  Time: 18:30
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


    <script type="text/javascript">
            // 获得上一个页面传递过来的get数据
            function getQueryString(name){
                var reg = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if(r!=null){
                    return decodeURIComponent(r[2]);
                }
                return '';
            }

    </script>
    <script>
        window.onload=function getData() {
            var pid = getQueryString("pid");
            console.log(pid);
                var mydata = new Array();
                $.ajax({
                    //几个参数需要注意一下
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "${pageContext.request.contextPath}/post/findPostByPid" ,//url
                    data: pid.valueOf(),
                    contentType:'application/json;charset=UTF-8',

                    success: function (result) {
                        console.log(result)
                        var zhuti = document.getElementById('zhuti');
                        var neirong = document.getElementById('neirong');
                        var riqi = document.getElementById('riqi');

                        zhuti.innerText=result[0].mname;
                        neirong.innerText=result[0].pcontent;
                        riqi.innerText=result[0].pdate;
                    },
                    error : function() {
                        alert("异常");
                    }
                });
            getComments();
            }
    </script>
    <script>
        function getComments() {
            var pid = getQueryString("pid");
            console.log(pid);
            var mydata = new Array();
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/post/findComments" ,//url
                data: pid.valueOf(),
                contentType:'application/json;charset=UTF-8',

                success: function (result) {
                    for (var i=0;i<=result.length;i++)
                    {
                        mydata[i] = result[i];
                    }
                    console.log(result);
                    var cname = document.getElementsByName("cname");
                    var content = document.getElementsByName("content");
                    var cdate = document.getElementsByName("cdate");

                    for (var q=0;q<=mydata.length;q++)
                    {
                        cname[q].innerText=mydata[q].name;
                        content[q].innerText=mydata[q].content;
                        cdate[q].innerText=mydata[q].cdate;
                    }

                },
                error : function() {
                    alert("异常");
                }
            });
        }
    </script>
    <script>
        function reppp() {
            var reply = $('#re1').val();
            var pid = getQueryString("pid");
            console.log(reply,pid);

            var demo = {"pid":pid,"content":reply};
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/post/addReply" ,//url
                data: JSON.stringify({
                    pid: pid.valueOf(),
                    content: $("#re1").val()
                }),
                contentType:'application/json;charset=UTF-8',

                success: function (result) {
                    getComments();
                },
                error : function() {
                    alert("请先激活账号");
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


                <div class="row">
                    <div class="col-lg-12">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>浏览</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="doc-link"><a href="#"><i class="ti-link"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="basic-elements">
                                    <div>
                                        <h4>主题</h4>
                                        <div id="zhuti"> </div><br />
                                        <h4>内容</h4>
                                        <div id="neirong"> </div><br />
                                        <h4>日期</h4>
                                        <div id="riqi"> </div><br />
                                    </div>
                                </div>
                            </div>
                            <div class="basic-elements">
                                <br><h3>评论区</h3>
                                <table class="table table-responsive table-hover ">
                                    <thead>
                                    <tr>
                                        <th>用户</th>
                                        <th>评论</th>
                                        <th>时间</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    <tr>
                                        <td name="cname"></td>
                                        <td name="content"></td>
                                        <td name="cdate"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!-- /# column -->
                </div><!-- /# row -->
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>吐槽</h4>
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
                                            <label>回复</label>
                                            <input id="re1"  name="reply" type="text" class="form-control" placeholder="说出你的吐槽">
                                        </div>
                                        <button type="button" onclick="reppp()" class="btn btn-default">回复</button>
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
