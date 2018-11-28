using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.GeneralPages
{
    public partial class BrowseGeneral : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["date"] = DateTime.Now;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["catg"] = DropDownList1.SelectedValue;
        }
    }
}