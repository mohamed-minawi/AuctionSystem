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
    public partial class CreatePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = conStr;

            conn.Open();

            string update = "INSERT INTO Member (userName, Password, Role) VALUES (@user , @pass , @role)";

            SqlCommand cmd = new SqlCommand(update, conn);

            cmd.Parameters.Add("@user", System.Data.SqlDbType.NVarChar).Value = CreateUserWizard1.UserName;
            cmd.Parameters.Add("@pass", System.Data.SqlDbType.NVarChar).Value = CreateUserWizard1.Password;
            cmd.Parameters.Add("@role", System.Data.SqlDbType.NVarChar).Value = "Member";

            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("~/GeneralPages/LoginPage.aspx");

        }

    }
}