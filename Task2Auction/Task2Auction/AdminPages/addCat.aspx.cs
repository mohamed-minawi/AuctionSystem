using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.AdminPages
{
    public partial class addCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(catBox.Text != "") { 
            string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = conStr;

            conn.Open();

            string update = "INSERT INTO Category (CName) VALUES (@cname)";

            SqlCommand cmd = new SqlCommand(update, conn);

            cmd.Parameters.Add("@cname", System.Data.SqlDbType.NVarChar).Value = catBox.Text;

            cmd.ExecuteNonQuery();
            conn.Close();

            Server.TransferRequest(Request.Url.AbsolutePath, false);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["cat"] = null;
            Response.Redirect("~/GeneralPages/HomePage.aspx");

        }
    }
}