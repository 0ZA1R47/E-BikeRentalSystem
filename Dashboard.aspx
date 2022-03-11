<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
      <h1
        style="font-size: 80px; text-align: center;">Admin Dashboard
    </h1>

    <style type="text/css">

        body {
            background-color: aquamarine;
            enable-background: accumulate;
        }
     
        .auto-style1 {
            width: 659px;
            height: 453px;
        }
        .center {
  margin-left: auto;
  margin-right: auto;
        }
     
        .auto-style2 {
            height: 29px;
            width: 158px;
        }
     
        .auto-style3 {
            width: 165px;
        }
     
        .auto-style4 {
            height: 29px;
        }
     
        .auto-style5 {
            margin-right: 94px;
        }
     
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:HiddenField ID="hfBike_id" runat="server" />
            <br/>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" Font-Bold="true" Font-Size="Large" OnClick="btnLogout_Click" Height="42px" Width="104px" BackColor="#33CC33" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
            
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <table style="margin:auto;border:5px solid white",class="auto-style9";height="10px"class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label1" runat="server" Text="Bike.No" Font-bold="true" Font-Size="Large" BorderColor="Black" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style4">
                        <asp:TextBox ID="txtBikeNo" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label2" runat="server" Text="Model" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtModel" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label3" runat="server" Text="Colour" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtColour" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label4" runat="server" Text="Station.No" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtStationNo" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label5" runat="server" Text="Shelf Life" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style4">
                        <asp:TextBox ID="txtShelfLife" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label6" runat="server" Text="Maintenance" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtMaintenance" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label7" runat="server" Text="Battery Status" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtBatteryStatus" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Label ID="Label8" runat="server" Text="Mileage" Font-bold="true" Font-Size="Large" ForeColor="Black"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtMileage" runat="server" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Height="25px" Width="157px" ></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:Button ID="btnSave" runat="server" Text="Add" Font-Bold="true" Font-Size="Large" Height="40px" Width="95px" OnClick="btnSave_Click" BackColor="Red" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                        &nbsp;
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" Font-Bold="true" Font-Size="Large"  Height="40px" Width="95px" OnClick="btnDelete_Click" BackColor="Red" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" />
                        &nbsp;
                       <asp:Button ID="btnClear" runat="server" Text="Clear" Font-Bold="true" Font-Size="Large"  Height="40px" Width="95px" OnClick="btn_Clear_Clickk" BackColor="Red" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" /> 
                    </td>
                    </tr>



                <tr>
                    <td class="auto-style3"></td>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"></td>
                    <td colspan="2">
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            

            </table>
            <br />
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" CssClass="auto-style5" Width="893px"  >
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Bike_no" HeaderText="Bike.No" />
                    <asp:BoundField DataField="model" HeaderText="Model" />
                    <asp:BoundField DataField="colour" HeaderText="Colour" />
                    <asp:BoundField DataField="statn_no" HeaderText="Station.No" />
                    <asp:BoundField DataField="shel_life" HeaderText="Shelf Life" />
                    <asp:BoundField DataField="mantnc" HeaderText="Maintenance" />
                    <asp:BoundField DataField="battery_status" HeaderText="Battery_Status" />
                    <asp:BoundField DataField="mileage" HeaderText="Mileage" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton Text="Select" ID="lnkSelect" CommandArgument='<%# Eval("Bike_id") %>' runat ="server" OnClick="lnkSelect_OnClick"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <br/>
            
        </div>
    </form>
</body>
</html>
