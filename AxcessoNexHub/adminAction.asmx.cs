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
    }
}

public class brandList
{
    public string BrandID { get; set; }
    public string Name { get; set; }
}

