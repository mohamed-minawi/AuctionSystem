using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.MemberPages
{
    public partial class BrowseItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["cat"] = DropDownList1.SelectedValue;
            if (GridView1.Rows.Count > 0)
            {
                lblBid.Visible = true;
                lblWarning.Visible = true;
                bidBox.Visible = true;
                btnBid.Visible = true;
            }
            else
            {
                lblBid.Visible = false;
                lblWarning.Visible = false;
                bidBox.Visible = false;
                btnBid.Visible = false;
            }

        }

        protected void btnBid_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                TimeSpan diffResult = DateTime.Now.Subtract((Convert.ToDateTime(GridView1.SelectedRow.Cells[7].Text)));
                double h = diffResult.TotalSeconds;

                double minbid = Convert.ToDouble(GridView1.SelectedRow.Cells[6].Text);
                if (bidBox.Text == "")
                {
                    lblWarning.Text = "Please enter bid";
                }
                else if (h > 0)
                {
                    lblWarning.Text = "The bidding has expired for this item";
                }

                else if (Convert.ToDouble(bidBox.Text) < minbid)
                {
                    lblWarning.Text = "Please enter a higher bid as it is lower than base bid";
                }
                else
                {
                    string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

                    SqlConnection conn = new SqlConnection();
                    conn.ConnectionString = conStr;

                    conn.Open();

                    string qry = "Select * From Bid where itemID = @id AND userBid >= @bid";

                    SqlCommand cmd = new SqlCommand(qry, conn);

                    cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = Convert.ToInt64(GridView1.SelectedRow.Cells[1].Text);
                    cmd.Parameters.Add("@bid", System.Data.SqlDbType.Float).Value = Convert.ToDouble(bidBox.Text);

                    SqlDataReader sdr = cmd.ExecuteReader();

                    if (sdr.Read())
                    {
                        lblWarning.Text = "Please enter a higher bid as there are bids higher than you";
                    }
                    else
                    {
                        conn.Close();

                        conn.Open();

                        cmd.Dispose();

                        string update = "INSERT INTO Bid (userName, Cname, itemID, userBid, bidSubmission) VALUES (@user, @Cname,@itemID, @userBid, @bs)";

                        cmd = new SqlCommand(update, conn);

                        cmd.Parameters.Add("@itemID", System.Data.SqlDbType.Int).Value = GridView1.DataKeys[GridView1.SelectedIndex].Values["itemID"];
                        cmd.Parameters.Add("@Cname", System.Data.SqlDbType.NVarChar).Value = GridView1.DataKeys[GridView1.SelectedIndex].Values["Cname"];
                        cmd.Parameters.Add("@userBid", System.Data.SqlDbType.Float).Value = Convert.ToDouble(bidBox.Text);
                        cmd.Parameters.Add("@bs", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                        cmd.Parameters.Add("@user", System.Data.SqlDbType.NVarChar).Value = Session["user"];

                        cmd.ExecuteNonQuery();
                        conn.Close();

                        GridView1.SelectedIndex = -1;
                        lblWarning.Visible = false;
                        btnBid.Visible = false;
                        bidBox.Visible = false;
                        bidBox.Text = "";

                        Response.AppendHeader("Refresh", "5;url=./MemberHome.aspx");
                        lblWarning.Text = "Bid Placed, you will be redirected to Home Page";
                        Session["cat"] = null;

                    }

                }
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session["cat"] = null;
            Response.Redirect("~/GeneralPages/HomePage.aspx");
        }
    }
}