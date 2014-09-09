﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Admin_Caretakers.aspx.cs" Inherits="SmartWatch.Home_Admin_Caretakers" %>

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
        .auto-style26 {
            width: 1026px;
        }
        .auto-style25 {
            width: 1025px;
            height: 195px;
        }
        .auto-style29 {
            width: 521px;
            height: 30px;
        }
        .auto-style28 {
            width: 521px;
            height: 200px;
        }
        .auto-style27 {
            width: 40%;
        }
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        .auto-style31
        {
            width: 304px;
        }
        .auto-style32
        {
            width: 96px;
        }
        .auto-style33
        {
            width: 96px;
            height: 26px;
        }
        .auto-style34
        {
            width: 304px;
            height: 26px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style26">
                    <img alt="" class="auto-style25" src="image/banner_hospital.jpg" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style26">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4" style="border: thin none #E2F1EA; text-align: center; background-color: #E2F1EA;">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home_Admin_Assignments.aspx">Assignments</asp:HyperLink>
                            </td>
                            <td class="auto-style4" style="border: thin none #E2F1EA; text-align: center; background-color: #E2F1EA;">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Home_Admin_Doctors.aspx">Doctors</asp:HyperLink>
                            </td>
                            <td class="auto-style4" style="border: thin none #E2F1EA; text-align: center; background-color: #E2F1EA;">
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Home_Admin_Caretakers.aspx">Caretakers</asp:HyperLink>
                            </td>
                            <td class="auto-style4" style="border: thin none #E2F1EA; text-align: center; background-color: #E2F1EA;">
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Home_Admin_Patients.aspx">Patients</asp:HyperLink>
                            </td>
                            <td style="background-color: #E2F1EA">&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style26" style="background-image: url('image/background.jpg'); text-align: right;">
                                <asp:Label ID="Label11" runat="server" Text="Hi Admin "></asp:Label>
                                <asp:Label ID="roleID_lbl" runat="server" Text="XXX"></asp:Label>
                &nbsp;<asp:Button ID="Button11" runat="server" Text="Log out" OnClick="Button11_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style26" style="background-image: url('image/background.jpg')">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style29" style="border: medium groove #FFFFFF">
                                <asp:TextBox ID="txtbox_search" runat="server" Width="225px"></asp:TextBox>
                                <asp:Button ID="btn_search" runat="server" Text="Search Caretaker" Width="186px" OnClick="btn_search_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28" style="border: medium groove #FFFFFF">
                                <asp:Label ID="lbl_searchwarning" runat="server"></asp:Label>
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <div style="max-height:150px; overflow-y:scroll">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="update"  runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                    <asp:GridView ID="gv_caretakerview" runat="server" Height="156px" Width="1009px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowDeleting="gv_caretakerview_RowDeleting" OnSelectedIndexChanging="gv_caretakerview_SelectedIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:CommandField ShowSelectButton="True" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle HorizontalAlign="Center" BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                    </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btn_addcare" />
                                    </Triggers>
                                    </asp:UpdatePanel>
                                                <br />
                                                </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style27" style="border: medium groove #FFFFFF">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style33">
                                            CareID:</td>
                                        <td class="auto-style34">
                                            <asp:TextBox ID="txtbox_careID" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_idwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Name:</td>
                                        <td class="auto-style31">
                                            <asp:TextBox ID="txtbox_name" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_namewarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Gender</td>
                                        <td class="auto-style31">
                                            <asp:TextBox ID="txtbox_gender" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_genderwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Contact No:</td>
                                        <td class="auto-style31">
                                            <asp:TextBox ID="txtbox_contactno" runat="server" TextMode="Number"></asp:TextBox>
                                            <asp:Label ID="lbl_contactwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Age</td>
                                        <td class="auto-style31">
                                            <asp:TextBox ID="txtbox_age" runat="server" TextMode="Number"></asp:TextBox>
                                            <asp:Label ID="lbl_agewarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                        <asp:Button ID="btn_addcare" runat="server" Text="Add" Width="108px" OnClick="btn_addcare_Click" />
                                        </td>
                                        <td class="auto-style31">
                                <asp:Button ID="btn_update" runat="server" Text="Update" Width="119px" OnClick="btn_update_Click" />
                                        </td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style26">
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style23">&nbsp;</td>
                            <td>
                    <asp:Label ID="Label7" runat="server" Font-Size="Small" Text="Copyright Small Apple - QUT 2014 Sem 2" ForeColor="Gray"></asp:Label>
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
