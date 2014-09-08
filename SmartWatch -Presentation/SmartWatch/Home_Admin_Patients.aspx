<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Admin_Patients.aspx.cs" Inherits="SmartWatch.Home_Admin_Patients" %>

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
            width: 521px;
            height: 30px;
            text-align: left;
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
        #TextArea1
        {
            height: 49px;
        }
        .auto-style30
        {
            height: 45px;
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
                                <asp:Button ID="btn_search" runat="server" Text="Search Patient" Width="186px" OnClick="btn_search_Click" />
                                <br />
                                <asp:Label ID="lbl_searchwarning" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28" style="border: medium groove #FFFFFF">
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <div style="max-height:150px; overflow-y:scroll">
                                                <br />

                                                <asp:GridView ID="gv_patientview" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="172px" OnSelectedIndexChanging="gv_patientview_SelectedIndexChanging" Width="1004px" OnRowDeleting="gv_patientview_RowDeleting">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:CommandField ShowDeleteButton="True" />
                                                        <asp:CommandField ShowSelectButton="True" />
                                                    </Columns>
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
                                            Patient ID :</td>
                                        <td class="auto-style34">
                                            <asp:Label ID="lbl_idwarning" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtbox_patientid" runat="server"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Name:</td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lbl_namewarning" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtbox_name" runat="server"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style30">
                                            Gender</td>
                                        <td class="auto-style30">
                                            <asp:Label ID="lbl_genderwarning" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtbox_gender" runat="server"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Date of Birth:</td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lbl_birthdaywarning" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtbox_birthday" runat="server" TextMode="Date"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Age</td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lbl_agewarning" runat="server"></asp:Label>
                                            <asp:TextBox ID="txtbox_age" runat="server" TextMode="Number"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            Medical Diagnosis</td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lbl_medicalwarning" runat="server"></asp:Label>
                                            &nbsp;<asp:TextBox ID="txtbox_medical" runat="server" Columns="20" Rows="7" Height="53px" Width="201px" TextMode="MultiLine"></asp:TextBox>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style32">
                                            <br />
                                <asp:Button ID="btn_addpatient" runat="server" Text="Add" Width="108px" OnClick="btn_addpatient_Click"/>
                                        </td>
                                        <td class="auto-style31">
                                            <br />
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
                <td class="auto-style4">&nbsp</td>
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
