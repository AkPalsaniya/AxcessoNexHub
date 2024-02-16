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
                url: "adminAction.asmx/getBrand",
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
                                    return '<button type="button" onclick="editRow(' + row.BrandID + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>';
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


    <%-- Add Button Click --%>
    <script>
        function popToAddBrand() {
            $("#exampleModalCenter").modal("show");
            event.preventDefault();  // Prevent the default button click behavior
        }
    </script>

    <%-- Edit Button Script --%>
    <script>
        function editRow(id) {
            console.log("Edit button clicked for ID: " + id);
            jQuery("#MyPopup").modal("show");

            $.ajax({
                type: "POST",
                url: "addBrand.aspx/GetDataById",
                data: JSON.stringify({ id: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log("BrandID: " + data.d.BrandID);

                    if (data != null) {
                        $('#<%= txtId.ClientID %>').val(data.d.BrandID);
                        $('#<%= txtName.ClientID %>').val(data.d.Name);
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




</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container ">
        <br />
        
        <div class="d-flex justify-content-between">
            <span style="font-size: 30px">
                <strong>Brands</strong>
            </span>
            <span>
                <%--<asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClientClick="popToAddBrand();"/>--%>
                <button id="btnAddBrand" class="btn btn-success" onclick="popToAddBrand()">Add</button>

            </span>
        </div>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">All Brands</div>

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
                            <td><strong>Brand Id</strong></td>
                            <td>
                                <asp:TextBox ID="txtId" runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td><strong>NAME :</strong></td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="editBrandDetail();">Save changes</button>
                </div>
            </div>
        </div>
    </div>


    <%-- Add Button Modal --%>
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" style="width:fit-content">
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
                            <td><strong>Brand Name</strong></td>
                            <td>
                                <asp:TextBox ID="txtAddBrand" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="addBrand()">Add Brand</button>
                </div>
            </div>
        </div>
    </div>


    <%-- Edit Brand From Popup --%>
    <script type="text/javascript">
        function editBrandDetail() {

            var BrandID = document.getElementById('<%= txtId.ClientID %>').value;
            var Name = document.getElementById('<%= txtName.ClientID %>').value;

            if (Name !== '') {
                $.ajax({
                    type: 'POST',
                    url: 'addBrand.aspx/saveBrandDetail',
                    data: "{'Id':'" + BrandID + "','Name':'" + Name + "'}",
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

    <%-- Add Brand From Popup --%>
    <script type="text/javascript">
        function addBrand() {

            var Name = document.getElementById('<%= txtAddBrand.ClientID %>').value;

            if (Name !== '') {
                $.ajax({
                    type: 'POST',
                    url: 'addBrand.aspx/addNewBrand',

                    data: "{'Name':'" + Name + "'}",
                    contentType: 'application/json; charset=utf-8',
                    success: function (data) {
                        var obj = data.d;
                        if (obj === 'true') {
                            jQuery("#exampleModalCenter").modal("hide");
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


