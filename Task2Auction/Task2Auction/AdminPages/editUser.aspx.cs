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
    public partial class editUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = conStr;
                conn.Open();

                string update = "Update Member Set Role = @type Where userName = @userName";

                SqlCommand cmd = new SqlCommand(update, conn);

                cmd.Parameters.Add("@userName", System.Data.SqlDbType.NVarChar).Value = GridView1.SelectedRow.Cells[1].Text;
                cmd.Parameters.Add("@type", System.Data.SqlDbType.NVarChar).Value = ddlField.SelectedValue;

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


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["name"] = GridView1.SelectedRow.Cells[1].Text;

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (GridView2.SelectedIndex != -1) { 
            string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = conStr;
            conn.Open();

            string update = "Delete From Bid Where userName = @userName AND itemID = @id";

            SqlCommand cmd = new SqlCommand(update, conn);

            cmd.Parameters.Add("@userName", System.Data.SqlDbType.NVarChar).Value = Session["name"];
            cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text);

            cmd.ExecuteNonQuery();
            conn.Close();

            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
        }

        protected void btnUpdate0_Click(object sender, EventArgs e)
        {
            if (GridView2.SelectedIndex != -1 && editBox.Text != "")
            {
                string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = conStr;
                conn.Open();

                string update = "Update Bid Set " + ddlField0.SelectedValue + " = @type Where itemID = @id";


                SqlCommand cmd = new SqlCommand(update, conn);

                if (ddlField0.SelectedValue == "bidSubmission")
                    cmd.Parameters.Add("@type", System.Data.SqlDbType.DateTime).Value = DateTime.ParseExact(editBox.Text, "MM/dd/yyyy", null);
                else if (ddlField0.SelectedValue == "userBid")
                    cmd.Parameters.Add("@type", System.Data.SqlDbType.Float).Value = Convert.ToDouble(editBox.Text);

                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = Convert.ToInt32(GridView2.SelectedRow.Cells[1].Text);


                cmd.ExecuteNonQuery();
                conn.Close();

                Server.TransferRequest(Request.Url.AbsolutePath, false);

            }

        }
    }
}