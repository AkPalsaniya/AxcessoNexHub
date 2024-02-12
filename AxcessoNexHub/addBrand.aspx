<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="addBrand.aspx.cs" Inherits="AxcessoNexHub.addBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<script type="text/javascript">
        $(function () {
            $('#<%=gvBrand.ClientID%>').DataTable();
        });
    </script>--%>

    <%-- Datatable Script --%>
    <script type="text/javascript">  
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "adminAction.asmx/GetBrandById",
                success: function (data) {
                    var datatableVariable = $('#tblUserDetail').DataTable({
                        data: data,
                        columns: [
                            {
                                'data': null,
                                'render': function (data, type, row, meta) {
                                    return meta.row + 1;
                                }
                            },
                            { 'data': 'Name' },

                            {
                                'data': null,
                                'render': function (data, type, row) {
                                    return '<button type="button" onclick="editRow(' + row.Id + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>' +
                                        '&nbsp;' +
                                        '<button type="button" onclick="deletRow(' + row.Id + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></button>';

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

    <%-- Edit Button Script --%>
    <script>
        function editRow(id) {
            console.log("Edit button clicked for ID: " + id);
            jQuery("#MyPopup").modal("show");

            $.ajax({
                type: "POST",
                url: "addBrand .aspx/GetDataById",
                data: JSON.stringify({ id: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data != null) {

                        $('#<%= txtId.ClientID %>').val(data.d.BrandID);
                        $('#<%= txtName.ClientID %>').val(data.d.Name);
                    <%--$('#<%= txtDOB.ClientID %>').val(data.d.DOB);
                    $('#<%= ddlGender.ClientID %>').val(data.d.Gender);
                    $('#<%= txtCity.ClientID %>').val(data.d.City);
                    $('#<%= txtMobileNo.ClientID %>').val(data.d.MobileNo);
                    $('#<%= ddlDrName.ClientID %>').val(data.d.DrName);--%>

                    }
                    else {
                        console.log("No valid data received for ID: " + Id);
                    }
                }
            });
            return false;

        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container ">
        <br />
        <br />

        <div class="form-horizontal ">
            <h2>Add Brand</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label " runat="server" Text="BrandName"></asp:Label>
                <div class="col-md-3 ">
                    <asp:TextBox ID="txtBrand" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" runat="server" CssClass="text-danger " ErrorMessage="*plz Enter Brandname" ControlToValidate="txtBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-2 "></div>
                <div class="col-md-4 ">
                    <asp:Button ID="btnAddBrand" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btnAddBrand_Click" />
                </div>
            </div>
        </div>

        <h1>Brands</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>

            <%--<asp:GridView ID="gvBrand" runat="server" DataKeyNames="BrandID" AutoGenerateColumns="False" OnRowCancelingEdit="gvBrand_RowCancelingEdit" OnRowDeleting="gvBrand_RowDeleting" OnRowEditing="gvBrand_RowEditing" OnRowUpdating="gvBrand_RowUpdating">
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="BrandID" />
                    <asp:BoundField HeaderText="Brand Name" DataField="Name" />
                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="false" ButtonType="Link" HeaderText="Action" CausesValidation="false" />

                </Columns>
            </asp:GridView>--%>
        </div>

        <table id="tblUserDetail" style="max-width: 100%; border: 1px solid #C6C4C3">
            <thead>
                <tr>
                    <th>Brand Id</th>
                    <th>Name</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
        </table>

    </div>

    <%-- Modal Popup --%>
    <div class="modal fade" id="MyPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- Modal Body --%>
                <div class="modal-body">
                    <div id="divToPrint" class="divToPrint" runat="server">

                        <table class="popTbl">
                            <tr>
                                <td class="tblTd" colspan="2"><strong>PATIENT REGISTRATION FORM<br />
                                </strong></td>
                            </tr>
                            <tr>
                                <td><strong>Id :</strong></td>
                                <td>
                                    <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>NAME :</strong></td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td><strong>DOB :</strong></td>
                                <td>
                                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Width="100%"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td><strong>GENDER :</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlGender" runat="server" Width="100%">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td><strong>CITY :</strong></td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity"
                                        ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>MOBILE NO :</strong></td>
                                <td>
                                    <asp:TextBox ID="txtMobileNo" runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                        ErrorMessage="*" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>DR NAME :</strong></td>
                                <td>
                                    <asp:DropDownList ID="ddlDrName" runat="server" Width="100%">
                                        <asp:ListItem>Dr A</asp:ListItem>
                                        <asp:ListItem>Dr B</asp:ListItem>
                                        <asp:ListItem>Dr C</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                        </table>
                    </div>

                </div>
                <div class="modal-footer" style="display: flex; justify-content: center; gap: 20px">
                    <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 <button type="button" onclick="AddPatientDetail();" class="btn btn-primary">Save changes</button>--%>
                    <%--<asp:Button ID="btnGeneratePdf" Text="pdf" runat="server" class="btn btn-primary" OnClick="btnGeneratePdf_Click" />--%>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
