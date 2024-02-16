using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace AxcessoNexHub
{
    public partial class addBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //gvBindBrand();
            }
        }

        

        //protected void btnAddBrand_Click(object sender, EventArgs e)
        //{
        //    if (txtBrand.Text != null && txtBrand.Text != "" && txtBrand.Text != string.Empty)
        //    {
        //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //        {
        //            con.Open();
        //            SqlCommand cmd = new SqlCommand("Insert into tblBrands(Name) Values('" + txtBrand.Text + "')", con);
        //            cmd.ExecuteNonQuery();

        //            Response.Write("<script> alert('Brand Added Successfully ');  </script>");
        //            txtBrand.Text = string.Empty;

        //            con.Close();
        //            //lblMsg.Text = "Registration Successfully done";
        //            //lblMsg.ForeColor = System.Drawing.Color.Green;
        //            txtBrand.Focus();
        //        }
        //    }
        //}


        //Bind Data In Modal Popup
        [WebMethod]
        public static object GetDataById(int id)
        {

            object data = null;
            int Id = id;
            try
            {
                string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
                //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;Encrypt=True";

                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblBrands where BrandID = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        BrandID = Convert.ToInt32(reader["BrandID"]),
                        Name = reader["Name"].ToString(),
                    };
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                data = new { Error = ex.Message };
            }
            return data;
        }


       //Edit Brand From Popup
        [WebMethod]
        public static string saveBrandDetail(string Id, string Name)
        {
            int id =Convert.ToInt16(Id);
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "UPDATE tblBrands SET Name='" + Name + "' WHERE BrandID =@Id";
            con.Open();


            SqlCommand cmd = new SqlCommand(Query, con);
            cmd.Parameters.AddWithValue("Id", id);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                msg = "true";
            }
            else
            {
                msg = "false";
            }
            return msg;
        }

        //Add New Brand Using Popup
        [WebMethod]
        public static string addNewBrand(string Name)
        {
            
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "Insert Into tblBrands Values('" + Name + "')";
            con.Open();


            SqlCommand cmd = new SqlCommand(Query, con);
            
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                msg = "true";
            }
            else
            {
                msg = "false";
            }
            return msg;
        }



    }
}
 