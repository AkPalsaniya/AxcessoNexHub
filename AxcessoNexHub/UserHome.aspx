<%@ Page Title="" Language="C#" MasterPageFile="~/UserMain.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="AxcessoNexHub.UserHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">


        <%-- Slider Baner --%>
        <div class="banner">

            <div class="container">

                <div class="slider-container has-scrollbar">

                    <div class="slider-item">

                        <img src="./assets/images/banner-1.jpg" alt="women's latest fashion sale" class="banner-img">

                        <div class="banner-content">

                            <p class="banner-subtitle">Trending item</p>

                            <h2 class="banner-title">Women's latest fashion sale</h2>

                            <p class="banner-text">
                                starting at &dollar; <b>20</b>.00
                            </p>

                            <a href="#" class="banner-btn">Shop now</a>

                        </div>

                    </div>

                    <div class="slider-item">

                        <img src="./assets/images/banner-2.jpg" alt="modern sunglasses" class="banner-img">

                        <div class="banner-content">

                            <p class="banner-subtitle">Trending accessories</p>

                            <h2 class="banner-title">Modern sunglasses</h2>

                            <p class="banner-text">
                                starting at &dollar; <b>15</b>.00
                            </p>

                            <a href="#" class="banner-btn">Shop now</a>

                        </div>

                    </div>

                    <div class="slider-item">

                        <img src="./assets/images/banner-3.jpg" alt="new fashion summer sale" class="banner-img">

                        <div class="banner-content">

                            <p class="banner-subtitle">Sale Offer</p>

                            <h2 class="banner-title">New fashion summer sale</h2>

                            <p class="banner-text">
                                starting at &dollar; <b>29</b>.99
                            </p>

                            <a href="#" class="banner-btn">Shop now</a>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <%-- Categoies --%>

        <div class="category">

            <div class="container">

                <div class="category-item-container has-scrollbar">

                    <div class="category-item">

                        <div class="category-img-box">
                            <img src="./assets/images/icons/dress.svg" alt="dress & frock" width="30">
                        </div>

                        <div class="category-content-box">

                            <div class="category-content-flex">
                                <h3 class="category-item-title">Watches</h3>

                                <p class="category-item-amount">
                                    <asp:Label ID="lblWatcheTotalCount" runat="server" Text="10"></asp:Label>
                                </p>
                            </div>

                            <a href="categoryWiseProduct.aspx?parentCId=1" class="category-btn">Show all</a>

                        </div>

                    </div>

                    <div class="category-item">

                        <div class="category-img-box">
                            <img src="./assets/images/icons/coat.svg" alt="winter wear" width="30">
                        </div>

                        <div class="category-content-box">

                            <div class="category-content-flex">
                                <h3 class="category-item-title">Footwears</h3>

                                <p class="category-item-amount">
                                    <asp:Label ID="lblFootwearTotalCount" runat="server" Text="10"></asp:Label>
                                </p>
                            </div>

                            <a href="categoryWiseProduct.aspx?parentCId=2" class="category-btn">Show all</a>

                        </div>

                    </div>

                    <div class="category-item">

                        <div class="category-img-box">
                            <img src="./assets/images/icons/coat.svg" alt="winter wear" width="30">
                        </div>

                        <div class="category-content-box">

                            <div class="category-content-flex">
                                <h3 class="category-item-title">Jwellery</h3>

                                <p class="category-item-amount">
                                    <asp:Label ID="lblJwelleryCount" runat="server" Text="10"></asp:Label>
                                </p>
                            </div>

                            <a href="categoryWiseProduct.aspx?parentCId=3" class="category-btn">Show all</a>

                        </div>

                    </div>

                    <div class="category-item">

                        <div class="category-img-box">
                            <img src="./assets/images/icons/coat.svg" alt="winter wear" width="30">
                        </div>

                        <div class="category-content-box">

                            <div class="category-content-flex">
                                <h3 class="category-item-title">All Product</h3>

                                <p class="category-item-amount">
                                    <asp:Label ID="lblAllProductCount" runat="server" Text="30"></asp:Label>
                                </p>
                            </div>

                            <a href="Product.aspx" class="category-btn">Show all</a>


                        </div>

                    </div>


                </div>

            </div>

        </div>
        <%-- Categories Over --%>

        <div class="product-container">

            <div class="container">


                <!--- SIDEBAR -->

                <div class="sidebar  has-scrollbar" data-mobile-menu>

                    <div class="sidebar-category">

                        <div class="sidebar-top">
                            <h2 class="sidebar-title">Category</h2>

                            <button class="sidebar-close-btn" data-mobile-menu-close-btn>
                                <ion-icon name="close-outline"></ion-icon>
                            </button>
                        </div>

                        <ul class="sidebar-menu-category-list">

                            <asp:Repeater ID="rptrCategory" runat="server">
                                <ItemTemplate>
                                    <li class="sidebar-menu-category">

                                        <button class="sidebar-accordion-menu" data-accordion-btn>

                                            <div class="menu-title-flex">
                                                <img src="./assets/images/icons/dress.svg" alt="clothes" width="20" height="20"
                                                    class="menu-title-img">

                                                <p class="menu-title"><%# Eval("CatName") %></p>
                                            </div>

                                            <div>
                                                <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                                <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                            </div>

                                        </button>

                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/shoes.svg" alt="footwear" class="menu-title-img" width="20"
                                            height="20">

                                        <p class="menu-title">Footwear</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/jewelry.svg" alt="clothes" class="menu-title-img" width="20"
                                            height="20">

                                        <p class="menu-title">Jewelry</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/perfume.svg" alt="perfume" class="menu-title-img" width="20"
                                            height="20">

                                        <p class="menu-title">Perfume</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/cosmetics.svg" alt="cosmetics" class="menu-title-img" width="20"
                                            height="20">

                                        <p class="menu-title">Cosmetics</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/glasses.svg" alt="glasses" class="menu-title-img" width="20"
                                            height="20">

                                        <p class="menu-title">Glasses</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                            <li class="sidebar-menu-category">

                                <button class="sidebar-accordion-menu" data-accordion-btn>

                                    <div class="menu-title-flex">
                                        <img src="./assets/images/icons/bag.svg" alt="bags" class="menu-title-img" width="20" height="20">

                                        <p class="menu-title">Bags</p>
                                    </div>

                                    <div>
                                        <ion-icon name="add-outline" class="add-icon"></ion-icon>
                                        <ion-icon name="remove-outline" class="remove-icon"></ion-icon>
                                    </div>

                                </button>
                            </li>

                        </ul>

                    </div>

                    <div class="product-showcase">

                        <h3 class="showcase-heading">best sellers</h3>

                        <div class="showcase-wrapper">

                            <div class="showcase-container">

                                <div class="showcase">

                                    <a href="#" class="showcase-img-box">
                                        <img src="./assets/images/products/1.jpg" alt="baby fabric shoes" width="75" height="75"
                                            class="showcase-img">
                                    </a>

                                    <div class="showcase-content">

                                        <a href="#">
                                            <h4 class="showcase-title">baby fabric shoes</h4>
                                        </a>

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <del>$5.00</del>
                                            <p class="price">$4.00</p>
                                        </div>

                                    </div>

                                </div>

                                <div class="showcase">

                                    <a href="#" class="showcase-img-box">
                                        <img src="./assets/images/products/2.jpg" alt="men's hoodies t-shirt" class="showcase-img"
                                            width="75" height="75">
                                    </a>

                                    <div class="showcase-content">

                                        <a href="#">
                                            <h4 class="showcase-title">men's hoodies t-shirt</h4>
                                        </a>
                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-half-outline"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <del>$17.00</del>
                                            <p class="price">$7.00</p>
                                        </div>

                                    </div>

                                </div>

                                <div class="showcase">

                                    <a href="#" class="showcase-img-box">
                                        <img src="./assets/images/products/3.jpg" alt="girls t-shirt" class="showcase-img" width="75"
                                            height="75">
                                    </a>

                                    <div class="showcase-content">

                                        <a href="#">
                                            <h4 class="showcase-title">girls t-shirt</h4>
                                        </a>
                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-half-outline"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <del>$5.00</del>
                                            <p class="price">$3.00</p>
                                        </div>

                                    </div>

                                </div>

                                <div class="showcase">

                                    <a href="#" class="showcase-img-box">
                                        <img src="./assets/images/products/4.jpg" alt="woolen hat for men" class="showcase-img" width="75"
                                            height="75">
                                    </a>

                                    <div class="showcase-content">

                                        <a href="#">
                                            <h4 class="showcase-title">woolen hat for men</h4>
                                        </a>
                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                        </div>

                                        <div class="price-box">
                                            <del>$15.00</del>
                                            <p class="price">$12.00</p>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>



                <div class="product-box">

                    <!--- PRODUCT FEATURED -->

                    <div class="product-featured">

                        <h2 class="title">Deal of the day</h2>

                        <div class="showcase-wrapper has-scrollbar">

                            <div class="showcase-container">

                                <div class="showcase">

                                    <div class="showcase-banner">
                                        <img src="./assets/images/products/shampoo.jpg" alt="shampoo, conditioner & facewash packs" class="showcase-img">
                                    </div>

                                    <div class="showcase-content">

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                        </div>

                                        <a href="#">
                                            <h3 class="showcase-title">shampoo, conditioner & facewash packs</h3>
                                        </a>

                                        <p class="showcase-desc">
                                            Lorem ipsum dolor sit amet consectetur Lorem ipsum
                      dolor dolor sit amet consectetur Lorem ipsum dolor
                                        </p>

                                        <div class="price-box">
                                            <p class="price">$150.00</p>

                                            <del>$200.00</del>
                                        </div>

                                        <button class="add-cart-btn">add to cart</button>

                                        <div class="showcase-status">
                                            <div class="wrapper">
                                                <p>
                                                    already sold: <b>20</b>
                                                </p>

                                                <p>
                                                    available: <b>40</b>
                                                </p>
                                            </div>

                                            <div class="showcase-status-bar"></div>
                                        </div>

                                        <div class="countdown-box">

                                            <p class="countdown-desc">
                                                Hurry Up! Offer ends in:
                                            </p>

                                            <div class="countdown">

                                                <div class="countdown-content">

                                                    <p class="display-number">360</p>

                                                    <p class="display-text">Days</p>

                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">24</p>
                                                    <p class="display-text">Hours</p>
                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">59</p>
                                                    <p class="display-text">Min</p>
                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">00</p>
                                                    <p class="display-text">Sec</p>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                            <div class="showcase-container">

                                <div class="showcase">

                                    <div class="showcase-banner">
                                        <img src="./assets/images/products/jewellery-1.jpg" alt="Rose Gold diamonds Earring" class="showcase-img">
                                    </div>

                                    <div class="showcase-content">

                                        <div class="showcase-rating">
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                            <ion-icon name="star-outline"></ion-icon>
                                        </div>

                                        <h3 class="showcase-title">
                                            <a href="#" class="showcase-title">Rose Gold diamonds Earring</a>
                                        </h3>

                                        <p class="showcase-desc">
                                            Lorem ipsum dolor sit amet consectetur Lorem ipsum
                      dolor dolor sit amet consectetur Lorem ipsum dolor
                                        </p>

                                        <div class="price-box">
                                            <p class="price">$1990.00</p>
                                            <del>$2000.00</del>
                                        </div>

                                        <button class="add-cart-btn">add to cart</button>

                                        <div class="showcase-status">
                                            <div class="wrapper">
                                                <p>already sold: <b>15</b> </p>

                                                <p>available: <b>40</b> </p>
                                            </div>

                                            <div class="showcase-status-bar"></div>
                                        </div>

                                        <div class="countdown-box">

                                            <p class="countdown-desc">Hurry Up! Offer ends in:</p>

                                            <div class="countdown">
                                                <div class="countdown-content">
                                                    <p class="display-number">360</p>
                                                    <p class="display-text">Days</p>
                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">24</p>
                                                    <p class="display-text">Hours</p>
                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">59</p>
                                                    <p class="display-text">Min</p>
                                                </div>

                                                <div class="countdown-content">
                                                    <p class="display-number">00</p>
                                                    <p class="display-text">Sec</p>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>



                    <!--- PRODUCT GRID  -->

                    <div class="product-main">

                        <h2 class="title">New Products</h2>

                        <div class="product-grid">
                            

                            <asp:Repeater ID="rptrProducts" runat="server">
                                <ItemTemplate>
                                    <div class="showcase">

                                        <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                            <div class="showcase-banner">
                                                <img width="300" class="product-img default" src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>"
                                                    alt="<%# Eval("ImageName") %>" />
                                                <%--<img src="./assets/images/products/jacket-3.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img default">--%>
                                                <img src="./assets/images/products/jacket-4.jpg" alt="Mens Winter Leathers Jackets" width="300" class="product-img hover">

                                                <span class="showcase-badge">(<%# Eval("DiscAmount","{0:0,00}") %>&#8377 off) </span>
                                                <%--<p class="showcase-badge">15%</p>--%>

                                                <div class="showcase-actions">

                                                    <%-- <button class="btn-action">
                                            <ion-icon name="heart-outline"></ion-icon>
                                        </button--%>

                                                    <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                                        <button class="btn-action">
                                                            <ion-icon name="eye-outline"></ion-icon>
                                                        </button>
                                                    </a>

                                                    <button class="btn-action">
                                                        <ion-icon name="repeat-outline"></ion-icon>
                                                    </button>

                                                    <button class="btn-action">
                                                        <ion-icon name="bag-add-outline"></ion-icon>
                                                    </button>

                                                </div>
                                            </div>

                                            <div class="showcase-content">

                                                <a href="#" class="showcase-category"><%# Eval ("BrandName") %></a>

                                                <a href="#">
                                                    <h3 class="showcase-title"><%# Eval ("PName") %></h3>
                                                </a>

                                                <div class="showcase-rating">
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star"></ion-icon>
                                                    <ion-icon name="star-outline"></ion-icon>
                                                    <ion-icon name="star-outline"></ion-icon>
                                                </div>

                                                <div class="price-box">
                                                    <p class="price"><%# Eval("PSelPrice", "₹{0:N2}") %></p>
                                                    <del><%# Eval ("PPrice","{0:0,00}") %></del>
                                                </div>

                                            </div>
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </form>

</asp:Content>
