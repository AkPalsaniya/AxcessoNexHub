using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace AxcessoNexHub
{
    public partial class UserHome : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindProductRepeater();
        }

        //Repeter Bind
        private void BindProductRepeater()
        {
            //using (SqlConnection con = new SqlConnection(CS))
            //{
            //    using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //        {
            //            DataTable dt = new DataTable();
            //            sda.Fill(dt);
            //            rptrProducts.DataSource = dt;
            //            rptrProducts.DataBind();
            //            if (dt.Rows.Count <= 0)
            //            {
            //                //Label1.Text = "Sorry! Currently no products in this category.";
            //                pCount.InnerHtml = "0";
            //            }
            //            else
            //            {
            //                //Label1.Text = "Showing All Products";
            //            }
            //        }
            //    }
            //}
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("procBindAllProducts", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptrProducts.DataSource = dt;
            rptrProducts.DataBind();
            if (dt.Rows.Count <= 0)
            {
                //pCount.InnerHtml = "0";
            }
            else
            {

            }
        }
    }
}