<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="AxcessoNexHub.Cart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

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



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <%--<form id="form1" runat="server">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="page">

                    <div class="breadcrumbs">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <p class="bread"><span><a href="userHome.aspx">Home</a></span> / <span>Shopping Cart</span></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="colorlib-product">
                        <div class="container">
                            <div class="row row-pb-lg">
                                <div class="col-md-12">
                                    <%-- Qty Less Than One Error --%>
                                    <div id="divQtyError" runat="server" style="color: black; font-size: x-large">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Oops! </strong>Quantity cannot be less than 1.
                                    <br />
                                    </div>
                                    <h4 class="proNameViewCart" runat="server" id="h4NoItems"></h4>
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
                                            <span>Total</span>
                                        </div>
                                        <div class="one-eight text-center px-4">
                                            <span>Remove</span>
                                        </div>
                                    </div>


                                    <asp:Repeater ID="RptrCartProducts" OnItemCommand="RptrCartProducts_ItemCommand" runat="server">
                                        <ItemTemplate>
                                            <div class="product-cart d-flex">
                                                <div class="one-forth">
                                                    <%-- Image --%>
                                                    <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                                                        <div class="product-img" style="background-image: url(images/item-6.jpg);">
                                                            <img class="product-img" width="100px" src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/NoImg.png'" style="border-radius: 10px" />
                                                        </div>
                                                    </a>

                                                    <div class="display-tc">
                                                        <h3><%# Eval("PName") %></h3>
                                                    </div>
                                                </div>
                                                <div class="one-eight text-center">
                                                    <div class="display-tc">
                                                        <span class="price">Rs.&nbsp<del> <%# Eval("PPrice","{0:0.00}") %></del></span>
                                                        <span class="price">Rs.&nbsp <%# Eval("PSelPrice","{0:0.00}") %></span>
                                                    </div>
                                                </div>
                                                <div class="one-eight text-center">
                                                    <div class="display-tc d-flex align-items-center">
                                                        <%--<asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus"  runat="server" Text="-" Height="20px" BorderStyle="None" Font-Size="Large"/>
                                                        <asp:TextBox ID="txtQty" runat="server"  Font-Size="Large" class="form-control input-number text-center" Text='<%# Eval("Qty") %>'></asp:TextBox>
                                                        --%><%--<input type="text" id="quantity" name="quantity" class="form-control input-number text-center" value="1" min="1" max="5">--%>
                                                        <%--<asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Height="20px" BorderStyle="None" Font-Size="Large"/>--%>

                                                        <asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus" Font-Size="Large" runat="server" Text="-" BorderStyle="None" />&nbsp
                                                        <asp:TextBox ID="txtQty" runat="server" Width="40" Font-Size="Large" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("Qty") %>' BorderStyle="None"></asp:TextBox>
                                                        <asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Font-Size="Large" BorderStyle="None" />
                                                    </div>
                                                </div>
                                                <div class="one-eight text-center">
                                                    <div class="display-tc">
                                                        <span class="price">Rs.&nbsp <%# Eval("SubSAmount","{0:0.00}") %></span>
                                                    </div>
                                                </div>
                                                <div class="one-eight text-center">
                                                    <div class="display-tc">
                                                        <%--<a href="#" class="closed"></a>--%>
                                                        <%--<asp:Button CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" ID="btnRemoveCart" class="closed" runat="server" Text="*" />--%>
                                                        <asp:LinkButton CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" ID="btnRemoveCart" class="closed" runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>

                            <div class="row row-pb-lg">
                                <div class="col-md-12">
                                    <div class="total-wrap">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <form action="#">
                                                    <div class="row form-group">
                                                        <div class="col-sm-9">
                                                            <input type="text" name="quantity" class="form-control input-number" placeholder="Your Coupon Number...">
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <input type="submit" value="Apply Coupon" class="btn btn-primary">
                                                            <%--<asp:Button ID="btnBuyNow" class="btn btn-primary" runat="server" OnClick="btnBuyNow_Click" Text="Check Out" />--%>
                                                            <%--<asp:Button ID="btnBuy" class="btn btn-primary" runat="server" OnClick="btnBuy_Click" Text="Check Out" />--%>

                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col-sm-4 text-center">
                                                <div class="total">
                                                    <div class="sub">
                                                        <%--<p><span>Subtotal:</span> <span>$200.00</span></p>--%>
                                                        <p>
                                                            <span>Subtotal:</span> <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
                                                            <%--<p><span>Delivery:</span> <span>$0.00</span></p>--%>
                                                        <p>
                                                            <span>Discount:</span> <span class="pull-right priceGreen" runat="server" id="spanDiscount"></span>
                                                            <%--<p><span>Discount:</span> <span>$45.00</span></p>--%>
                                                            <%--<p><span>Discount:</span> <span class="pull-right " runat="server" id="spanTotal"></span>--%>
                                                    </div>
                                                    <div class="grand-total">
                                                        <%--<p><span><strong>Total:</strong> </span> <span>$450.00</span></p>--%>
                                                        <p>
                                                            <span><strong>Total:</strong> </span><span class="pull-right " runat="server" id="spanTotal"></span>
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

            </ContentTemplate>
        </asp:UpdatePanel>
    <%--</form>--%>
</asp:Content>
