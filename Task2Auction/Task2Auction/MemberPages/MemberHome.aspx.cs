﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.MemberPages
{
    public partial class MemberHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["cat"] = null;
            Response.Redirect("~/GeneralPages/HomePage.aspx");

        }
    }
}