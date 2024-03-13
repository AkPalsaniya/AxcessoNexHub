<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="userDetail.aspx.cs" Inherits="AxcessoNexHub.userDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- jQuery Link -->
    <%--<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>

    <%--<!-- jQuery DataTables CDN -->
    <link href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>--%>



    <script type="text/javascript">  
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "UserList.asmx/GetPatient",
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
                            { 'data': 'Username' },


                            { 'data': 'Email' },

                            { 'data': 'Usertype' }

                            //{
                            //    'data': null,
                            //    'render': function (data, type, row) {
                            //        return '<button type="button" onclick="editRow(' + row.Id + ')" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button>' +
                            //            '&nbsp;' +
                            //            '<button type="button" onclick="deletRow(' + row.Id + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash" aria-hidden="true"></i></button>';

                            //    }
                            //}
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
    <%-- User Detail Table --%>
    <div class="card-body">

        <table id="tblUserDetail" style="max-width: 100%; border: 1px solid #C6C4C3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th> 
                    <th>Email</th>
                    <th>User Type</th>
                    <%--<th>Action</th>--%>
                </tr>
            </thead>
            <tfoot>
            </tfoot>
        </table>

    </div>
</asp:Content>
