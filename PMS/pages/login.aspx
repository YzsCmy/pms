<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PMS.pages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>用户登录</title>


    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- Theme style -->
    <!-- iCheck -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">


</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <div class="login-box">
        <div class="login-logo">

 
            <a href="#">人事管理系统</a>


        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">登录系统</p>

            <form action="all-admin-index.html" method="post">
                <div class="form-group has-feedback">
                    <asp:TextBox ID="username" runat="server" class="form-control" placeholder="用户名"></asp:TextBox>
                    <!--<input type="text" id="username" class="form-control" placeholder="用户名">-->
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <asp:TextBox ID="pwd" runat="server" class="form-control" placeholder="密码" TextMode="Password"></asp:TextBox>
                   <!-- <input type="password" class="form-control" placeholder="密码">-->
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                         <!--<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>-->
                        <asp:Button ID="Button1" runat="server" Text="登录" class="btn btn-primary btn-block btn-flat" OnClick="Button1_Click" />
                    </div>
                    <div class="col-xs-12">
                        <asp:Label ID="msg" runat="server" Text="" ForeColor="Red"></asp:Label>
                     <div>
                </div>
            </form>


        </div>
        <!-- /.login-box-body -->
    </div>
    <!-- /.login-box -->
    </form>
    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function() {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>
</html>
