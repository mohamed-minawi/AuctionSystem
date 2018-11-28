<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SqlQuery.aspx.cs" Inherits="Task2Auction.AdminPages.SqlQuery" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    protected void btnExecute_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["connectionString"].ToString();

            conn.Open();


            string query = (string)txtQuery.Text;
            string[] query_arr = query.Split();

            if (query_arr[0] == "Select" || query_arr[0] == "select")
            {
                SqlCommand cmdSelect = new SqlCommand(txtQuery.Text, conn);
                gdvResult.Visible = true;

                DataTable tbl = new DataTable();
                try
                {
                    tbl.Load(cmdSelect.ExecuteReader());

                    gdvResult.DataSource = tbl;
                    gdvResult.DataBind();
                }
                catch
                {
                    lblSuccess.Visible = true;
                    lblSuccess.Text = "Error in Select SQL Statement";
                }

            }
            else if (query_arr[0] == "update" || query_arr[0] == "Update" || query_arr[0] == "Insert" || query_arr[0] == "insert" || query_arr[0] == "delete" || query_arr[0] == "Delete")
            {
                SqlCommand cmd = new SqlCommand(txtQuery.Text, conn);
                lblSuccess.Visible = true;
                gdvResult.Visible = false;
                try
                {
                    cmd.ExecuteNonQuery();
                    lblSuccess.Text = "Sucessful SQL Statment";
                }
                catch
                {
                    lblSuccess.Text = "Error in " + query_arr[0] + " SQL Statment";
                }

            }

            conn.Close();
        }
        catch
        {
            lblSuccess.Visible = true;
            lblSuccess.Text = "Database Connection Error";

        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <br />
    <asp:LinkButton ID="btnBids" PostBackUrl="./AdminHome.aspx" runat="server">Admin Home</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnLogout" OnClick="btnLogout_Click" runat="server">Log Out</asp:LinkButton>
        <br />
        <table class="style7">
        <tr>
            <td class="style13" valign="middle">
                <br />
                <asp:Label ID="Label1" runat="server" Font-Names="Arial Black" 
                    Font-Size="Medium" ForeColor="#000066" Text="Enter Your SQL Query:"></asp:Label>
                <br />
            </td>
            <td>
                <asp:TextBox ID="txtQuery" runat="server" Font-Names="Arial" Font-Size="Medium" 
                    ForeColor="#000066" Height="91px" TextMode="MultiLine" Width="254px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnExecute" runat="server" Font-Names="Arial Black" 
        Font-Size="Medium" ForeColor="#000066" onclick="btnExecute_Click" 
        Text="Execute" />
    <br />
    <br />
    <br />
    <asp:GridView ID="gdvResult" runat="server" CellPadding="4" Font-Names="Arial" Font-Size="Medium" 
        ForeColor="#000066" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="lblSuccess" runat="server" ForeColor="Black" Visible="False" Font-Bold="True" Font-Size="Larger"></asp:Label>
    <br />
    <br />
    <br />
    <br />
&nbsp;

</asp:Content>
