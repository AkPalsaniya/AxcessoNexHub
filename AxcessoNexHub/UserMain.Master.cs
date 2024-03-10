using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace AxcessoNexHub
{
    public partial class UserMain : System.Web.UI.MasterPage
    {

        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartNumber22();
        }

        public void BindCartNumber22()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        proCount.InnerText = CartQuantity;
                        //proCount.InnerText = "5"; 
                        }
                        else
                        {
                            proCount.InnerText = 0.ToString();  
                        }
                    }
                }
            }
        }

        protected void lknBtnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null; 
            Response.Redirect("SignIn.aspx");
        }
    }
}