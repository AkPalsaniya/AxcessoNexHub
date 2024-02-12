<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="AxcessoNexHub.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
    <!-- Ion Icon Fonts-->
    <link rel="stylesheet" href="css/ionicons.min.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div id="page">

            <div class="colorlib-product">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                            <h2>View All Products</h2>
                        </div>
                    </div>
                    <div class="row row-pb-md">
                        <asp:Repeater ID="rptrProducts" runat="server">
                            <ItemTemplate>
                                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 text-center">
                                        <div class="product-entry border">
                                            <%--<a href="#" class="prod-img">--%>
                                                <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" class="img-fluid" alt="<%# Eval("ImageName") %>" style="height: 270px">
                                            <%--</a>--%>
                                            <div class="desc">
                                                <h2><a href="#"><%# Eval ("PName") %></a></h2>
                                                <del><%# Eval ("PSelPrice","₹ {0:0,00}") %></del> <span>(<%# Eval("DiscAmount","{0:0,00}") %> off) </span>
                                                <span class="price"><%# Eval("PPrice", "₹ {0:0,00}") %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>









        <%--        <div class="row">
            <div class="col-md-12">
                <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i><span id="CartBadge" runat="server" class="badge">0 </span>
                </button>
                <h3>
                    <asp:Label ID="Label1" runat="server" Text="Showing All Products"></asp:Label>
                </h3>
                <hr />

            </div>
        </div>

        <div class="row" style="padding-top: 50px">

            <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server"
                placeholder="Search Products...." AutoPostBack="true"
                OnTextChanged="txtFilterGrid1Record_TextChanged"></asp:TextBox>
            <br />
            <hr />

            <asp:Repeater ID="rptrProducts" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                            <div class="thumbnail">
                                <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>" />
                                <div class="caption">
                                    <div class="probrand"><%# Eval ("BrandName") %>  </div>
                                    <div class="proName"><%# Eval ("PName") %> </div>
                                    <div class="proPrice"><span class="proOgPrice"><%# Eval ("PPrice","{0:0,00}") %> </span><%# Eval ("PSelPrice","{0:c}") %> <span class="proPriceDiscount">(<%# Eval("DiscAmount","{0:0,00}") %> off) </span></div>

                                </div>
                            </div>
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>--%>
    </form>
</asp:Content>
