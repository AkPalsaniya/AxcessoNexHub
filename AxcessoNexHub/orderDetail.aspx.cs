using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace AxcessoNexHub
{
    public partial class orderDetail : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            bindMyOrderRptr();
        }

        private void bindMyOrderRptr()
        {
            //string UserIDD = Session["USERID"].ToString();
            string UserIDD = "2";
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("getOrderDetail", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    RptrMyOrder.DataSource = dt;
                    RptrMyOrder.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        //string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                        //string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                        //string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        ////h4NoItems.InnerText = "My Cart ( " + CartQuantity + " Item(s) )";
                        //int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        //int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                    //    spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                    //    spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(CartTotal)) + ".00";
                    //    spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString() + ".00";
                    }
                    else
                    {
                        //h4NoItems.InnerText = "Your Shopping Cart is Empty.";
                        //divAmountSect.Visible = false;

                    }
                }

            }
        }
    }
}