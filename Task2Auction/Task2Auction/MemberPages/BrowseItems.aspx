<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrowseItems.aspx.cs" Inherits="Task2Auction.MemberPages.BrowseItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="./MemberHome.aspx">HomePage</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="./BrowseItems.aspx">Browse Items</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="./ViewCart.aspx">View Cart</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Log Out</asp:LinkButton>
    </p>
    <p>
&nbsp;&nbsp;
        <asp:Label ID="lblCat" runat="server" Text="Please Choose the Category: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CName" DataValueField="CName">
        </asp:DropDownList>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CName] FROM [Category]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Submit" />
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="itemID,Cname" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="itemID" HeaderText="itemID" ReadOnly="True" SortExpression="itemID" />
                <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                <asp:ImageField DataImageUrlField="itemPath">
                </asp:ImageField>
                <asp:BoundField DataField="Cname" HeaderText="Cname" ReadOnly="True" SortExpression="Cname" />
                <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                <asp:BoundField DataField="baseBid" HeaderText="baseBid" SortExpression="baseBid" />
                <asp:BoundField DataField="deadlineBid" HeaderText="deadlineBid" SortExpression="deadlineBid" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [itemID], [Cname], [itemDesc], [baseBid], [deadlineBid], [itemName], [itemPath] FROM [Item] WHERE ([Cname] = @Cname)
AND itemID NOT IN
( Select Bid.itemID
From Bid
Where Bid.userName = @user)
AND deadlineBid &gt; @dt">
            <SelectParameters>
                <asp:SessionParameter Name="Cname" SessionField="cat" Type="String" />
                <asp:SessionParameter Name="user" SessionField="user" />
                <asp:SessionParameter Name="dt" SessionField="date" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="lblBid" runat="server" Text="Please bid on Selected Item: "></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="bidBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:Button ID="btnBid" runat="server" Text="Bid" Width="69px" OnClick="btnBid_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblWarning" runat="server"></asp:Label>
    </p>
</asp:Content>
