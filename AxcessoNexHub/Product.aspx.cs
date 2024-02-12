using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;

namespace AxcessoNexHub
{
    public partial class Product : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string ParentCId = Request.QueryString["parentCId"];
            string subCId = Request.QueryString["subCId"];
            //Response.Write(ParentCId);

            BindProductRepeater();

        }
        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                        if (dt.Rows.Count <= 0)
                        {
                            //Label1.Text = "Sorry! Currently no products in this category.";
                        }
                        else
                        {
                            //Label1.Text = "Showing All Products";
                        }
                    }
                }
            }
        }
    }
}
