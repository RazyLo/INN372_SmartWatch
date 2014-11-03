<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Admin_Assignments.aspx.cs" Inherits="SmartWatch.Home_Admin" %>

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
        .auto-style16 {
            width: 1026px;
            background-image: url('image/footerBackground.png');
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        .auto-style25 {
            width: 1025px;
            height: 195px;
        }
        .auto-style26 {
            width: 1026px;
            text-align: center;
        }
        .auto-style27 {
            width: 40%;
        }
        .auto-style28 {
            width: 521px;
            height: 200px;
        }
        .auto-style29 {
            width: 521px;
            height: 30px;
            text-align: left;
        }
        .auto-style30
        {
            height: 30px;
        }
        </style>
    <script type="text/javascript" src="../javascript/admin.js"></script>
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
                <td class="auto-style26" style="background-image: url('image/background.jpg'); text-align:right">
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
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                <asp:TextBox ID="textbox_assgin" ClientIDMode="Inherit" runat="server" Width="225px" TextMode="Number"></asp:TextBox>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="search_btn" runat="server" Text="Search Assignment" Width="170px" OnClick="search_btn_Click1"  />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="auto-style28" style="border: medium groove #FFFFFF">
                                <table class="auto-style1" style="overflow-y:scroll; height: 168px;">
                                    <tr>
                                        <td>
                                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                                            </asp:ScriptManager>
                                  <asp:UpdatePanel ID="update"  runat="server" UpdateMode="Conditional">  
                                    <ContentTemplate>
                                      <asp:GridView ID="gv_assignments" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Height="164px" Width="995px" OnRowDeleting="gv_assignments_RowDeleting" OnSelectedIndexChanging="gv_assignments_SelectedIndexChanging">
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
                                        </ContentTemplate>
                                      <Triggers>
                                          <asp:AsyncPostBackTrigger ControlID="btn_add" />
                                      </Triggers>
                                        </asp:UpdatePanel>           
                                        </td>
                                    </tr>
                                </table>
                            
                           </td> 
                        </tr>
                        <tr>
                            <td class="auto-style27" style="border: medium groove #FFFFFF">
                                <table class="auto-style1">
                                    <tr>
                                        <td class="auto-style30">
                                            <asp:Label ID="Label8" runat="server" Text="Patient ID: "></asp:Label>
                                            <asp:TextBox ID="txtbox_pid" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_pidwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style30">
                                            <asp:Label ID="Label9" runat="server" Text="Doctor ID: "></asp:Label>
                                            <asp:TextBox ID="txtbox_did" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_didwarning" runat="server"></asp:Label>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" Text="Caretaker ID: "></asp:Label>
                                            <asp:TextBox ID="txtbox_cid" runat="server"></asp:TextBox>
                                            <asp:Label ID="lbl_cidwarning" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                <asp:Button ID="btn_add" runat="server" Text="Add" Width="71px" OnClick="btn_add_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" />
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
