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
    public partial class changeItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedIndex != -1 && editBox.Text != "")
            {
                string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = conStr;
                conn.Open();

                string update = "Update Item Set " + ddlField.SelectedValue + " = @type Where itemID = @id";
                

                SqlCommand cmd = new SqlCommand(update, conn);

                if (ddlField.SelectedValue == "deadlineBid")
                    cmd.Parameters.Add("@type", System.Data.SqlDbType.DateTime).Value = DateTime.ParseExact(editBox.Text, "MM/dd/yyyy", null);
                else if(ddlField.SelectedValue == "baseBid")
                    cmd.Parameters.Add("@type", System.Data.SqlDbType.Float).Value = Convert.ToDouble(editBox.Text);
                else
                    cmd.Parameters.Add("@type", System.Data.SqlDbType.NVarChar).Value = editBox.Text;


                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);


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