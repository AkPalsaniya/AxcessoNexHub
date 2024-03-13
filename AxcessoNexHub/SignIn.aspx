<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" EnableEventValidation="false" Inherits="AxcessoNexHub.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
 
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div class="navbar navbar-default navbar-fixed-top " role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        
                        <a class="navbar-brand" href="userHome.aspx"><span>
                            <img src="assets/images/logo/logo.svg" alt="AxcessoNexHub" height="30" /></span></a>
                        
                        <a class="navbar-brand" href="userHome.aspx" style="text-decoration:none;color:black"><span>Home</span></a>

                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="Default.aspx">Home</a> </li>
                            <li><a href="About.aspx">About</a> </li>
                            <li><a href="#">Contact US</a> </li>
                            <%-- <li ><a href ="#">Blog-</a> </li>--%>
                            <li class="drodown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class="dropdown-menu ">
                                    <li class="dropdown-header ">Men</li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="#">Shirts</a></li>
                                    <li><a href="#">Pants</a></li>
                                    <li><a href="#">Denims</a></li>
                                    <li role="separator" class="divider "></li>
                                    <li class="dropdown-header ">Women</li>
                                    <li role="separator" class="divider "></li>
                                    <li><a href="#">Top</a></li>
                                    <li><a href="#">Leggings</a></li>
                                    <li><a href="#">Denims</a></li>
                                </ul>

                            </li>
                            <li><a href="SignUp.aspx">SignUp</a> </li>
                            <li class="active"><a href="SignIn.aspx">SignIn</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="hold-transition login-page">
            <div class="login-box">
                <div class="login-logo">
                    <a href="../../index2.html"><b>Login</b></a>
                </div>
                <!-- /.login-logo -->
                <div class="card">
                    <div class="card-body login-card-body">
                        <p class="login-box-msg">Sign in to start your shoping</p>

                        <form>
                            <div class="input-group mb-3">
                                <%--<input type="email" class="form-control" placeholder="Email">--%>
                                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" placeholder="User Name"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>--%>

                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-user"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <%--<input type="password" class="form-control" placeholder="Password">--%>
                                <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>

                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-8">
                                    <div class="icheck-primary">
                                        <input type="checkbox" id="remember">

                                        <label for="remember">
                                            Remember Me
                                        </label>
                                    </div>
                                </div>
                                <!-- /.col -->
                                <div class="col-4">
                                    <%--<button type="submit" class="btn btn-primary btn-block">Sign In</button>--%>
                                    <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />

                                </div>
                                <!-- /.col -->
                            </div>
                            <div class="row">
                                <asp:Label runat="server" ID="lblError" Visible="false"></asp:Label>
                            </div>
                        </form>

                        <div class="social-auth-links text-center mb-3">
                            <p>- OR -</p>
                            <a href="#" class="btn btn-block btn-primary">
                                <i class="fab fa-facebook mr-2"></i>Sign in using Facebook
                            </a>
                            <a href="#" class="btn btn-block btn-danger">
                                <i class="fab fa-google-plus mr-2"></i>Sign in using Google+
                            </a>
                        </div>
                        <!-- /.social-auth-links -->

                        <%--<p class="mb-1">
                            <a href="forgot-password.html">I forgot my password</a>
                        </p>--%>
                        <p class="mb-0">
                            <a href="SignUp.aspx" class="text-center">Register a new membership</a>
                        </p>
                    </div>
                    <!-- /.login-card-body -->
                </div>
            </div>
        </div>


        <!---Footer COntents Start here---->
        <hr />
        <footer>

            <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
            <%--<p class="pull-right "><a href="AdminHome.aspx">Admin Login  </a></p>--%>
            <p>&copy;2020 Coderbaba.in &middot; <a href="userHome.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a> </p>


        </footer>

        <!---Footer COntents End---->
    </form>
</body>
</html>
