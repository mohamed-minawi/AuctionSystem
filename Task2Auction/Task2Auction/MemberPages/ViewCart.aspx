<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="Task2Auction.MemberPages.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="./MemberHome.aspx">HomePage</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="./BrowseItems.aspx">Browse Items</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="./ViewCart.aspx">View Cart</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Log Out</asp:LinkButton>
    </p>
    <p>
        <asp:Label ID="lblCart" runat="server" Text="Your Cart:"></asp:Label>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="itemID" HeaderText="itemID" SortExpression="itemID" />
            <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
            <asp:ImageField DataImageUrlField="ItemPath">
            </asp:ImageField>
            <asp:BoundField DataField="Cname" HeaderText="Cname" SortExpression="Cname" />
            <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
            <asp:BoundField DataField="baseBid" HeaderText="baseBid" SortExpression="baseBid" />
            <asp:BoundField DataField="userBid" HeaderText="userBid" SortExpression="userBid" />
            <asp:BoundField DataField="deadlineBid" HeaderText="deadlineBid" SortExpression="deadlineBid" />
            <asp:BoundField DataField="bidSubmission" HeaderText="bidSubmission" SortExpression="bidSubmission" />
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
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="Select B.itemID, I.itemName, B.Cname, I.itemDesc, I.baseBid, B.userBid, I.deadlineBid, bidSubmission, I.ItemPath
From Bid B, Item I
Where B.itemID = I.itemID
AND B.userName = @user">
            <SelectParameters>
                <asp:SessionParameter Name="user" SessionField="user" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_Click" Text="Check Bid Status" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblBid" runat="server" Text="Change Bid on Selected Items: " Visible="False" ViewStateMode="Disabled"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="bidBox" runat="server" Visible="False" ViewStateMode="Disabled"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnBid" runat="server" Text="Bid" Width="69px" OnClick="btnBid_Click" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblWarning" runat="server" Visible="False"></asp:Label>
    </p>
</asp:Content>
