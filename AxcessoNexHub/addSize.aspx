<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="addSize.aspx.cs" Inherits="AxcessoNexHub.addSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- Data Table Script --%>
    <script type="text/javascript">  
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "adminAction.asmx/getSize",
                success: function (data) {
                    var datatableVariable = $('#tblAddSize').DataTable({
                        data: data,
                        columns: [
                            {
                                'data': null,
                                'render': function (data, type, row, meta) {
                                    return meta.row + 1;
                                }
                            },
                            { 'data': 'SizeName' },
                            { 'data': 'BrandName' },
                            { 'data': 'CategoryName' },
                            { 'data': 'SubCategoryName' },
                            { 'data': 'GenderName' },

                            {
                                'data': null,
                                'render': function (data, type, row) {
                                    return '<button type="button" onclick="editRow(' + row.SizeID + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>' +
                                        '&nbsp;' +
                                        '<button type="button" onclick="deletRow(' + row.BrandID + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></button>';

                                }
                            }
                        ],
                        lengthMenu: [[10, 50, 25, -1], [10, 50, 25, "All"]]
                    });

                    //$('#tblUserDetail tfoot th').each(function () {
                    //    var placeHolderTitle = $('#tblUserDetail thead th').eq($(this).index()).text();
                    //    $(this).html('<input type="text" class="form-control input input-sm" placeholder="Search ' + placeHolderTitle + '" />');
                    //});

                    //datatableVariable.columns().every(function () {
                    //    var column = this;
                    //    $(this.footer()).find('input').on('keyup change', function () {
                    //        column.search(this.value).draw();
                    //    });
                    //});

                    //new $.fn.dataTable.Buttons(datatableVariable, {
                    //    buttons: [
                    //        'copy', 'csv', 'excel', 'pdf', 'print'
                    //    ]
                    //});


                }
            });
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card card-primary mt-4">
        <br />
    </div>
    <div class="d-flex justify-content-between">
        <span style="font-size: 30px">
            <strong>Size</strong>
        </span>
        <span>
            <%--<asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClientClick="popToAddBrand();"/>--%>
            <button id="btnAddBrand" class="btn btn-success" onclick="popToAddSize()">Add</button>

        </span>
    </div>
    <hr />
    <div class="panel panel-default">
        <%-- Data Table --%>
        <table id="tblAddSize" style="max-width: 100%; border: 1px solid #C6C4C3">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Size</th>
                    <th>Brand Name</th>
                    <th>Category Name</th>
                    <th>Sub Category</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
        </table>


        <%-- Add Button Modal --%>
        <div class="modal fade" id="mdlToAddSize" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: fit-content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Add Brand</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="popTbl">
                            <tr>
                                <td><strong>Size Name</strong></td>
                                <td>
                                    <asp:TextBox ID="txtSize" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                                    <%--<asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Brand</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlBrand" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Category</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlCategory" CssClass="form-control col-md-6" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                                </td>
                                <%-- <td>
                                    <asp:Button ID="btnBindSubCaegory" runat="server" Text="get" OnClick="btnBindSubCaegory_Click"/>
                                </td>--%>
                            </tr>
                            <tr>
                                <td><strong>Sub Category</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlGender" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addSize()">Add</button>
                    </div>
                </div>
            </div>
        </div>


        <%-- Modal Popup --%>
        <div class="modal fade" id="MyPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document" style="width: fit-content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Edit Brand</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="popTbl">
                            <tr>
                                <td><strong>Id</strong></td>
                                <td>
                                    <asp:TextBox ID="txtId" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Size Name</strong></td>
                                <td>
                                    <asp:TextBox ID="txtNewSize" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
                                    <%--<asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Brand</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlUpdateBrand" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Category</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlUpdateCategory" CssClass="form-control col-md-6" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                                </td>
                                <%-- <td>
            <asp:Button ID="btnBindSubCaegory" runat="server" Text="get" OnClick="btnBindSubCaegory_Click"/>
        </td>--%>
                            </tr>
                            <tr>
                                <td><strong>Sub Category</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlUpdateSubCat" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Gender</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlUpdateGender" CssClass="form-control col-md-6" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="editSubCategoryDetail();">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%-- Add Button Click Script--%>
    <script>
        function popToAddSize() {
            $("#mdlToAddSize").modal("show");
            event.preventDefault();
        }
    </script>

    <%-- Add Size From Popup --%>
    <script type="text/javascript">
        function addSize() {

            var SizeName = document.getElementById('<%= txtSize.ClientID %>').value;
            var BrandName = document.getElementById('<%= ddlBrand.ClientID %>').selectedIndex;
            var CategoryName = document.getElementById('<%= ddlCategory.ClientID %>').selectedIndex;
            var SubCategoryName = document.getElementById('<%= ddlSubCategory.ClientID %>').selectedIndex;
            var Gender = document.getElementById('<%= ddlGender.ClientID %>').selectedIndex;

            if (SizeName !== '' && BrandName !== '' && CategoryName !== '' && SubCategoryName !== '' && Gender !== '') {
                $.ajax({
                    type: 'POST',
                    url: 'addSize.aspx/addNewSize',

                    data: "{'SizeName':'" + SizeName + "','BrandID':'" + BrandName + "','CategoryID':'" + CategoryName + "','SubCategoryID':'" + SubCategoryName + "','GenderID':'" + Gender + "'}",
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var obj = data.d;
                        if (obj === 'true') {
                            jQuery("#mdlToAddSubCategory").modal("hide");
                            alert("Data Saved Successfully");
                        }
                    },
                    error: function (result) {
                        alert("Error Occurred, Try Again");
                    }
                });
            } else {
                alert("Please Fill all the Fields");
                return false;
            }
        }
    </script>

    <%-- Edit Button Click Script --%>
    <script>
        function editRow(id) {
            console.log("Edit button clicked for ID: " + id);
            jQuery("#MyPopup").modal("show");

            $.ajax({
                type: "POST",
                url: "addSize.aspx/GetDataById",
                data: JSON.stringify({ id: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log("CatID: " + data.d.SizeID);

                    if (data != null) {
                        $('#<%= txtId.ClientID %>').val(data.d.SizeID);
                        $('#<%= txtNewSize.ClientID %>').val(data.d.SizeName);
                        $('#<%= ddlUpdateBrand.ClientID %>').val(data.d.BrandID);
                        $('#<%= ddlUpdateCategory.ClientID %>').val(data.d.CategoryID);
                        $('#<%= ddlUpdateSubCat.ClientID %>').val(data.d.SubCategoryID);
                        $('#<%= ddlGender.ClientID %>').val(data.d.GenderID);

                        <%--$('#<%= txtUpdateSubCategory.ClientID %>').val(data.d.SubCatName);--%>
                    }
                    else {
                        console.log("No valid data received for ID: " + id);
                    }
                },
                error: function (error) {
                    console.error("Error in AJAX request:", error);
                }
            });

            return false;
        }
    </script>

    <%-- Edit Brand From Popup --%>
<script type="text/javascript">
    function editSubCategoryDetail() {

        var SizeID = document.getElementById('<%= txtId.ClientID %>').value;
        var SizeName = document.getElementById('<%= txtNewSize.ClientID %>').value;
        var BrandID = document.getElementById('<%= ddlUpdateBrand.ClientID %>').value;
        var CategoryID = document.getElementById('<%= ddlUpdateCategory.ClientID %>').value;
        var SubCategoryID = document.getElementById('<%= ddlUpdateSubCat.ClientID %>').value;
        var Gender = document.getElementById('<%= ddlGender.ClientID %>').value;

        if (SizeID !== '', SizeName !== '', BrandID !== '', CategoryID !== '', Gender !== '') {
            $.ajax({
                type: 'POST',
                url: 'addSize.aspx/saveSize',
                data: "{'Id':'" + SizeID + "','SizeName':'" + SizeName + "','BrandID':'" + BrandID + "','CategoryID':'" + CategoryID + "','SubCategoryID':'" + SubCategoryID + "','Gender':'" + Gender + "'}",
                contentType: 'application/json; charset=utf-8',
                success: function (data) {
                    var obj = data.d;
                    if (obj === 'true') {
                        jQuery("#MyPopup").modal("hide");
                        alert("Data Saved Successfully");
                    }

                },
                error: function (result) {
                    alert("Error Occurred, Try Again");
                }
            });
        } else {
            alert("Please Fill all the Fields");
            return false;
        }
    }

</script>

</asp:Content>
