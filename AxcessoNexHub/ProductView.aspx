<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="AxcessoNexHub.ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head1" runat="server">

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
    <link href="css/style.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="css/style.css">--%>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <%--<form runat="server">--%>
        <div id="page">

            <div class="breadcrumbs">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <p class="bread"><span><a href="userHome.aspx">Home</a></span> / <span>Product Details</span></p>
                        </div>
                    </div>
                </div>
            </div>


            <%--<br />--%>
            <%--<button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
            Cart <span id="CartBadge" runat="server" class="badge">0</span>
        </button>--%>
            <%-- <br />
        <div style="padding-top: 50px">--%>

            <div class="colorlib-product">

                <div class="container">
                    <div class="row row-pb-lg product-detail-wrap">
                        <div class="col-sm-8">
                            <div class="owl-carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>

                                </ol>
                                <%--<asp:Repeater ID="rptrImage" runat="server">
                                    <ItemTemplate>
                                        <div class="item">
                                            <div class="product-entry border">
                                                <a href="#" class="prod-img">
                                                    <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="Error" class="img-fluid">
                                                </a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>--%>
                                <div class="carousel-inner" role="listbox">

                                    <asp:Repeater ID="rptrImage" runat="server">
                                        <ItemTemplate>
                                            <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                                <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'">
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                                
                            </div>
                        </div>


                        <div class="col-sm-4">
                            <div class="product-desc">
                                <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                                    <ItemTemplate>
                                        <%--<div class="col-sm-4">--%>
                                        <%--<div class="product-desc">--%>
                                        <h3><%# Eval("PName") %></h3>
                                        <p class="price">
                                            <span>Rs.<%# Eval("PPrice","{0:c}") %></span><span>Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %></span><p>Rs. <%#Eval("PSelPrice","{0:c}") %></p>
                                            <span class="rate">
                                                <i class="icon-star-full"></i>
                                                <i class="icon-star-full"></i>
                                                <i class="icon-star-full"></i>
                                                <i class="icon-star-full"></i>
                                                <i class="icon-star-half"></i>
                                                (74 Rating)
                                            </span>
                                        </p>
                                        <p><%#Eval("PDescription") %></p>
                                        <p><%#Eval("PDescription") %></p>
                                        <h5 class="h5size">Product Details</h5>
                                        <p><%#Eval("PProductDetails") %>     </p>
                                        <h5 class="h5size">Material & Care</h5>
                                        <p><%#Eval("PMaterialCare") %></p>
                                        <div class="size-wrap">
                                            <div class="block-26 mb-2">
                                                <h4>Size</h4>
                                                <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="S" Text="S"></asp:ListItem>
                                                    <asp:ListItem Value="M" Text="M"></asp:ListItem>
                                                    <asp:ListItem Value="L" Text="L"></asp:ListItem>
                                                    <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <%--<div class="block-26 mb-4">
                                        <h4>Width</h4>
                                        <ul>
                                            <li><a href="#">M</a></li>
                                            <li><a href="#">W</a></li>
                                        </ul>
                                    </div>--%>
                                        </div>
                                        <div class="input-group mb-4">
                                            <span class="input-group-btn">
                                                <button type="button" class="quantity-left-minus btn" data-type="minus" data-field="">
                                                    <i class="icon-minus2"></i>
                                                </button>
                                            </span>
                                            <input type="text" id="quantity" name="quantity" class="form-control input-number" value="1" min="1" max="100">
                                            <span class="input-group-btn ml-1">
                                                <button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                                    <i class="icon-plus2"></i>
                                                </button>
                                            </span>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 text-center">
                                                <%--<p class="addtocart"><a href="cart.html" class="btn btn-primary btn-addtocart"><i class="icon-shopping-cart"></i>Add to Cart</a></p>--%>
                                                <asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddtoCart_Click" class="addtocart" />
                                                <asp:Label ID="lblError" CssClass="text-danger " runat="server"></asp:Label>
                                            </div>
                                        </div>
                                        <div>
                                            <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery":""  %>    </p>
                                            <p><%# ((int)Eval("30DayRet")==1)? "30 Days Returns":""  %></p>
                                            <p><%# ((int)Eval("COD")==1)? "Cash on Delivery":"" %></p>
                                        </div>
                                        <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PcategoryID") %>' />
                                        <asp:HiddenField ID="hfSubCatID" runat="server" Value='<%# Eval("PSubCatID") %>' />
                                        <asp:HiddenField ID="hfGenderID" runat="server" Value='<%# Eval("PGender") %>' />
                                        <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />
                                        <%--  </div>
                                        </div>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--</div>--%>

            <!--- Success Alert --->
            <%--<div id="divsuccess" runat="server" class="alert alert-success alert-dismissible fade in h4">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>success! </strong>item successfully added to cart. <a href="cart.aspx">view cart</a>
            </div>--%>

            <div class="col-md-5">
                <div style="max-width: 480px" class="thumbnail">
                    <%--   for proImage slider--%>
                    <%--<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"></li>

                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">

                            <asp:Repeater ID="rptrImage" runat="server">
                                <ItemTemplate>
                                    <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                        <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.jpg'">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>


                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>--%>

                    <%--  for proimage slider ending--%>
                </div>
            </div>
            <%--<div class="col-md-5">
                <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                    <ItemTemplate>
                        <div class="divDet1">
                            <h1 class="proNameView"><%# Eval("PName") %> </h1>
                            <span class="proOgPriceView">Rs.<%#Eval("PPrice","{0:c}") %></span> <span class="proPriceDiscountView">Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PSelPrice"))) %></span><p class="proPriceView">Rs. <%#Eval("PSelPrice","{0:c}") %></p>
                        </div>
                        <div>
                            <h5 class="h5size">SIZE</h5>
                            <div>
                                <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="S" Text="S"></asp:ListItem>
                                    <asp:ListItem Value="M" Text="M"></asp:ListItem>
                                    <asp:ListItem Value="L" Text="L"></asp:ListItem>
                                    <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="divDet1">
                            <asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddtoCart_Click" />
                            <asp:Label ID="lblError" CssClass="text-danger " runat="server"></asp:Label>

                        </div>
                        <div class="divDet1">
                            <h5 class="h5size">Description</h5>
                            <p><%#Eval("PDescription") %></p>

                            <h5 class="h5size">Product Details</h5>
                            <p><%#Eval("PProductDetails") %>     </p>
                            <h5 class="h5size">Material & Care</h5>
                            <p><%#Eval("PMaterialCare") %></p>
                        </div>
                        <div>
                            <p><%# ((int)Eval("FreeDelivery")==1)? "Free Delivery":""  %>    </p>
                            <p><%# ((int)Eval("30DayRet")==1)? "30 Days Returns":""  %></p>
                            <p><%# ((int)Eval("COD")==1)? "Cash on Delivery":"" %></p>
                        </div>
                        <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PcategoryID") %>' />
                        <asp:HiddenField ID="hfSubCatID" runat="server" Value='<%# Eval("PSubCatID") %>' />
                        <asp:HiddenField ID="hfGenderID" runat="server" Value='<%# Eval("PGender") %>' />
                        <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />


                    </ItemTemplate>
                </asp:Repeater>

            </div>--%>
            <!-- jQuery -->
            <script src="js/jquery.min.js"></script>
            <!-- popper -->
            <script src="js/popper.min.js"></script>
            <!-- bootstrap 4.1 -->
            <script src="js/bootstrap.min.js"></script>
            <!-- jQuery easing -->
            <script src="js/jquery.easing.1.3.js"></script>
            <!-- Waypoints -->
            <script src="js/jquery.waypoints.min.js"></script>
            <!-- Flexslider -->
            <script src="js/jquery.flexslider-min.js"></script>
            <!-- Owl carousel -->
            <script src="js/owl.carousel.min.js"></script>
            <!-- Magnific Popup -->
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/magnific-popup-options.js"></script>
            <!-- Date Picker -->
            <script src="js/bootstrap-datepicker.js"></script>
            <!-- Stellar Parallax -->
            <script src="js/jquery.stellar.min.js"></script>
            <!-- Main -->
            <script src="js/main.js"></script>

            <script>
                $(document).ready(function () {

                    var quantitiy = 0;
                    $('.quantity-right-plus').click(function (e) {

                        // Stop acting like a button
                        e.preventDefault();
                        // Get the field name
                        var quantity = parseInt($('#quantity').val());

                        // If is not undefined

                        $('#quantity').val(quantity + 1);


                        // Increment

                    });

                    $('.quantity-left-minus').click(function (e) {
                        // Stop acting like a button
                        e.preventDefault();
                        // Get the field name
                        var quantity = parseInt($('#quantity').val());

                        // If is not undefined

                        // Increment
                        if (quantity > 0) {
                            $('#quantity').val(quantity - 1);
                        }
                    });

                });
            </script>
    <%--</form>--%>
</asp:Content>
