using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class orderManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                SqlCommand cmd = new SqlCommand("SELECT o.orderId, o.products, o.status, u.Name FROM tblOrderproducts o INNER JOIN tblUsers u ON o.UserID = u.UId where OrderID = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    data = new
                    {
                        OrderID = Convert.ToInt32(reader["orderID"]),
                        Name = reader["Name"].ToString(),
                        Product = reader["products"].ToString(),
                        Status = reader["status"].ToString(),
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

        //Update Order From Popup
        [WebMethod]
        public static string updateOrderStatus(string Id, string Name, string Product, string Status)
        {
            int id = Convert.ToInt32(Id);
            
            string strCon = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            string msg = "";

            con.Open();
            String Query = "UPDATE tblOrderProducts set Status = '"+Status+ "' where OrderID = @Id";
            //con.Close();
            //con.Open();
            //String Query2 = "UPDATE tblOrders SET OrderStatus = '"+Status+ "' where orderID = @Id2";
            //con.Close();


            SqlCommand cmd = new SqlCommand(Query, con);
            //SqlCommand cmd2 = new SqlCommand(Query2, con);
            cmd.Parameters.AddWithValue("@Id", id);
            //cmd2.Parameters.AddWithValue("@Id2", id);
            int i = cmd.ExecuteNonQuery();
           // int i2 = cmd2.ExecuteNonQuery();
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