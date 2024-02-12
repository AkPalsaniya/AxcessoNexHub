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

        //private void gvBindBrand()
        //{
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select * from tblBrands", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                //rptrBrands.DataSource = dt;
        //                //rptrBrands.DataBind();
        //                gvBrand.DataSource = dt;
        //                gvBrand.DataBind();
        //            }
        //        }
        //    }
        //    gvBrand.UseAccessibleHeader = true;
        //    gvBrand.HeaderRow.TableSection = TableRowSection.TableHeader;
        //}

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            if (txtBrand.Text != null && txtBrand.Text != "" && txtBrand.Text != string.Empty)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblBrands(Name) Values('" + txtBrand.Text + "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Brand Added Successfully ');  </script>");
                    txtBrand.Text = string.Empty;

                    con.Close();
                    //lblMsg.Text = "Registration Successfully done";
                    //lblMsg.ForeColor = System.Drawing.Color.Green;
                    txtBrand.Focus();
                }
            }
        }

        //protected void gvBrand_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gvBrand.EditIndex = e.NewEditIndex;
        //    gvBindBrand();
        //}

        //protected void gvBrand_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gvBrand.EditIndex = -1;
        //    gvBindBrand();
        //}

        //protected void gvBrand_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString);
        //    con.Open();
        //    //int id = Convert.ToInt16(gvBrand.DataKeys[e.RowIndex].Values["BrandID"].ToString());
        //    SqlCommand cmd = new SqlCommand("delete tblBrands where BrandID=@id", con);
        //    cmd.Parameters.AddWithValue("@id", e.Keys["BrandID"]);
        //    //cmd.Parameters.AddWithValue("@name", e.NewValues["Name"]);
        //    int a = cmd.ExecuteNonQuery();
        //    if (a > 0)
        //    {
        //        Response.Write("<script> alert('Brand Edit Successfully ');</script>");
        //        //Response.Write("Succes");
        //    }
        //    else
        //    {
        //        Response.Write("<script> alert('Error Occer, Try Again');</script>");
        //    }
        //    //txtBrand.Text = string.Empty;
        //    con.Close();
        //    gvBrand.EditIndex = -1;
        //    gvBindBrand();
        //}

        //protected void gvBrand_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("update tblBrands set Name=@name where BrandID=@id", con);
        //    cmd.Parameters.AddWithValue("@id", e.NewValues["BrandID"]);
        //    cmd.Parameters.AddWithValue("@name", e.NewValues["Name"]);
        //    int a = cmd.ExecuteNonQuery();
        //    if (a > 0)
        //    {
        //        Response.Write("<script> alert('Brand Deleted Successfully ');</script>");
        //        Response.Write("Succes");
        //    }
        //    else
        //    {
        //        Response.Write("Error Occer, try Again");

        //    }
        //    //txtBrand.Text = string.Empty;
        //    con.Close();
        //    gvBrand.EditIndex = -1;
        //    gvBindBrand(); 
        //}

        [WebMethod]
        public static object GetBrandById(int id)
        {

            object data = null;
            int Id = id;
            try
            {
                string strCon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tblBrands where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        BrandID = reader["BrandID"],
                        Name = reader["Name"],
                        //DOB = reader["DOB"],
                        //Gender = reader["Gender"],
                        //City = reader["City"],
                        //MobileNo = reader["MobileNo"],
                        //DrName = reader["DrName"],
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
    }
}
 