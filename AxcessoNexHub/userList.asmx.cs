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
    /// Summary description for userList
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class userList : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetPatient()
        {
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            //string strCon = @"Data Source=.\SQLEXPRESS;Initial Catalog=MyEShoppingDB2;Integrated Security=True;";
            var ret = new List<userlist>();

            using (var con = new SqlConnection(strCon))
            {
                var cmd = new SqlCommand("select Uid,Username,Email,Usertype from tblUsers", con);
                con.Open();
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    var rObj = new userlist
                    {
                        Id = dr[0].ToString(),
                        Username = dr[1].ToString(),
                        //DOB = Convert.ToDateTime(dr[2]),
                        Email = dr[2].ToString(),
                        //City = dr[4].ToString(),
                        Usertype = dr[3].ToString(),
                        //DrName = dr[6].ToString()
                    };

                    ret.Add(rObj);
                }
            }

            // Serialize and return the data as JSON
            Context.Response.Write(new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(ret));
        }
    }
}
public class userlist
{
    public string Id { get; set; }
    public string Username { get; set; }
    public string Email { get; set; }
    public string Usertype { get; set; }
}