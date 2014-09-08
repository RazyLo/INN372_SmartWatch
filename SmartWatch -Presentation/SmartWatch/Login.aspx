<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SmartWatch.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
    <style type="text/css">
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            width: 120px;
        }
        .auto-style11 {
            width: 1025px;
            height: 224px;
        }
        .auto-style12 {
            width: 120px;
            height: 224px;
        }
        .auto-style13 {
            height: 224px;
        }
        .auto-style14 {
            width: 243px;
        }
        .auto-style15 {
            width: 363px;
        }
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style18 {
            width: 119px;
        }
        .auto-style19 {
            width: 1025px;
            height: 195px;
        }
    </style>
    <script type="text/javascript" src="../javascript/login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style9">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td>
                    <img alt="" class="auto-style19" src="image/banner_hospital.jpg" /></td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style9">
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style11" style="background-image: url('image/background.jpg')">
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style14">
        
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="Login"></asp:Label>
                                <br />
                                <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="False" Text="UserName: "></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <br />
            <asp:Label ID="Label3" runat="server" Text="Password:    "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                <br />
                                I am a:&nbsp;
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Value="A">Admin</asp:ListItem>
                                    <asp:ListItem Value="D">Doctor</asp:ListItem>
                                    <asp:ListItem Value="C">Caretaker</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
            <asp:Button ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click" />
        
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style13"></td>
            </tr>
        </table>
        <table class="auto-style9">
            <tr>
                <td class="auto-style18">&nbsp;</td>
                <td>
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style15">&nbsp;</td>
                            <td>
                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="Copyright Small Apple - QUT 2014 Sem 2" ForeColor="#999999"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
            <br />
        
    </div>
    </form>
</body>
</html>
