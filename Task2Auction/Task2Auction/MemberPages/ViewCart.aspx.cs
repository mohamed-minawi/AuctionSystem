using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.MemberPages
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCheck_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedIndex != -1)
            {
                int ID = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                double userbid = Convert.ToDouble(GridView1.SelectedRow.Cells[7].Text);

                TimeSpan diffResult = DateTime.Now.Subtract((Convert.ToDateTime(GridView1.SelectedRow.Cells[8].Text)));
                double h = diffResult.TotalSeconds;
                string email = "";
                bool flag = false;

                string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = conStr;

                conn.Open();

                string qry = "Select * From Bid where itemID = @id AND userBid > @bid";

                SqlCommand cmd = new SqlCommand(qry, conn);

                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = ID;
                cmd.Parameters.Add("@bid", System.Data.SqlDbType.Float).Value = userbid;

                SqlDataReader sdr = cmd.ExecuteReader();

                
                if (sdr.Read())
                {
                    flag = false;
                }
                else
                {
                    flag = true;
                }
                conn.Close();
                cmd.Dispose();

                conn.Open();

                qry = "Select Email From Member where userName = @user";
                cmd = new SqlCommand(qry, conn);

                cmd.Parameters.Add("@user", System.Data.SqlDbType.NVarChar).Value = Session["user"];

                sdr = cmd.ExecuteReader();

                if(sdr.Read())
                {
                    email = Convert.ToString(sdr.GetValue(0));
                }

                if (h>0)
                {
                    if (flag) { 
                        lblStatus.Text = "The Item Expired. You Won the Bid for this item";
                        string msg = "You won the bid for the item with reference number " + Convert.ToString(ID);
                        sendEmail(email, msg, "Bid Won");
                    }
                    else
                        lblStatus.Text = "The Item Expired. You Lost the Bid for this Item";

                    lblWarning.Visible = false;
                    btnBid.Visible = false;
                    bidBox.Visible = false;
                    lblBid.Visible = false;

                }
                else
                {
                    if (flag)
                        lblStatus.Text = "You are the highest bid in them item";
                    else
                    {
                        lblStatus.Text = "There Exists another user with a higher bid than yours";

                        lblWarning.Visible = true;
                        btnBid.Visible = true;
                        bidBox.Visible = true;
                        lblBid.Visible = true;
                    }
                }
            }
        }

        protected void btnBid_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                TimeSpan diffResult = DateTime.Now.Subtract((Convert.ToDateTime(GridView1.SelectedRow.Cells[8].Text)));
                double h = diffResult.TotalSeconds;

                double minbid = Convert.ToDouble(GridView1.SelectedRow.Cells[7].Text);

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
                    lblWarning.Text = "Please enter a higher bid as it is lower than your previous bid";
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

                        string update = "Update Bid Set userBid = @bid, bidSubmission = @bs Where userName = @user AND itemID = @id";

                        cmd = new SqlCommand(update, conn);

                        cmd.Parameters.Add("@Bid", System.Data.SqlDbType.Float).Value = Convert.ToDouble(bidBox.Text);
                        cmd.Parameters.Add("@bs", System.Data.SqlDbType.DateTime).Value = DateTime.Now;
                        cmd.Parameters.Add("@user", System.Data.SqlDbType.NVarChar).Value = Session["user"];
                        cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = Convert.ToInt64(GridView1.SelectedRow.Cells[1].Text);

                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Response.AppendHeader("Refresh", "5;url=./MemberHome.aspx");
                        lblWarning.Text = "Bid Changed, you will be redirected to Home Page";

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

        protected void sendEmail(string strEmail, string strMsg, string Subject)
        {

            MailMessage msg = new MailMessage("CSCE4502@gmail.com", strEmail);
            msg.Subject = Subject;
            msg.Body = strMsg;

            SmtpClient Sclient = new SmtpClient("smtp.gmail.com", 587);
            NetworkCredential auth = new NetworkCredential("CSCE4502@gmail.com", "csce4502f16");

            Sclient.UseDefaultCredentials = false;
            Sclient.Credentials = auth;
            Sclient.EnableSsl = true;
            Sclient.Send(msg);

        }

    }
}