<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BrowseGeneral.aspx.cs" Inherits="Task2Auction.GeneralPages.BrowseGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="./HomePage.aspx">Home Page</asp:LinkButton>
    </p>
    <p>
        &nbsp;
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Cname,itemID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="itemName" HeaderText="itemName" SortExpression="itemName" />
                <asp:ImageField DataImageUrlField="itemPath">
                </asp:ImageField>
                <asp:BoundField DataField="itemDesc" HeaderText="itemDesc" SortExpression="itemDesc" />
                <asp:BoundField DataField="Cname" HeaderText="Cname" ReadOnly="True" SortExpression="Cname" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Cname], [itemName], [itemID], [baseBid], [deadlineBid], [itemDesc], [itemPath] FROM [Item] WHERE (([Cname] = @Cname) AND ([deadlineBid] &gt; @deadlineBid))">
            <SelectParameters>
                <asp:SessionParameter Name="Cname" SessionField="catg" Type="String" />
                <asp:SessionParameter Name="deadlineBid" SessionField="date" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
