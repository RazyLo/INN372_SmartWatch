<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Caretaker.aspx.cs" Inherits="SmartWatch.Home_Caretaker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style4 {
            width: 120px;
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
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style19 {
            text-align: right;
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        .auto-style24 {
            width: 1025px;
            height: 195px;
        }
        .auto-style25 {
            width: 1025px;
        }
        .auto-style26 {
            text-align: left;
            height: 136px;
            width: 1012px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                                <asp:Button ID="btn_myassign" runat="server" Text="My Assiements" OnClick="btn_myassign_Click" />
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="Hi Caretaker "></asp:Label>
                                <asp:Label ID="lbl_careid" runat="server" Text="XXX"></asp:Label>
                            &nbsp;<asp:Button ID="Button11" runat="server" Text="Log out" OnClick="Button11_Click" />
                            </td>
                        </tr>
                        </table>
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style26" style="border: medium groove #FFFFFF">
                                <asp:GridView ID="gv_myassign" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1008px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtbox_seach" runat="server" Width="191px"></asp:TextBox>
                                <asp:Button ID="btn_mypatients" runat="server" Text="Search My Patient" OnClick="btn_mypatients_Click" />
                                <br />
                                <asp:Label ID="lbl_search" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style26" style="border: medium groove #FFFFFF">
                                <asp:GridView ID="gv_mypatient" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1006px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                                <br />
                            </td>
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
    </form>
</body>
</html>
