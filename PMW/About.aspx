<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="PMW.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<h2>
        <asp:Table ID="Table1" runat="server" Visible="False" Width="200px">
        </asp:Table>
        ewrwerwewet</h2>
	<h2>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server">
        </asp:DropDownList>
    </h2>
	<h2>&nbsp;</h2>
	<h2>t</h2>
	<h2>ew</h2>
	<h2>wet</h2>
	<h2>w<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pmwConnectionString %>" SelectCommand="SELECT CountryID, CountryName, CountryAbbreviation FROM CountryT"></asp:SqlDataSource>
		<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CountryID" DataValueField="CountryName">
		</asp:DropDownList>
	</h2>
	<h2>et</h2>
	<h2>wet</h2>
	<h2>we</h2>
	<h2>twe</h2>
	<h2>t</h2>
	<h2>wet</h2>
	<h2>w</h2>
	<h2>&nbsp;</h2>
	<h2>we</h2>
	<h2>et</h2>
	<h2>we</h2>
	<h2>tewtwetwewtwetwetwet<%: Title %>.</h2>
    <p>Your app description page.</p>
    <p>Use this area to provide additional information.</p>
</asp:Content>
