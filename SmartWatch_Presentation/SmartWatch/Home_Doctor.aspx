<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Doctor.aspx.cs" Inherits="SmartWatch.Home_Doctor" %>

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
        .auto-style19 {
            text-align: right;
        }
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        .auto-style24 {
            width: 1025px;
            height: 195px;
        }
        #TextArea1 {
            width: 393px;
            height: 73px;
        }
        #TextArea2 {
            width: 393px;
            height: 73px;
        }
        .auto-style26 {
            text-align: left;
            height: 136px;
            width: 1012px;
        }
        .auto-style27 {
            width: 1001px;
        }
        .auto-style28 {
            text-align: left;
            height: 136px;
            width: 987px;
        }
        .auto-style29 {
            width: 1025px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style29">
                    <img alt="" class="auto-style24" src="image/banner_hospital.jpg" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style29">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home_Doctor.aspx">Home</asp:HyperLink>
                &nbsp;
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Doctor_Tracking.aspx">Tracking</asp:HyperLink>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style29" style="background-image: url('image/background.jpg')">
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style15">
                                <asp:Button ID="btn_myassigns" runat="server" Text="My Assiements" OnClick="btn_myassigns_Click" />
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                            <td class="auto-style19">
                                <asp:Label ID="Label8" runat="server" Text="Hi Doctor "></asp:Label>
                                <asp:Label ID="lbl_docID" runat="server"></asp:Label>
                            &nbsp;<asp:Button ID="Button11" runat="server" Text="Log out" OnClick="Button11_Click" />
                            </td>
                        </tr>
                    </table>
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style26" style="border: medium groove #FFFFFF">
                                <br />
                                <asp:GridView ID="gv_myassignview" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1009px">
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
                                <asp:TextBox ID="txtbox_search" runat="server" Width="191px"></asp:TextBox>
                                <asp:Button ID="btn_mypatients" runat="server" Text="Search My Patient" OnClick="btn_mypatients_Click" />
                                <br />
                                <asp:Label ID="lbl_searchwarning" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <table class="auto-style9">
                        <tr>
                            <td class="auto-style28" style="border: medium groove #FFFFFF">
                                <br />
                                <asp:GridView ID="gv_mypatientsview" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1009px" OnSelectedIndexChanging="gv_mypatientsview_SelectedIndexChanging">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
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
                            </td>
                        </tr>
                    </table>
                    
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style27">
                                <br />
                                <asp:Label ID="Label9" runat="server" Text="PatientID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_pid" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_name" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label11" runat="server" Text="Gender:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_gender" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label12" runat="server" Text="Date_Of_Birth:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_date" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label13" runat="server" Text="Age:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lbl_age" runat="server"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtbox_medical" runat="server" TextMode="MultiLine" Columns="40" Rows="10"></asp:TextBox>
                                <asp:Label ID="lbl_medicalwarning" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="lbl_error" runat="server"></asp:Label>
                                <br />
                                <asp:Button ID="btn_update" runat="server" Text="Update Patient's Medical Diagnosis" OnClick="btn_update_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style29">
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
