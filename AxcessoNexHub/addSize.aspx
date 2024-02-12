<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="addSize.aspx.cs" Inherits="AxcessoNexHub.addSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card card-primary mt-4">
        <div class="card-header">
            <h3 class="card-title">Add Size</h3>
        </div>

        <form>
            <div class="card-body">

                <div class="form-group">
                    <label for="txtProductName">Size Name</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Size" ControlToValidate="txtSize" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtSize" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="ddlCategory">Brand</label>
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlBrand" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label for="ddlCategory">Category</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter  Category" ControlToValidate="ddlCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control col-md-6" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="ddlCategory">Sub Category</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Sub Category" ControlToValidate="ddlSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="ddlCategory">Gender</label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Gender" ControlToValidate="ddlGender" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:DropDownList ID="ddlGender" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="card-footer">
                <asp:Button ID="btnAddSize" CssClass="btn btn-success " runat="server" Text="Add Size" OnClick="btnAddSize_Click" />
            </div>

        </form>
    </div>




    <div class="panel panel-default">

        < class="panel-heading">All Sizes</  >


        <asp:Repeater ID="rptrSize" runat="server">

            <HeaderTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Size</th>
                            <th>Brand</th>
                            <th>Category</th>
                            <th>Sub Category</th>
                            <th>Gender</th>
                        </tr>
                    </thead>

                    <tbody>
            </HeaderTemplate>


            <ItemTemplate>
                <tr>
                    <th><%# Eval("SizeID") %> </th>
                    <td><%# Eval("SizeName") %>   </td>
                    <td><%# Eval("Name") %>   </td>
                    <td><%# Eval("CatName") %>   </td>
                    <td><%# Eval("SubCatName") %>   </td>
                    <td><%# Eval("GenderName") %>   </td>
                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </tbody>

          </table>
            </FooterTemplate>

        </asp:Repeater>






    </div>


    </div>
</asp:Content>
