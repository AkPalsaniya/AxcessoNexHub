<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="addCategory.aspx.cs" Inherits="AxcessoNexHub.addCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container ">
        <div class="form-horizontal ">
            <br />
            <br />

            <h2>Add Category</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label " runat="server" Text="Category Name"></asp:Label>
                <div class="col-md-3 ">

                    <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtCategoryName" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Brandname" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>



            <div class="form-group">
                <div class="col-md-2 "></div>
                <div class="col-md-6 ">
                    <asp:Button ID="btnAddtxtCategory" CssClass="btn btn-success " runat="server" Text="Add Category" OnClick="btnAddtxtCategory_Click" />
                </div>
            </div>


        </div>

        <h1>Categories</h1>
        <hr />

        <div class="panel panel-default">

            <div class="panel-heading">All Categories</div>

            <asp:Repeater ID="rptrCategory" runat="server" OnItemCommand="rptrCategory_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Categories</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("CatID") %> </td>
                        <td><%# Eval("CatName") %> </td>
                        <td>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Eval("CatID") %>' CausesValidation="false" />
                        </td>
                    </tr>
                </ItemTemplate>
               

                <FooterTemplate>
                    </tbody>
    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:GridView ID="gvCategory" runat="server">

            </asp:GridView>
        </div>

    </div>

</asp:Content>
