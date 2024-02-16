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
    public partial class addCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //BindCategoryReapter();
        }

        //private void BindCategoryReapter()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select * from tblCategory", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                rptrCategory.DataSource = dt;
        //                rptrCategory.DataBind();
        //            }
        //        }
        //    }
        //}

        //protected void btnAddtxtCategory_Click(object sender, EventArgs e)
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Insert into tblCategory(CatName) Values('" + txtCategory.Text + "')", con);
        //        cmd.ExecuteNonQuery();

        //        Response.Write("<script> alert('Category Added Successfully ');  </script>");
        //        txtCategory.Text = string.Empty;

        //        con.Close();
        //        //lblMsg.Text = "Registration Successfully done";
        //        //lblMsg.ForeColor = System.Drawing.Color.Green;
        //        txtCategory.Focus();


        //    }
        //}

        //protected void rptrCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Edit")
        //    {
        //        // Retrieve the CatID from the CommandArgument
        //        string catID = e.CommandArgument.ToString();

        //        // Implement your logic for editing based on the catID
        //        // For example, you might redirect to an edit page or show a modal for editing.
        //    }
        //}


        //Add New Category From Popup
        [WebMethod]
        public static string addNewCategory(string Name)
        {

            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "Insert Into tblCategory Values('" + Name + "')";
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
                SqlCommand cmd = new SqlCommand("Select * from tblCategory where CatID = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        CatID = Convert.ToInt32(reader["CatID"]),
                        CatName = reader["CatName"].ToString(),
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

        //Edit Category From Popup
        [WebMethod]
        public static string saveCategoryDetail(string Id, string Name)
        {
            int id = Convert.ToInt16(Id);
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "UPDATE tblCategory SET CatName='" + Name + "' WHERE CatID =@Id";
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
    }
}