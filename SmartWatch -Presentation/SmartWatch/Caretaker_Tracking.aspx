<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Caretaker_Tracking.aspx.cs" Inherits="SmartWatch.Caretaker_Tracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 120px;
        }
        .auto-style25 {
            width: 1025px;
        }
        .auto-style24 {
            width: 1025px;
            height: 195px;
        }
        .auto-style9 {
            width: 100%;
        }
        .auto-style15 {
            text-align: left;
        }
        .auto-style14 {
            width: 243px;
        }
        .auto-style19 {
            text-align: right;
        }
        .auto-style26 {
            text-align: left;
            height: 136px;
            width: 1012px;
        }
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style25">
                    <img alt="" class="auto-style24" src="image/banner_hospital.jpg" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style25">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home_Caretaker.aspx">Home</asp:HyperLink>
                &nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Caretaker_Tracking.aspx">Tracking</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style25" style="background-image: url('image/background.jpg')">
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style15">
                                &nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="Hi Caretaker "></asp:Label>
                                <asp:Label ID="lbl_careid" runat="server"></asp:Label>
                            &nbsp;</td>
                        </tr>
                        </table>
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style26" style="border: medium groove #FFFFFF">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <iframe
			                        width="600"
		                            height="450"
		                            frameborder="0" style="border-style: none; border-color: inherit; border-width: 0; "
		                            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAv8wmCb1dytIE7T0k4T5igFZJWZaxm8YE
			                        &q=QUT">
		                        </iframe>
                            </td>
                        </tr>
                    </table>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style25">
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style23">&nbsp;</td>
                            <td>
                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="Copyright Small Apple - QUT 2014 Sem 2" ForeColor="Gray"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
