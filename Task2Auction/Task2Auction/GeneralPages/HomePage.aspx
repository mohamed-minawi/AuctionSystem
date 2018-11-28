<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Task2Auction.GeneralPages.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 361px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome to Our Auction Website:<br />
            <br />
            We offer a lot of products to the highest bidder.<br />
            Create an account to start bidding.<br />
            <br />
            If you just want to watch our bidding list, press browse auction website button<br />
            <br />
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">If you are a user:&nbsp;&nbsp;&nbsp; </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" PostBackUrl="./LoginPage.aspx" Text="Log In" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">If you want to browse the items:</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" PostBackUrl="./BrowseGeneral.aspx" Text="Browse Auction Website" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">If you are new, create an account:</td>
                    <td>
                        <asp:Button ID="Button3" runat="server" PostBackUrl="./CreatePage.aspx" Text="Create Account" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
