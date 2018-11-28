using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task2Auction.GeneralPages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = conStr;

            conn.Open();

            string qry = "Select * From Member where userName = @user AND Password = @pass";

            SqlCommand cmd = new SqlCommand(qry, conn);

            cmd.Parameters.Add("@user", System.Data.SqlDbType.NVarChar).Value = Login1.UserName;
            cmd.Parameters.Add("@pass", System.Data.SqlDbType.NVarChar).Value = Login1.Password;

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                Session["user"] = Login1.UserName;
                e.Authenticated = true;
                string role = (string)sdr.GetValue(3);
                if (role == "Member")
                {
                    Response.Redirect("~/MemberPages/MemberHome.aspx");
                }
                else
                {
                    Response.Redirect("~/AdminPages/AdminHome.aspx");

                }
            }
            else
            {
                e.Authenticated = false;
                Login1.FailureText = "Username or Password Wrong";
            }

            conn.Close();

        }
    }
}