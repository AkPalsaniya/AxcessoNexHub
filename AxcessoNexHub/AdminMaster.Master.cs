﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AxcessoNexHub
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void lknBtnLogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Response.Redirect("SignIn.aspx");
        }
    }
}