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
            width: 1116px;
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
            height: 33px;
        }
        .auto-style23 {
            width: 363px;
            text-align: left;
        }
        </style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="../javascript/map.js"></script>
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
<div style="margin-left:auto; margin-right:auto">
        <div id="prompt" style="width:1100px; height:100px; margin-left:auto; margin-right:auto;background-color:lightgrey;">
            <textarea id="txt_patientstatus" cols="20" rows="2" style="width:100%; height:100%; color:red;">


            </textarea><br />
&nbsp;<br />
        </div>
    <br />
        <div id="googleMap" style="width:1092px; height:431px; margin-left:auto; margin-right:auto"></div>
            <div id="Div1" style="width:1100px; height:538px; margin-left:auto; margin-right:auto">
            Latitude:<input id="positionx" />
            Longitude:<input id="positiony" />
            <asp:Button ID="addbtn" runat="server" Text="Add Fence" OnClientClick="return addFenceViaButton()"></asp:Button>
            <asp:Button ID="deletebtn" runat="server" Text="Delete Fence" OnClientClick="return deleteFenceViaButton()"></asp:Button>
                <asp:Button ID="btn_getlo" runat="server" OnClientClick="return addPatitentLocation(gv_location.id)"  Text="Show Patients' Location" Width="156px" OnClick="btn_getlo_Click1" />
                <h4>Fence Location</h4>
                
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"  OnAsyncPostBackError="ScriptManager1_AsyncPostBackError" >
                </asp:ScriptManager>
                <asp:Button ID="btn_Update" runat="server" Text="Update Fence" ClientIDMode="Static" OnClientClick="return getCirclesValue()" Width="133px" OnClick="btn_Update_Click" />
                <br />
                <input id="lbl_circle1_lat_id" name="lbl_circle1_lat_name" readonly="true" style="visibility:hidden" />
                <input id="lbl_circle1_log_id" name="lbl_circle1_log_name" readonly="true" style="visibility:hidden" />
                <input id="lbl_circle1_radius_id" name="lbl_circle1_radius_name" readonly="true" style="visibility:hidden" />

                <input id="lbl_circle2_lat_id" name="lbl_circle2_lat_name" readonly="true" style="visibility:hidden" />
                <input id="lbl_circle2_log_id" name="lbl_circle2_log_name" readonly="true" style="visibility:hidden" />
                <input id="lbl_circle2_radius_id" name="lbl_circle2_radius_name" readonly="true" style="visibility:hidden"/>

                <asp:UpdatePanel ID="UpdateLocation" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                
                <br />
                <asp:GridView ID="gv_fence_details" runat="server" BackColor="White" AutoGenerateColumns="False" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1092px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField HeaderText="Fence No" DataField="FenceNo" />
                        <asp:BoundField DataField="Latitude" HeaderText="Latitude" />
                        <asp:BoundField DataField="Longitude" HeaderText="Longitude" />
                        <asp:BoundField DataField="Radius" HeaderText="Radius" />
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
                        <asp:AsyncPostBackTrigger ControlID="btn_Update" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                
                   
            <h4>Patients Location</h4>
                <p>
                    <input id="inputpid" name="input_name" style="width:150px;height:18px;" />
                    <asp:Button ID="Button1" runat="server" Text="Get Patient" Width="122px" OnClientClick="return trackingThePatient(gv_location.id)" OnClick="Button1_Click"/>
                    &nbsp;&nbsp;
                    <asp:Button ID="btn_tracking" runat="server" Text="Tracking" Width="122px" OnClientClick="return trackingRecord(gv_location.id)" OnClick="btn_tracking_Click" />
                </p>
                <div style="overflow:scroll; height:200px; width:100%" >
            <asp:GridView ID="gv_location"  runat="server" BackColor="White" AutoGenerateColumns="False"  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1098px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Patient_ID" HeaderText="Name" />
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" />
                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" />
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
                    </div>
                <!--
                <button id="getlo" onclick="return Read_Data(gv_location.id)">Get</button>
                -->
                
        </div>
    </div>                                
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
