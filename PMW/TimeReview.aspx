<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TimeReview.aspx.vb" Inherits="PMW.TimeReview" %>
<%@ Register assembly="DevExpress.Web.v19.2, Version=19.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




	<br />
&nbsp;<br />
	<br />
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="CompanyID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical">
		<AlternatingRowStyle BackColor="#CCCCCC" />
		<Columns>
			<asp:CommandField ShowSelectButton="True" />
			<asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
			<asp:CheckBoxField DataField="IsPrimary" HeaderText="IsPrimary" SortExpression="IsPrimary" />
			<asp:CheckBoxField DataField="IsVendor" HeaderText="IsVendor" SortExpression="IsVendor" />
			<asp:CheckBoxField DataField="IsCustomer" HeaderText="IsCustomer" SortExpression="IsCustomer" />
			<asp:BoundField DataField="CompanyID" HeaderText="CompanyID" InsertVisible="False" ReadOnly="True" SortExpression="CompanyID" />
		</Columns>
		<FooterStyle BackColor="#CCCCCC" />
		<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
		<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
		<SortedAscendingCellStyle BackColor="#F1F1F1" />
		<SortedAscendingHeaderStyle BackColor="#808080" />
		<SortedDescendingCellStyle BackColor="#CAC9C9" />
		<SortedDescendingHeaderStyle BackColor="#383838" />
	</asp:GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pmwConnectionString %>" SelectCommand="SELECT [CompanyName], [IsPrimary], [IsVendor], [IsCustomer], [CompanyID] FROM [CompanyT]"></asp:SqlDataSource>
	<br />
	<br />







</asp:Content>
