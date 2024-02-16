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
    public partial class addSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindMainCategory();
                BindGender();
                //BindrptrSize();
            }

        }

        //private void BindrptrSize()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.*,D.*,E.* from tblSizes A inner join tblCategory B on B.CatID =a.CategoryID  inner join tblBrands C on C.BrandID =A.BrandID inner join tblSubCategory D on D.SubCatID =A.SubCategoryID inner join tblGender E on E.GenderID =A.GenderID ", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                rptrSize.DataSource = dt;
        //                rptrSize.DataBind();
        //            }
        //        }
        //    }
        //}

        private void BindMainCategory()
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
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                    ddlUpdateCategory.DataSource = dt;
                    ddlUpdateCategory.DataTextField = "CatName";
                    ddlUpdateCategory.DataValueField = "CatID";
                    ddlUpdateCategory.DataBind();
                    ddlUpdateCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                     
                }
            }
        }



        private void BindBrand()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblBrands", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

                    ddlUpdateBrand.DataSource = dt;
                    ddlUpdateBrand.DataTextField = "Name";
                    ddlUpdateBrand.DataValueField = "BrandID";
                    ddlUpdateBrand.DataBind();
                    ddlUpdateBrand.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }



        private void BindGender()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblGender with(nolock)", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlGender.DataSource = dt;
                    ddlGender.DataTextField = "GenderName";
                    ddlGender.DataValueField = "GenderID";
                    ddlGender.DataBind();
                    ddlGender.Items.Insert(0, new ListItem("-Select-", "0"));

                    ddlUpdateGender.DataSource = dt;
                    ddlUpdateGender.DataTextField = "GenderName";
                    ddlUpdateGender.DataValueField = "GenderID";
                    ddlUpdateGender.DataBind();
                    ddlUpdateGender.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        protected void btnAddSize_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblSizes(SizeName,BrandID,CategoryID,SubCategoryID,GenderID) Values('" + txtSize.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "','" + ddlSubCategory.SelectedItem.Value + "','" + ddlGender.SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Size Added Successfully ');  </script>");
                txtSize.Text = string.Empty;

                con.Close();
                ddlBrand.ClearSelection();
                ddlBrand.Items.FindByValue("0").Selected = true;

                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;


                ddlSubCategory.ClearSelection();
                ddlSubCategory.Items.FindByValue("0").Selected = true;

                ddlGender.ClearSelection();
                ddlGender.Items.FindByValue("0").Selected = true;

            }
            //BindrptrSize();
        }

        protected void binDdlSubCategory()
        {

        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    ddlSubCategory.DataSource = dt;
                    ddlSubCategory.DataTextField = "SubCatName";
                    ddlSubCategory.DataValueField = "SubCatID";
                    ddlSubCategory.DataBind();
                    ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                    ddlUpdateSubCat.DataSource = dt;
                    ddlUpdateSubCat.DataTextField = "SubCatName";
                    ddlUpdateSubCat.DataValueField = "SubCatID";
                    ddlUpdateSubCat.DataBind();
                    ddlUpdateSubCat.Items.Insert(0, new ListItem("-Select-", "0"));

                    // Show the Bootstrap modal after populating the ddlSubCategory
                    //ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#mdlToAddSize').modal('show');", true);
                }
            }
        }

        //Add New Sub Size From Popup
        [WebMethod]
        public static string addNewSize(string SizeName, string BrandID, string CategoryID, string SubCategoryID, string GenderID)
        {
          
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "Insert Into tblSizes Values('" + SizeName + "','" + BrandID + "','" + CategoryID + "','" + SubCategoryID + "','" + GenderID + "')";
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblSizes WHERE SizeID = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        SizeID = Convert.ToInt32(reader["SizeID"]),
                        SizeName = reader["SizeName"].ToString(),
                        BrandID = reader["BrandID"].ToString(),
                        CategoryID = reader["CategoryID"].ToString(),
                        SubCategoryID = reader["SubCategoryID"].ToString(),
                        GenderID = reader["GenderID"].ToString(),
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


        //Edit Size From Popup
        [WebMethod]
        public static string saveSize(string Id, string SizeName, string BrandID, string CategoryID, string SubCategoryID, string Gender)
        {
            int id = Convert.ToInt16(Id);
            
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            String Query = "UPDATE tblSizes SET SizeName='" + SizeName + "',BrandID='" + BrandID + "',CategoryID='" + CategoryID + "',SubCategoryID='" + 1 + "',GenderID='" + Gender + "' WHERE SizeID =@Id";
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