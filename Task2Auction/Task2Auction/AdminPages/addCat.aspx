<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addCat.aspx.cs" Inherits="Task2Auction.AdminPages.addCat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:LinkButton ID="btnBids" PostBackUrl="./AdminHome.aspx" runat="server">Admin Home</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnLogout" OnClick="btnLogout_Click" runat="server">Log Out</asp:LinkButton>

    </p>
<p>
    Please add a category:
    <br />
</p>
<p>
    The current cateogries are (Don&#39;t add same name):</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CName" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="CName" HeaderText="CName" ReadOnly="True" SortExpression="CName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
</p>
<p>
    <asp:TextBox ID="catBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
</p>
</asp:Content>
