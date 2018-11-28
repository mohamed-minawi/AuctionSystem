<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addItem.aspx.cs" Inherits="Task2Auction.AdminPages.addItem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 320px;
        }
        .auto-style4 {
            height: 26px;
            width: 320px;
        }
        .auto-style2 {
            height: 26px;
        }
        .auto-style5 {
            width: 322px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <asp:LinkButton ID="btnBids" PostBackUrl="./AdminHome.aspx" runat="server">Admin Home</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="btnLogout" OnClick="btnLogout_Click" runat="server">Log Out</asp:LinkButton>

    <br />
    <br />
    <asp:Label ID="lblSubmit" runat="server" Text="Submit Item for Bidding: "></asp:Label>
    <br />
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Item Name:</td>
            <td>
                <asp:TextBox ID="nameBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Item Base Price</td>
            <td>
                <asp:TextBox ID="priceBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Item Category Type:</td>
            <td class="auto-style2">
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CName" DataValueField="CName">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Item Picture:</td>
            <td class="auto-style2">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Item Deadline: </td>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="calendarBox" runat="server" />

            <td>&nbsp;<asp:TextBox ID="calendarBox" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td class="auto-style5">Item Description</td>
            <td>
                <asp:TextBox ID="DescBox" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit Item" />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\AuctionDB.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [CName] FROM [Category]"></asp:SqlDataSource>
</asp:Content>
