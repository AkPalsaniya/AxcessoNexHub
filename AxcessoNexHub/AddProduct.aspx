<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddProduct.aspx.cs" Inherits="AxcessoNexHub.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">

    <div class="card w-75 mx-auto mt-3" style="background-color: #d6d8db;">
        <div class="card-header" style="background-color: #aab0b6;">
            <h3>Add Product </h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form>
            <div class="card-body"> 
                <div class="form-group">
                    <label for="txtProductName">Proudct Name</label>
                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPrice">Price</label>
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtsellPrice">Selling Price</label>
                    <asp:TextBox ID="txtsellPrice" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ddlBrand">Brand</label>
                    <asp:DropDownList ID="ddlBrand" class="form-control" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="ddlCategory">Category</label>
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="ddlSubCategory">Sub Category</label>
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="ddlGender">Gender</label>
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGender_SelectedIndexChanged"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="cblSize">Size</label>
                    <asp:CheckBoxList ID="cblSize" CssClass="form-control" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>

                </div>


                <div class="form-group">
                    <label for="txtQuantity">Quantity</label>
                    <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtPDetail">Product Detail</label>
                    <asp:TextBox ID="txtPDetail" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="txtMatCare">Material</label>
                    <asp:TextBox ID="txtMatCare" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="form-group col-6">
                        <label for="exampleInputFile">First Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <asp:FileUpload ID="fuImg01" class="custom-file-input" runat="server" />
                                <label class="custom-file-label" for="fuImg01">Choose file</label>
                            </div>
                            <div class="input-group-append">
                                <span class="input-group-text">Upload</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-6">
                        <label for="exampleInputFile">Second Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <asp:FileUpload ID="fuImg02" class="custom-file-input" runat="server" />
                                <label class="custom-file-label" for="fuImg02">Choose file</label>
                            </div>
                            <div class="input-group-append">
                                <span class="input-group-text">Upload</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-6">
                        <label for="exampleInputFile">Third Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <asp:FileUpload ID="fuImg03" class="custom-file-input" runat="server" />
                                <label class="custom-file-label" for="fuImg03">Choose file</label>
                            </div>
                            <div class="input-group-append">
                                <span class="input-group-text">Upload</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-6">
                        <label for="exampleInputFile">Fourth Image</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <asp:FileUpload ID="fuImg04" class="custom-file-input" runat="server" />
                                <label class="custom-file-label" for="fuImg04">Choose file</label>
                            </div>
                            <div class="input-group-append">
                                <span class="input-group-text">Upload</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <asp:CheckBox ID="ch30Ret" runat="server" />
                            </span>
                        </div>
                        <label for="ch30Ret" class="form-control">Free Delivery</label>
                        <%--<input type="text" class="form-control">--%>
                    </div>
                    <!-- /input-group -->
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <asp:CheckBox ID="cbCOD" runat="server" />
                            </span>
                        </div>
                        <label for="cbCOD" class="form-control">30 Days Return</label>
                        <%--<input type="text" class="form-control">--%>
                    </div>
                    <!-- /input-group -->
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <asp:CheckBox ID="chFD" runat="server" />
                            </span>
                        </div>
                        <label for="chFD" class="form-control">COD</label>
                    </div>

                </div>

            </div>





            <!-- /.card-body -->

            <div class="card-footer">
                <asp:Button ID="btnAdd" CssClass="btn btn-success " runat="server" Text="ADD Product" OnClick="btnAdd_Click" />
            </div>
        </form>
    </div>
         </div>
 

    <%-- Report --%>
    <div class="container">

        <hr />
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2>Product Report</h2>
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="table table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="PID" HeaderText="S.No." />
                                    <asp:BoundField DataField="PName" HeaderText="PName" />
                                    <asp:BoundField DataField="PPrice" HeaderText="Price" />
                                    <asp:BoundField DataField="PSelPrice" HeaderText="SellPrice" />
                                    <asp:BoundField DataField="Brand" HeaderText="Brand" />
                                    <asp:BoundField DataField="CatName" HeaderText="Category" />
                                    <asp:BoundField DataField="SubCatName" HeaderText="SubCategory" />

                                    <asp:BoundField DataField="gender" HeaderText="gender" />
                                    <asp:BoundField DataField="SizeName" HeaderText="SizeName" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />

                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <%-- <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>" style=" height:150px; width:150px;"/> --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <%-- <asp:CommandField ShowEditButton="true" />  
                    <asp:CommandField ShowDeleteButton="true" />--%>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>

                </div>


            </div>
            <div class="panel-footer">Panel Footer</div>
        </div>

    </div>


</asp:Content>
