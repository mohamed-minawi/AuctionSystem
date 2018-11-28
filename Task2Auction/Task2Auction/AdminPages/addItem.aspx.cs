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
    public partial class addItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender1.StartDate = DateTime.Now;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["cat"] = null;
            Response.Redirect("~/GeneralPages/HomePage.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Session["fname"] = FileUpload1.FileName;
            FileUpload1.SaveAs(Server.MapPath("~/Images/") + FileUpload1.FileName);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            int n = r.Next(100, 10000);

            string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = conStr;

            conn.Open();

            string update = "INSERT INTO Item (itemID, Cname, itemDesc, baseBid, deadlineBid,itemName, itemPath) VALUES (@id, @cname,@idesc, @bb, @db,@itName,@itPath)";

            SqlCommand cmd = new SqlCommand(update, conn);

            cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = n;
            cmd.Parameters.Add("@cname", System.Data.SqlDbType.NVarChar).Value = ddlCategory.Text;
            cmd.Parameters.Add("@idesc", System.Data.SqlDbType.NVarChar).Value = DescBox.Text;
            cmd.Parameters.Add("@bb", System.Data.SqlDbType.Float).Value = Convert.ToDouble(priceBox.Text);
            cmd.Parameters.Add("@db", System.Data.SqlDbType.DateTime).Value = DateTime.ParseExact(calendarBox.Text, "MM/dd/yyyy", null);
            cmd.Parameters.Add("@itName", System.Data.SqlDbType.NVarChar).Value = nameBox.Text;
            cmd.Parameters.Add("@itPath", System.Data.SqlDbType.NVarChar).Value = "~/Images/" + Session["fname"];

            cmd.ExecuteNonQuery();
            conn.Close();

            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}