<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="orderManage.aspx.cs" Inherits="AxcessoNexHub.orderManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%-- Datatable Script --%>
    <script type="text/javascript">  
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "adminAction.asmx/getOrderDetail",
                success: function (data) {
                    var datatableVariable = $('#tblOrderDetail').DataTable({
                        data: data,
                        columns: [
                            {
                                'data': null,
                                'render': function (data, type, row, meta) {
                                    return meta.row + 1;
                                }
                            },
                            { 'data': 'Name' },
                            { 'data': 'Product' },
                            { 'data': 'Status' },

                            {
                                'data': null,
                                'render': function (data, type, row) {
                                    //return '<button type="button" onclick="editRow(' + row.OrderID + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>';
                                    return '<button type="button" onclick="editRow(' + row.Id + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>';
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
        <br />

        <div class="d-flex justify-content-between">
            <span style="font-size: 30px">
                <strong>Orders</strong>
            </span>
            <span>
                <%--<asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClientClick="popToAddBrand();"/>--%>
                <%--<button id="btnAddBrand" class="btn btn-success" onclick="popToAddBrand()">Add</button>--%>
            </span>
        </div>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Orders</div>
        </div>

        <table id="tblOrderDetail" style="max-width: 100%; border: 1px solid #C6C4C3">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Product</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
        </table>

    </div>

    <%-- Modal Popup --%>
    <div class="modal fade" id="MyPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width: fit-content">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Update Status</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="popTbl">
                        <tr>
                            <td><strong>Order Id</strong></td>
                            <td>
                                <asp:TextBox ID="txtId" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td><strong>NAME :</strong></td>
                            <td>
                                <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td><strong>Product :</strong></td>
                            <td>
                                <asp:TextBox ID="txtProduct" CssClass="form-control" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td><strong>Status :</strong></td>
                            <td>
                                <%--<asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                    <asp:ListItem>Pending</asp:ListItem>
                                    <asp:ListItem>Approve</asp:ListItem>
                                    <asp:ListItem>Deleverd</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="updateOrder();">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Edit Button Script --%>
    <script>
        function editRow(id) {
            console.log("Edit button clicked for ID: " + id);
            jQuery("#MyPopup").modal("show");

            $.ajax({
                type: "POST",
                url: "orderManage.aspx/GetDataById",
                data: JSON.stringify({ id: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log("Order ID: " + data.d.OrderID);

                    if (data != null) {
                        $('#<%= txtId.ClientID %>').val(data.d.OrderID);
                        $('#<%= txtName.ClientID %>').val(data.d.Name);
                        $('#<%= txtProduct.ClientID %>').val(data.d.Product);
                        $('#<%= ddlStatus.ClientID %>').val(data.d.Status);
                    } else {
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
        function updateOrder() {

            var orderId = document.getElementById('<%= txtId.ClientID %>').value;
            var Name = document.getElementById('<%= txtName.ClientID %>').value;
            var Product = document.getElementById('<%= txtProduct.ClientID %>').value;
            var Status = document.getElementById('<%= ddlStatus.ClientID %>').value;

            if (orderId !== '', Name !== '', Product !== '', Status !== '') {
                $.ajax({
                    type: 'POST',
                    url: 'orderManage.aspx/updateOrderStatus',
                    data: "{'Id':'" + orderId + "','Name':'" + Name + "','Product':'" + Product + "','Status':'" + Status + "'}",
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
