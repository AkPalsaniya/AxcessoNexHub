<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentPage.aspx.cs" Inherits="AxcessoNexHub.paymentPage" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hdCartAmount" runat="server" />
        <asp:HiddenField ID="hdCartDiscount" runat="server" />
        <asp:HiddenField ID="hdTotalPayed" runat="server" />
        <asp:HiddenField ID="hdPidSizeID" runat="server" />
        <div id="page">
            <div class="colorlib-product">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form method="post" class="colorlib-form">
                                <h2>Delivery Address</h2>
                                <div class="row">


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="fname">Name</label>
                                            <%--<input type="text" id="lname" class="form-control" placeholder="Your lastname">--%>
                                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="companyname">Addres</label>
                                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Addres"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lname">Zip/Postal Code</label>
                                        <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server" placeholder="Pin-Code"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Phone">Phone Number</label>
                                        <asp:TextBox ID="txtMobileNumber" CssClass="form-control" runat="server" placeholder="Mobile Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <%--<div class="col-md-12">
                                        <div class="form-group">
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optradio">
                                                    Create an Account? </label>
                                                <label>
                                                    <input type="radio" name="optradio">
                                                    Ship to different address</label>
                                            </div>
                                        </div>
                                    </div>--%>
                            </form>
                        </div>

                        <%--</div>--%>

                        <div class="col-lg-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="cart-detail">
                                        <h2>Cart Total</h2>
                                        <ul>
                                            <li>
                                                <span>Subtotal</span> <span class="float-right priceGray" id="spanCartTotal" runat="server"></span>
                                            </li>
                                            <li><span>Cart Discount</span> <span class="float-right priceGreen" id="spanDiscount" runat="server"></span></li>
                                            <li><strong><span>Total</span> <span class="float-right" id="spanTotal" runat="server"></span></strong></li>
                                        </ul>
                                    </div>
                                </div>

                                <%--<div class="w-100"></div>--%>

                                <div class="col-md-12">
                                    <div class="cart-detail">
                                        <h2>Payment Method</h2>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optradio" disabled>
                                                        <strong>COD</strong> (currently un-available)</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optradio">
                                                        Check Payment</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="optradio">
                                                        Paypal</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="">
                                                        I have read and accept the terms and conditions</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="BtnPlaceNPay" CssClass="btn btn-primary" Font-Size="Large" ValidationGroup="PaymentPage" runat="server" OnClick="BtnPlaceNPay_Click" Text="Place an order" />
                                    <asp:Button ID="btnDemo" CssClass="btn btn-primary" Font-Size="Large" ValidationGroup="PaymentPage" runat="server" OnClick="btnDemo_Click" Text="Demo" />
                                    <%--<p><a href="#" class="btn btn-primary">Place an order</a></p>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--Grid View For product Detail--%>
            <div>
                <asp:GridView ID="gvProducts" runat="server" CssClass="col-md-12" AutoGenerateColumns="False" Visible="false">
                    <Columns>
                        <asp:BoundField DataField="PID" HeaderText="Product ID" />
                        <asp:BoundField DataField="PName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div>
        </div>
    </form>
</body>
</html>
