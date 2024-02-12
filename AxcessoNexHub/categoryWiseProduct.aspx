<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" AutoEventWireup="true" CodeBehind="categoryWiseProduct.aspx.cs" Inherits="AxcessoNexHub.categoryWiseProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Animate.css -->
<%--<link rel="stylesheet" href="css/animate.css">--%>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div id="page">

            <div class="colorlib-product">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                            <h2 runat="server" id="h2ViewAll">View All Related Products</h2>
                            <%--<h3><asp:Label ID="lblCategoryError" runat="server" style="color:grey"></asp:Label></h3>--%>
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

                    <%--<div class="row">
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
                    </div>--%>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
