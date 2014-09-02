<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Admin_Doctors.aspx.cs" Inherits="SmartWatch.Home_Admin_Doctors" %>

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
            text-align: right;
        }
        .auto-style25 {
            width: 1025px;
            height: 195px;
        }
        .auto-style29 {
            width: 906px;
            height: 30px;
            text-align: left;
        }
        .auto-style28 {
            width: 906px;
            height: 200px;
        }
        .auto-style27 {
            width: 906px;
        }
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        .auto-style30
        {
            width: 952px;
        }
        .auto-style31
        {
            height: 26px;
            width: 373px;
        }
        .auto-style33
        {
            height: 26px;
            width: 107px;
        }
        .auto-style35
        {
            width: 107px;
            height: 34px;
        }
        .auto-style36
        {
            height: 34px;
            width: 373px;
        }
        .auto-style37
        {
            width: 107px;
            height: 30px;
        }
        .auto-style38
        {
            height: 30px;
            width: 373px;
        }
        .auto-style39
        {
            width: 373px;
        }
        .auto-style40
        {
            width: 107px;
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
                <td class="auto-style26" style="background-image: url('image/background.jpg')">
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
                                <asp:Button ID="btn_search" runat="server" Text="Search Doctor" Width="197px" OnClick="btn_search_Click" />
                                <br />
                                <asp:Label ID="lbl_searchwarning" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28" style="border: medium groove #FFFFFF">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style30">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="update"  runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                    <asp:GridView ID="gv_doctorview" runat="server" Width="1003px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowDeleting="gv_doctorview_RowDeleting" OnSelectedIndexChanging="gv_doctorview_SelectedIndexChanging">
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
                                        <asp:AsyncPostBackTrigger ControlID="btn_adddoctor" />
                                    </Triggers>
                                        </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="auto-style27" style="border: medium groove #FFFFFF">
                                <table class="auto-style1" style="width:50%">
                                    <tr>
                                        <td class="auto-style35">
                                            Doctor ID :</td>
                                        <td class="auto-style36">
                                            <asp:TextBox ID="txtbox_did" runat="server" Width="161px" Height="16px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lbl_idwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style33">
                                            Name :</td>
                                        <td class="auto-style31">
                                            <asp:TextBox ID="txtbox_name" runat="server" Height="16px" Width="161px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lbl_namewarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style40">
                                            Gender :</td>
                                        <td class="auto-style39">
                                            <asp:TextBox ID="txtbox_gender" runat="server" Width="161px"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lbl_genderwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style37">
                                            Age :</td>
                                        <td class="auto-style38">
                                            <asp:TextBox ID="txtbox_age" runat="server" Width="161px" TextMode="Number"></asp:TextBox>
                                            <br />
                                            <asp:Label ID="lbl_agewarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style40">
                                <asp:Button ID="btn_adddoctor" runat="server" Text="Add" OnClick="btn_adddoctor_Click" Width="80px" />
                                        </td>
                                        <td class="auto-style39">
                                <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" Width="80px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        </table>
                </td>
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
