<%--
  Created by IntelliJ IDEA.
  User: WX
  Date: 2019/6/10
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <title>注册</title>
    <script src="${pageContext.request.contextPath}/js/lib/jquery.min.js"></script>
    <script type="text/javascript">

        function regist() {
            var f = new FormData();
            var username = $('#username').val();
            var password = $('#password').val();
            var email = $('#email').val();
            var company = $('#company').val();
            var job = $('#job').val();
            var role = $('input[type=radio][name=role]:checked').val();
            var rkey = $('#rootKey').val();
            console.log(rkey)
            // f.append('file', $('#file')[0].files[0]);
            f.append('username',username);
            f.append("password",password);
            f.append("email",email);
            f.append("company",company);
            f.append("job",job);
            f.append("role",role);
            f.append("rkey",rkey);
            // var demo = {"username":username,"password":password}
            console.log(username, password);
            if (username == "" || password == "") {
                alert("用户名或者密码不能为空!");
                return false;
            }
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
            var obj = document.getElementById("email"); //要验证的对象
            if(obj.value === ""){ //输入不能为空
                alert("邮箱不能为空!");
                return false;
            }else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
                alert("邮箱格式有误!");
                return false;
            }
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${pageContext.request.contextPath}/user/saveUser" ,//url
                data: f,
                processData:false,
                contentType:false,
                cache: false,
                success: function (result) {
                    if (result == "0")
                    {
                        alert("用户名重复");
                    }
                    else alert("注册成功");
                },
                error : function() {
                    alert("失败");
                }
            });
        }
    </script>
    <script type="text/javascript">
        function checkFileExt(filename)
        {
            var flag = false; //状态
            var arr = ["jpg","png","gif"];
            //取出上传文件的扩展名
            var index = filename.lastIndexOf(".");
            var ext = filename.substr(index+1);
            //循环比较
            for(var i=0;i<arr.length;i++)
            {
                if(ext == arr[i])
                {
                    flag = true; //一旦找到合适的，立即退出循环
                    break;
                }
            }
            //条件判断
            if(!flag)
            {
                var obj = document.getElementById("file") ;
                obj.outerHTML=obj.outerHTML;
                alert("文件名非法,请选择jpg,jpeg,gif,png文件");

            }
        }
    </script>
</head>
<div class="unix-login">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-lg-offset-3">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="index.jsp"><span>首页</span></a>
                    </div>
                    <div class="login-form">
                        <h4>Register to Administration</h4>
                        <form action="##" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>账户</label>
                                <input id="username" name="username" type="text" class="form-control" placeholder="User Name" /><br>
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <input id="password" name="password" type="password" class="form-control" placeholder="Password"><br>
                            </div>
                            <div class="form-group">
                                <label>邮箱</label>
                                <input id="email" name="email" type="email" class="form-control" placeholder="Email"><br>
                            </div>
                            <div class="form-group">
                                <label>公司</label>
                                <input id="company" name="company" type="text" class="form-control" ><br>
                            </div>
                            <div class="form-group">
                                <label>工作</label>
                                <input id="job" name="job" type="text" class="form-control" ><br>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<label>头像</label>--%>
                                <%--<input id="file" type="file" name="upload" class="form-control"  onchange="checkFileExt(this.value)" /><br>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                身份
                                <label><input class="form-control" type="radio" name="role" value="root">管理员
                                    <input class="form-control" type="radio" name="role" value="user" checked="checked">用户</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Agree the terms and policy
                                </label>
                            </div>
                            <div class="form-group">
                                <label>邀请码</label>
                                <input id="rootKey" name="rootKey" type="text" class="form-control" placeholder="注册管理员时需要填写" ><br>
                            </div>
                            <button type="button" value="注册" onclick="regist()" class="btn btn-primary btn-flat m-b-30 m-t-30">Register</button>

                            <div class="register-link m-t-15 text-center">
                                <p>已经有账号了？ <a href="${pageContext.request.contextPath}/pages/login.jsp"> 点我登陆</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>