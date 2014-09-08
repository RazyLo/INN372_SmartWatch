<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testGoogle.aspx.cs" Inherits="testGooglemap.testGoogle" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="../Scripts/map.js"></script>
    <style type="text/css">
        #getlo
        {
            width: 146px;
        }
    </style>
</head>
<body onload="initialize()">
    <form id="form1" runat="server">
    <div style="margin-left:auto; margin-right:auto">
        <div id="prompt" style="width:1100px; height:100px; margin-left:auto; margin-right:auto;background-color:lightgrey;">
            <textarea id="txt_patientstatus" cols="20" rows="2" style="width:100%; height:100%; color:red;">


            </textarea>
        </div>
        <div id="googleMap" style="width:1100px; height:300px; margin-left:auto; margin-right:auto"></div>
            <div id="Div1" style="width:1100px; height:500px; margin-left:auto; margin-right:auto">
            Latitude:<input id="positionx" />
            Longitude:<input id="positiony" />
            <asp:Button ID="addbtn" runat="server" Text="Add Fence" OnClientClick="return addFenceViaButton()"></asp:Button>
            <asp:Button ID="deletebtn" runat="server" Text="Delete Fence" OnClientClick="return deleteFenceViaButton()"></asp:Button>
                <asp:Button ID="btn_getlo" runat="server" OnClientClick="return addPatitentLocation(gv_location.id)"  Text="get patients" Width="156px" OnClick="btn_getlo_Click1" />
                
            <h4>Patients Location</h4>
       
            <asp:GridView ID="gv_location"  runat="server" BackColor="White" AutoGenerateColumns="false"  BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="1098px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="PatientID" HeaderText="Name" />
                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" />
                    <asp:BoundField DataField="Logitude" HeaderText="Logitude" />
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
                <!--
                <button id="getlo" onclick="return Read_Data(gv_location.id)">Get</button>
                -->
                
        </div>
    </div>
    </form>
</body>
</html>