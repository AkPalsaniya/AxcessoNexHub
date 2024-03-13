using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace AxcessoNexHub
{
    /// <summary>
    /// Summary description for adminAction
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class adminAction : System.Web.Services.WebService
    {
        //Get Brand
        [WebMethod]
        public void getBrand()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<brandList>();

            using (var con = new SqlConnection(strCon))
            {
                var cmd = new SqlCommand("select * from tblBrands", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    var rObj = new brandList
                    {
                        BrandID = dr[0].ToString(),
                        Name = dr[1].ToString(),
                        
                    };

                    ret.Add(rObj);
                }
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }

        //Get Category
        [WebMethod]
        public void getCategory()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<categoryList>();

            using (var con = new SqlConnection(strCon))
            {
                var cmd = new SqlCommand("select * from tblCategory", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var rObj = new categoryList
                    {
                        CatID = dr[0].ToString(),
                        CatName = dr[1].ToString(),
                    };

                    ret.Add(rObj);
                }
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }
        
        //Get Sub Category
        [WebMethod]
        public void getSubCategory()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<subCategoryList>();

            using (var con = new SqlConnection(strCon))
            {
                var cmd = new SqlCommand("select A.SubCatID,A.SubCatName,B.CatName from tblSubCategory as A JOIN tblCategory as B on A.MainCatID = B.CatID", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var rObj = new subCategoryList
                    {
                        SubCatID = dr["SubCatID"].ToString(),
                        SubCatName = dr["SubCatName"].ToString(),
                        MainCatID = dr["CatName"].ToString(),
                    };

                    ret.Add(rObj);
                }
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }

        //Get Size
        [WebMethod]
        public void getSize()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<sizeList>();

            using (var con = new SqlConnection(strCon))
            {
                //var cmd = new SqlCommand("select A.SubCatID,A.SubCatName,B.CatName from tblSubCategory as A JOIN tblCategory as B on A.MainCatID = B.CatID", con);
                var cmd = new SqlCommand("select S.SizeID,S.SizeName,B.Name,C.CatName,SB.SubCatName,G.GenderName from tblSizes s inner join tblBrands B on S.BrandID = B.BrandID inner join tblCategory C on S.CategoryID = C.CatID inner join tblSubCategory SB on S.SubCategoryID = SB.SubCatID inner join tblGender G on S.GenderID = G.GenderID", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var rObj = new sizeList
                    {
                        SizeID = dr["SizeID"].ToString(),
                        SizeName = dr["SizeName"].ToString(),
                        BrandName = dr["Name"].ToString(),
                        CategoryName = dr["CatName"].ToString(),
                        SubCategoryName = dr["SubCatName"].ToString(),
                        GenderName = dr["GenderName"].ToString(),
                    };

                    ret.Add(rObj);
                }
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }

        //Get Size
        [WebMethod]
        public void getOrderDetail()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<orderList>();

            using (var con = new SqlConnection(strCon))
            {
                //var cmd = new SqlCommand("select A.SubCatID,A.SubCatName,B.CatName from tblSubCategory as A JOIN tblCategory as B on A.MainCatID = B.CatID", con);
                var cmd = new SqlCommand("SELECT o.orderId, o.products, o.status, u.Name FROM tblOrderproducts o INNER JOIN tblUsers u ON o.UserID = u.UId ORDER BY o.orderId DESC;", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    var rObj = new orderList
                    {
                        Id = dr["orderId"].ToString(),
                        Name = dr["Name"].ToString(),
                        Product = dr["products"].ToString(),
                        Status = dr["status"].ToString(),
                        
                    };
                    
                    ret.Add(rObj);
                }
                //Context.Response.Write(dr["Name"]);
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }

    }
}

public class brandList
{
    public string BrandID { get; set; }
    public string Name { get; set; }
}
public class categoryList
{
    public string CatID { get; set; }
    public string CatName { get; set; }
}

public class subCategoryList
{
    public string SubCatID { get; set; }
    public string SubCatName { get; set; }
    public string MainCatID { get; set; }
}

public class sizeList
{
    public string SizeID { get; set; }
    public string SizeName { get; set; }
    public string BrandName { get; set; }
    public string CategoryName { get; set; }
    public string SubCategoryName { get; set; }
    public string GenderName { get; set; }
}

public class orderList
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string Product { get; set; }
    public string Status { get; set; }
}

