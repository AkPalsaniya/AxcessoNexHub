using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class addSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMainCat();
                //BindSubCatRptr();
            }
        }

        //private void BindSubCatRptr()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select A.*,B.* from tblSubCategory A inner join tblCategory B on B.CatID  =A.MainCatID  ", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                rptrSubCat.DataSource = dt;
        //                rptrSubCat.DataBind();
        //                gvSubCategory.DataSource = dt;
        //                gvSubCategory.DataBind();
        //                gvSubCategory.UseAccessibleHeader = true;
        //                gvSubCategory.HeaderRow.TableSection = TableRowSection.TableHeader;

        //            }
        //        }
        //    }
        //}

        protected void btnAddSubCategory_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblSubCategory(SubCatName,MainCatID) Values('" + txtSubCategory.Text + "','" + ddlMainCatID.SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('SubCategory Added Successfully ');  </script>");
                txtSubCategory.Text = string.Empty;

                con.Close();
                ddlMainCatID.ClearSelection();
                ddlMainCatID.Items.FindByValue("0").Selected = true;

            }
            //BindSubCatRptr();
        }

        private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlMainCatID.DataSource = dt;
                    ddlMainCatID.DataTextField = "CatName";
                    ddlMainCatID.DataValueField = "CatID";
                    ddlMainCatID.DataBind();
                    ddlMainCatID.Items.Insert(0, new ListItem("-Select-", "0"));

                    ddlUpdateCategory.DataSource = dt;
                    ddlUpdateCategory.DataTextField = "CatName";
                    ddlUpdateCategory.DataValueField = "CatID";
                    ddlUpdateCategory.DataBind();
                    //ddlUpdateCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                } 
            }
        }


        //Add New Sub Category From Popup
        [WebMethod]
        public static string addNewSubCategory(int CatID, string SubName)
        {

            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "Insert Into tblSubCategory Values('" + SubName+"','" + CatID + "')";
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
                //SqlCommand cmd = new SqlCommand("select A.SubCatID,A.SubCatName,B.CatName from tblSubCategory as A JOIN tblCategory as B on A.MainCatID = B.CatID where SubCatID = @Id", con);
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblSubCategory WHERE SubCatID = @Id\r\n", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        CatID = Convert.ToInt32(reader["SubCatID"]),
                        CatName = reader["MainCatID"].ToString(),
                        SubCatName = reader["SubCatName"].ToString(),
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


        //Edit Sub Category From Popup
        [WebMethod]
        public static string saveSubCategoryDetail(string Id, string CatID, string SubCatName)
        {
            int id = Convert.ToInt16(Id);
            int mainCatId = Convert.ToInt16(CatID);
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "UPDATE tblSubCategory SET SubCatName='" + SubCatName + "',MainCatID='" + mainCatId + "' WHERE SubCatID =@Id";
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