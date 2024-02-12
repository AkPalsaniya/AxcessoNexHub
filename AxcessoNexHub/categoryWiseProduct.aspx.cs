using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class categoryWiseProduct : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        static string ParentCId;
        static string subCId;
        static string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            ParentCId = Request.QueryString["parentCId"];
            subCId = Request.QueryString["subCId"];

            if(ParentCId == null && subCId == null)
            {
                //lblCategoryError.Text = "Plese Select Category";
                //h2ViewAll.Visible = false;
                Response.Redirect("product.aspx");

            }
            else if(ParentCId != null && subCId == null)
            {
                query = "SELECT A.*, B.*, C.Name AS BrandName, A.PPrice - A.PSelPrice AS DiscAmount, B.Name AS ImageName FROM tblProducts A INNER JOIN tblBrands C ON C.BrandID = A.PBrandID CROSS APPLY (SELECT TOP 1 * FROM tblProductImages B WHERE B.PID = A.PID ORDER BY B.PID DESC ) B where PcategoryId='" + ParentCId + "' ORDER BY A.PID DESC";
                BindProductRepeater();
            }
            else
            {
                query = "SELECT A.*, B.*, C.Name AS BrandName, A.PPrice - A.PSelPrice AS DiscAmount, B.Name AS ImageName FROM tblProducts A INNER JOIN tblBrands C ON C.BrandID = A.PBrandID CROSS APPLY (SELECT TOP 1 * FROM tblProductImages B WHERE B.PID = A.PID ORDER BY B.PID DESC ) B where PcategoryId='" + ParentCId + "' and pSubCatId='"+ subCId + "' ORDER BY A.PID DESC";
                BindProductRepeater();
            }

            //Response.Write(ParentCId);

            //BindProductRepeater();

        }
        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    //cmd.CommandType = CommandType.StoredProcedure;
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