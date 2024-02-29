using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class paymentPage : System.Web.UI.Page
    {//Payment Id
        public string orderIdPayment;
        public string orderId;

        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        public static Int32 OrderNumber = 1;
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (Session["USERNAME"] != null)
            {
                if (!IsPostBack)
                {
                    BindPriceData2();
                    genAutoNum();
                    //BindCartNumber();
                    BindOrderProducts();

                }
               
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        public void BindPriceData()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    DataTable dtBrands = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string SizeID = CookieDataArray[i].ToString().Split('-')[1];

                        if (hdPidSizeID.Value != null && hdPidSizeID.Value != "")
                        {
                            hdPidSizeID.Value += "," + PID + "-" + SizeID;
                        }
                        else
                        {
                            hdPidSizeID.Value = PID + "-" + SizeID;
                        }


                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getSizeName(" + SizeID + ") as SizeNamee,"
                                + SizeID + " as SizeIDD,SizeData.Name,SizeData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) SizeData where A.PID="
                                + PID + "", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dtBrands);
                                }

                            }
                        }
                        CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
                        Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                    }
                    //divPriceDetails.Visible = true;

                    spanCartTotal.InnerText = CartTotal.ToString();
                    spanTotal.InnerText = "Rs. " + Total.ToString();
                    spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

                    hdCartAmount.Value = CartTotal.ToString();
                    hdCartDiscount.Value = (CartTotal - Total).ToString();
                    hdTotalPayed.Value = Total.ToString();
                }
                else
                {
                    //TODO Show Empty Cart
                    Response.Redirect("~/Product.aspx");
                }
            }
            else
            {
                //TODO Show Empty Cart
                Response.Redirect("~/Product.aspx");
            }
        }

        private void BindPriceData2()
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindPriceData", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                        string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));
                        spanTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(Total)) + ".00";
                        Session["myCartAmount"] = string.Format("{0:####}", double.Parse(Total));
                        spanCartTotal.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(CartTotal)) + ".00";
                        spanDiscount.InnerText = "- Rs. " + (CartTotal1 - Total1).ToString();
                        Session["TotalAmount"] = spanTotal.InnerText;
                        hdCartAmount.Value = CartTotal.ToString();
                        hdCartDiscount.Value = (CartTotal1 - Total1).ToString() + ".00";
                        hdTotalPayed.Value = Total.ToString();
                    }
                    else
                    {
                        Response.Redirect("Product.aspx");
                    }
                }
            }
        }

        protected void btnPaytm_Click(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null)
            {
                string USERID = Session["USERID"].ToString();
                string PaymentType = "Paytm";
                string PaymentStatus = "NotPaid";
                string EMAILID = Session["USEREMAIL"].ToString();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPurchase values('" + USERID + "','"
                        + hdPidSizeID.Value + "','" + hdCartAmount.Value + "','" + hdCartDiscount.Value + "','"
                        + hdTotalPayed.Value + "','" + PaymentType + "','" + PaymentStatus + "',getdate(),'"
                        + txtName.Text + "','" + txtAddress.Text + "','" + txtPinCode.Text + "','" + txtMobileNumber.Text + "') select SCOPE_IDENTITY()", con);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    Int64 PurchaseID = Convert.ToInt64(cmd.ExecuteScalar());
                }
            }
            else
            {
                //Response.Redirect("SignIn.aspx");
            }
        }


        //public void BindCartNumber()
        //{
        //    if (Session["USERID"] != null)
        //    {
        //        string UserIDD = Session["USERID"].ToString();
        //        DataTable dt = new DataTable();
        //        using (SqlConnection con = new SqlConnection(CS))
        //        {
        //            SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
        //            {
        //                CommandType = CommandType.StoredProcedure
        //            };
        //            cmd.Parameters.AddWithValue("@UserID", UserIDD);
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                sda.Fill(dt);
        //                if (dt.Rows.Count > 0)
        //                {
        //                    string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
        //                    CartBadge.InnerText = CartQuantity;
        //                }
        //                else
        //                {
        //                    //_ = CartBadge.InnerText == 0.ToString();
        //                }
        //            }
        //        }
        //    }
        //}

        private void genAutoNum()
        {
            Random r = new Random();
            int num = r.Next(Convert.ToInt32("231965"),
           Convert.ToInt32("987654"));
            string ChkOrderNum = num.ToString();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_FindOrderNumber", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@FindOrderNumber", ChkOrderNum);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        genAutoNum();
                    }
                    else
                    {
                        OrderNumber = Convert.ToInt32(num.ToString());
                    }
                }
            }
        }

        private void BindOrderProducts()
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con0 = new SqlConnection(CS))
            {
                SqlCommand cmd0 = new SqlCommand("SP_BindCartProducts", con0)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd0.Parameters.AddWithValue("@UID", UserIDD);
                using (SqlDataAdapter sda0 = new SqlDataAdapter(cmd0))
                {
                    sda0.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataColumn PID in dt.Columns)
                        {
                            using (SqlConnection con = new SqlConnection(CS))
                            {
                                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart C WHERE C.PID=" + PID + " AND UID ='" + UserIDD + "'", con))
                                {
                                    cmd.CommandType = CommandType.Text;
                                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                    {
                                        DataTable dtProducts = new DataTable();
                                        sda.Fill(dtProducts);
                                        gvProducts.DataSource = dtProducts;
                                        gvProducts.DataBind();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnCart2_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void BtnPlaceNPay_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Session["Address"] = txtAddress.Text;
                Session["Mobile"] = txtMobileNumber.Text;
                Session["OrderNumber"] = OrderNumber.ToString();
                Session["PayMethod"] = "Place n Pay";

                string USERID = Session["USERID"].ToString();
                string PaymentType = "Cash";
                string PaymentStatus = "NotPaid";
                string EMAILID = Session["USEREMAIL"].ToString();
                string OrderStatus = "Pending";
                string FullName = Session["getFullName"].ToString();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_InsertOrder", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", USERID);
                    cmd.Parameters.AddWithValue("@Email", EMAILID);
                    cmd.Parameters.AddWithValue("@CartAmount", hdCartAmount.Value);
                    cmd.Parameters.AddWithValue("@CartDiscount", hdCartDiscount.Value);
                    cmd.Parameters.AddWithValue("@TotalPaid", hdTotalPayed.Value);
                    cmd.Parameters.AddWithValue("@PaymentType", PaymentType);
                    cmd.Parameters.AddWithValue("@PaymentStatus", PaymentStatus);
                    cmd.Parameters.AddWithValue("@DateOfPurchase", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Name", FullName);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@MobileNumber", txtMobileNumber.Text);
                    cmd.Parameters.AddWithValue("@OrderStatus", OrderStatus);
                    cmd.Parameters.AddWithValue("@OrderNumber", OrderNumber.ToString());
                    if (con.State == ConnectionState.Closed) { con.Open(); }
                    Int64 OrderID = Convert.ToInt64(cmd.ExecuteScalar());
                    InsertOrderProducts();

                    //InstaMOjoPayment();
                } 
            }
            else
            {
                Response.Redirect("SignIn.aspx?RtPP=yes");
            }
        }

        //private void InstaMOjoPayment()
        //{
        //    string uid = System.DateTime.Now.Ticks.ToString();
        //    Instamojo objClass = InstamojoImplementation.getApi( “[client_id]”, “[client_secret]”, “[endpoint]”, “[auth_endpoint]”);


        //    PaymentOrder objPaymentRequest = new PaymentOrder();
        //    //Required POST parameters
        //    objPaymentRequest.name = "ABCD";
        //    objPaymentRequest.email = "foo@example.com";
        //    objPaymentRequest.phone = "0123456789";
        //    objPaymentRequest.amount = 9;
        //    objPaymentRequest.transaction_id = uid; // Unique Id to be provided

        //    objPaymentRequest.redirect_url = “userHome.aspx”;

        //    //webhook is optional.
        //    objPaymentRequest.webhook_url = "https://your.server.com/webhook";

        //    if (objPaymentRequest.validate())
        //    {
        //        if (objPaymentRequest.emailInvalid)
        //        {
        //            //MessageBox.Show("Email is not valid");
        //            Response.Write("Email is not valid");
        //        }
        //        if (objPaymentRequest.nameInvalid)
        //        {
        //            //MessageBox.Show("Name is not valid");
        //            Response.Write("Name is not valid");
        //        }
        //        if (objPaymentRequest.phoneInvalid)
        //        {
        //            //MessageBox.Show("Phone is not valid");
        //            Response.Write("Phone is not valid");
        //        }
        //        if (objPaymentRequest.amountInvalid)
        //        {
        //            //MessageBox.Show("Amount is not valid");
        //            Response.Write("Amount is not valid");
        //        }
        //        if (objPaymentRequest.currencyInvalid)
        //        {
        //            //MessageBox.Show("Currency is not valid");
        //            Response.Write("Currency is not valid");

        //        }
        //        if (objPaymentRequest.transactionIdInvalid)
        //        {
        //            //MessageBox.Show("Transaction Id is not valid");
        //            Response.Write("Transaction Id is not valid");
        //        }
        //        if (objPaymentRequest.redirectUrlInvalid)
        //        {
        //            //MessageBox.Show("Redirect Url Id is not valid");
        //            Response.Write("Redirect Url Id is not valid");
        //        }
        //        if (objPaymentRequest.webhookUrlInvalid)
        //        {
        //            //MessageBox.Show("Webhook URL is not valid");
        //            Response.Write("Webhook URL is not valid");
        //        }

        //    }
        //    else
        //    {
        //        try
        //        {
        //            CreatePaymentOrderResponse objPaymentResponse = objClass.createNewPaymentRequest(objPaymentRequest);
        //            //MessageBox.Show("Payment URL = " + objPaymentResponse.payment_options.payment_url);
        //            Response.Write("Payment URL = " + objPaymentResponse.payment_options.payment_url);

        //        }
        //        catch (ArgumentNullException ex)
        //        {
        //            //MessageBox.Show(ex.Message);
        //            Response.Write(ex.Message);
        //        }
        //        catch (WebException ex)
        //        {
        //            //MessageBox.Show(ex.Message);
        //            Response.Write(ex.Message);
        //        }
        //        catch (IOException ex)
        //        {
        //            //MessageBox.Show(ex.Message);
        //            Response.Write(ex.Message);
        //        }
        //        catch (InvalidPaymentOrderException ex)
        //        {
        //            if (!ex.IsWebhookValid())
        //            {
        //                //MessageBox.Show("Webhook is invalid");
        //                Response.Write("Webhook is invalid");
        //            }

        //            if (!ex.IsCurrencyValid())
        //            {
        //                //MessageBox.Show("Currency is Invalid");
        //                Response.Write("Currency is Invalid");
        //            }

        //            if (!ex.IsTransactionIDValid())
        //            {
        //                //MessageBox.Show("Transaction ID is Inavlid");
        //                Response.Write("Transaction ID is Inavlid");
        //            }
        //        }
        //        catch (ConnectionException ex)
        //        {
        //            //MessageBox.Show(ex.Message);
        //            Response.Write(ex.Message);
        //        }
        //        catch (BaseException ex)
        //        {
        //            //MessageBox.Show(ex.Message);
        //            Response.Write(ex.Message);
        //        }
        //        catch (Exception ex)
        //        {
        //            //MessageBox.Show("Error:" + ex.Message);
        //            Response.Write("Error:" + ex.Message);
        //        }
        //    }
        //}

        private void InsertOrderProducts()
        {
            string USERID = Session["USERID"].ToString();
            using (SqlConnection con = new SqlConnection(CS))
            {
                foreach (GridViewRow gvr in gvProducts.Rows)
                {
                    SqlCommand myCmd = new SqlCommand("SP_InsertOrderProducts", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    myCmd.Parameters.AddWithValue("@OrderID", OrderNumber.ToString());
                    myCmd.Parameters.AddWithValue("@UserID", USERID);
                    myCmd.Parameters.AddWithValue("@PID", gvr.Cells[0].Text);
                    myCmd.Parameters.AddWithValue("@Products", gvr.Cells[1].Text);
                    myCmd.Parameters.AddWithValue("@Quantity", gvr.Cells[2].Text);
                    myCmd.Parameters.AddWithValue("@OrderDate", DateTime.Now.ToString("yyyy-MM-dd"));
                    myCmd.Parameters.AddWithValue("@Status", "Pending");
                    if (con.State == ConnectionState.Closed) { con.Open(); }
                    Int64 OrderProID = Convert.ToInt64(myCmd.ExecuteScalar());
                    con.Close();
                    EmptyCart();
                    //Response.Redirect("Success.aspx");
                    Response.Write("<script>alert('Order placed sucesfully')</script>");
                }
                    Response.Redirect("product.aspx");
            }
        }

        private void EmptyCart()
        {
            Int32 CartUIDD = Convert.ToInt32(Session["USERID"].ToString());
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmdU = new SqlCommand("SP_EmptyCart", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmdU.Parameters.AddWithValue("@UserID", CartUIDD);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                cmdU.ExecuteNonQuery();
                con.Close();
            }
        }
         
    }
}