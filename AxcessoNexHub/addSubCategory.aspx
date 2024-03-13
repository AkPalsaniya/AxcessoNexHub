<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="addSubCategory.aspx.cs" Inherits="AxcessoNexHub.addSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script type="text/javascript">
        $(function () {
            $('#<%=gvSubCategory.ClientID%>').DataTable();
    });
    </script>--%>

    <%-- Data Table Script --%>
    <script type="text/javascript">  
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "adminAction.asmx/getSubCategory",
                success: function (data) {
                    var datatableVariable = $('#tblSubCategory').DataTable({
                        data: data,
                        columns: [
                            {
                                'data': null,
                                'render': function (data, type, row, meta) {
                                    return meta.row + 1;
                                }
                            },
                            { 'data': 'SubCatName' },
                            { 'data': 'MainCatID' },

                            {
                                'data': null,
                                'render': function (data, type, row) {
                                    return '<button type="button" onclick="editRow(' + row.SubCatID + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>';
                                        //'&nbsp;' +
                                        //'<button type="button" onclick="deletRow(' + row.BrandID + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></button>';

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
    <div class="container ">
        <div class="form-horizontal ">
            <br />


            <div class="d-flex justify-content-between">
                <span style="font-size: 30px">
                    <strong>Sub Categories</strong>
                </span>
                <span>
                    <%--<asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClientClick="popToAddBrand();"/>--%>
                    <button id="btnAddBrand" class="btn btn-success" onclick="popToAddSubCategory()">Add</button>

                </span>
            </div>
            <hr />
            <div class="panel panel-default">
                <div class="panel-heading">All Sub Categories</div>





                <%-- Data Table --%>
                <table id="tblSubCategory" style="max-width: 100%; border: 1px solid #C6C4C3">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Sub Cat</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                    </tfoot>
                </table>
            </div>

            <%-- Add Button Modal --%>
            <div class="modal fade" id="mdlToAddSubCategory" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                    <td><strong>Category Name</strong></td>
                                    <td>
                                        <asp:DropDownList ID="ddlMainCatID" CssClass="form-control" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMainCatID" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Sub Category</strong></td>
                                    <td>
                                        <asp:TextBox ID="txtSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtSubCategoryName" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter SubCategory" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="addSubCategory()">Add</button>
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
                                    <td><strong>Category Name</strong></td>
                                    <td>
                                        <asp:DropDownList ID="ddlUpdateCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Main CategoryID" ControlToValidate="ddlMainCatID" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Sub Category</strong></td>
                                    <td>
                                        <asp:TextBox ID="txtUpdateSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter SubCategory" ControlToValidate="txtSubCategory" ForeColor="Red"></asp:RequiredFieldValidator>--%>
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
            function popToAddSubCategory() {
                $("#mdlToAddSubCategory").modal("show");
                event.preventDefault();  // Prevent the default button click behavior
            }
        </script>

        <%-- Add Brand From Popup --%>
        <script type="text/javascript">
            function addSubCategory() {

                var CatID = document.getElementById('<%= ddlMainCatID.ClientID %>').selectedIndex;
                var SubCatName = document.getElementById('<%= txtSubCategory.ClientID %>').value;

                if (CatID !== '' && SubCatName !== '') {
                    $.ajax({
                        type: 'POST',
                        url: 'addSubCategory.aspx/addNewSubCategory',

                        data: "{'CatID':'" + CatID + "','SubName':'" + SubCatName + "'}",
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
                    url: "addSubCategory.aspx/GetDataById",
                    data: JSON.stringify({ id: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        console.log("CatID: " + data.d.CatID);
                       
                        if (data != null) {
                            $('#<%= txtId.ClientID %>').val(data.d.CatID);
                            $('#<%= ddlUpdateCategory.ClientID %>').val(data.d.CatName);
                            $('#<%= txtUpdateSubCategory.ClientID %>').val(data.d.SubCatName);
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

                var SubCatID = document.getElementById('<%= txtId.ClientID %>').value;
                var CatID = document.getElementById('<%= ddlUpdateCategory.ClientID %>').value;
                var SubCatName = document.getElementById('<%= txtUpdateSubCategory.ClientID %>').value;
                
                if (SubCatID !== '', CatID !== '', SubCatName !== '') {
                    $.ajax({
                        type: 'POST',
                        url: 'addSubCategory.aspx/saveSubCategoryDetail',
                        data: "{'Id':'" + SubCatID + "','CatID':'" + CatID + "','SubCatName':'" + SubCatName + "'}",
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
