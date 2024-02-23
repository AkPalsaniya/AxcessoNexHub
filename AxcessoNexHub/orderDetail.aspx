<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" AutoEventWireup="true" CodeBehind="orderDetail.aspx.cs" Inherits="AxcessoNexHub.orderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="page">

        <div class="breadcrumbs">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p class="bread"><span><a href="index.html">Home</a></span> / <span>Shopping Cart</span></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="colorlib-product" style="padding:1rem">
            <div class="container">
                <div class="row row-pb-lg">
                    <div class="col-md-12">
                        <div class="product-name d-flex">
                            <div class="one-forth text-left px-4">
                                <span>Product Details</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Price</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Quantity</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Payment Mode</span>
                            </div>
                            <div class="one-eight text-center px-4">
                                <span>Status</span>
                            </div>
                        </div>

                        <asp:Repeater ID="RptrMyOrder" runat="server">
                            <ItemTemplate>
                                <%--<div class="product-cart d-flex">
                        <div class="one-forth">
                            <div class="product-img" style="background-image: url(images/item-6.jpg);">
                            </div>
                            <div class="display-tc">
                                <h3>Product Name</h3>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <span class="price">$68.00</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <span class="price">$120.00</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <a href="#" class="closed"></a>
                            </div>
                        </div>
                    </div>--%>
                                <div class="product-cart d-flex">
                                    <div class="one-forth">
                                        <%-- Image --%>
                                        <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                                            <div class="product-img" style="background-image: url(images/item-6.jpg);">
                                                <img class="product-img" width="100px" src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("imageName") %>.jpg" alt="<%# Eval("imageName") %>" onerror="this.src='Images/NoImg.png'" style="border-radius: 10px" />
                                            </div>
                                        </a>

                                        <div class="display-tc">
                                            <h3><%# Eval("OrderName") %></h3>
                                        </div>
                                    </div>
                                    <div class="one-eight text-center"> <%--price--%>
                                        <div class="display-tc">
                                            <%--<span class="price">Rs.&nbsp<del> <%# Eval("PPrice","{0:0.00}") %></del></span>--%>
                                            <span class="price">Rs.&nbsp <%# Eval("price") %></span>
                                        </div>
                                    </div>
                                    <div class="one-eight text-center">
                                        <div class="display-tc d-flex align-items-center justify-content-center">
                                            <%--<asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus"  runat="server" Text="-" Height="20px" BorderStyle="None" Font-Size="Large"/>
            <asp:TextBox ID="txtQty" runat="server"  Font-Size="Large" class="form-control input-number text-center" Text='<%# Eval("Qty") %>'></asp:TextBox>
                                            --%><%--<input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="5">--%>
                                            <%--<asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Height="20px" BorderStyle="None" Font-Size="Large"/>--%>

                                            <%--<asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus" Font-Size="Large" runat="server" Text="-" BorderStyle="None" />&nbsp--%>
            <asp:Label ID="txtQty" runat="server" Width="40" Font-Size="Large" Style="text-align: center" Text='<%# Eval("Quantity") %>' BorderStyle="None"></asp:Label>
                                            <%--<asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Font-Size="Large" BorderStyle="None" />--%>
                                        
                                        </div>
                                    </div>
                                    <div class="one-eight text-center">
                                        <div class="display-tc">
                                            <span class="price"><%# Eval("PaymentType") %></span>
                                        </div>
                                    </div>
                                    <div class="one-eight text-center">
                                        <div class="display-tc">
                                            <span class="price"><%# Eval("Status") %></span>
                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>
                        <%--<div class="product-cart d-flex">
                <div class="one-forth">
                    <div class="product-img" style="background-image: url(images/item-7.jpg);">
                    </div>
                    <div class="display-tc">
                        <h3>Product Name</h3>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price">$68.00</span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <form action="#">
                            <input type="text" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                        </form>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price">$120.00</span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <a href="#" class="closed"></a>
                    </div>
                </div>
            </div>
            <div class="product-cart d-flex">
                <div class="one-forth">
                    <div class="product-img" style="background-image: url(images/item-8.jpg);">
                    </div>
                    <div class="display-tc">
                        <h3>Product Name</h3>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price">$68.00</span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="100">
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <span class="price">$120.00</span>
                    </div>
                </div>
                <div class="one-eight text-center">
                    <div class="display-tc">
                        <a href="#" class="closed"></a>
                    </div>
                </div>
            </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
