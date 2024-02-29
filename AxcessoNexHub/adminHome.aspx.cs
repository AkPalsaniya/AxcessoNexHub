using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class adminHome : System.Web.UI.Page
    {
        String strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            bindTotalDetail();
        }

        private void bindTotalDetail()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string ToatalProduct = "select count(pName) from tblProducts";
            string TotalUser = "select count(uid) from tblusers";
            string ToatalSale = "select count(orderID) from tblOrders";
            string ToatalRevenue = "select sum(Totalpaid) from tblOrders";

            SqlCommand cmd1 = new SqlCommand(ToatalProduct,con);
            SqlCommand cmd2 = new SqlCommand(TotalUser, con);
            SqlCommand cmd3 = new SqlCommand(ToatalSale, con);
            SqlCommand cmd4 = new SqlCommand(ToatalRevenue, con);

            object totalProduct = cmd1.ExecuteScalar();
            object totalUser = cmd2.ExecuteScalar();
            object toatalSale = cmd3.ExecuteScalar();
            object toatalRevenue = cmd4.ExecuteScalar();

            // Check if the result is not null
            if (totalProduct != null)
            {
                // Convert result to string and set it to lblTotalProduct.Text
                lblTotalProduct.Text = totalProduct.ToString();
                lblTotalUser.Text = totalUser.ToString();
                lblTotalSale.Text = toatalSale.ToString();
                lblTotalRevenue.Text = toatalRevenue.ToString();
            }
        }
    }
}