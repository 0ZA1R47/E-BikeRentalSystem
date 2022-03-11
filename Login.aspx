<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E-Bike Rental System</title>
    <h1
        style="font-size: 80px; text-align: center;">E-Bike Rental System
    </h1>
    <h1 style="font-size:40px; text-align:center;">
        Admin Panel 
    </h1>
    <style>
        body
        {
            background-color:cornflowerblue;
            enable-background:accumulate;
        }
        .auto-style14 {
            height: 33px;
            width: 169px;
        }
        .auto-style15 {
            height: 33px;
            width: 287px;
        }
        .auto-style18 {
            height: 8px;
            width: 169px;
        }
        .auto-style19 {
            height: 8px;
            width: 287px;
        }
        .auto-style20 {
            height: 16px;
            width: 169px;
        }
        .auto-style21 {
            height: 16px;
            width: 287px;
        }
        .auto-style22 {
            height: 10px;
            width: 169px;
        }
        .auto-style23 {
            height: 10px;
            width: 287px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table style="margin:auto;border:5px solid white",class="auto-style9">
            <tr>
                <td class="auto-style14">
                    <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True" Font-Size="Large" BorderColor="Black" BorderStyle="Solid" Height="25px" Width="151px"></asp:Label>
               </td>
                <td class="auto-style15">
                        <asp:TextBox ID="txtUsername" runat="server" BorderColor="Black" BorderStyle="Solid" Height="29px" Width="243px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:Label ID="Label2" runat="server" Text="Password" Font-bold="true" Font-Size="Large" BorderStyle="Solid" Height="25px" Width="151px"></asp:Label>
               </td>
                <td class="auto-style23">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" BorderColor="Black" BorderStyle="Solid" Height="29px" Width="244px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    
               </td>
                <td colspan="20" class="auto-style21">
                    <asp:Button ID="btnlogin" runat="server" Text="Login" Font-Bold="true" Font-Size="Large"  OnClick="btnlogin_Click" BorderStyle="Ridge" Height="36px" Width="114px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style18">   

                </td>
                <td class="auto-style19">
                    <asp:Label ID="lblErrormessage" runat="server" Text="Incorrect user Credentials" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
