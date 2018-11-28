<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="changeItem.aspx.cs" Inherits="Task2Auction.AdminPages.changeItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:LinkButton ID="btnBids" PostBackUrl="./AdminHome.aspx" runat="server">Admin Home</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnLogout" OnClick="btnLogout_Click" runat="server">Log Out</asp:LinkButton>

        <br />
    </p>
    <p>
        Current Items in Database:</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID,Cname" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
                <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                <asp:BoundField DataField="Cname" HeaderText="Cname" ReadOnly="True" SortExpression="Cname" />
                <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                <asp:BoundField DataField="baseBid" HeaderText="baseBid" SortExpression="baseBid" />
                <asp:BoundField DataField="deadlineBid" HeaderText="deadlineBid" SortExpression="deadlineBid" />
                <asp:BoundField DataField="itemPath" HeaderText="itemPath" SortExpression="itemPath" />
            </Columns>
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
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [itemName], [itemID], [Cname], [itemDesc], [baseBid], [deadlineBid], [itemPath] FROM [Item]"></asp:SqlDataSource>
        Choose field to edit:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlField" runat="server">
            <asp:ListItem>itemName</asp:ListItem>
            <asp:ListItem>itemDesc</asp:ListItem>
            <asp:ListItem>baseBid</asp:ListItem>
            <asp:ListItem>deadlineBid</asp:ListItem>
            <asp:ListItem>itemPath</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        New field:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="editBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update Field" />
    </p>
    <p>
    </p>
</asp:Content>
