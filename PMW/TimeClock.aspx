<%@ Page Title="TimeClock" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TimeClock.aspx.vb" Inherits="PMW.TimeClock" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<meta http-equiv="refresh" content="30" />
	<style type="text/css">
    .wrap { white-space: normal; width: 100px; }
</style>
	
	<br />

	<h2><%: Title %></h2>
	<br /><br />
	<center>
	<table cellspacing="5"  cellpadding="5">
		<tr>
			<td colspan="4" align="center">
				<h1> <%= DateTime.Now.ToString("hh:mm") %> </h1>
			</td>
		</tr>
		<tr>
	<td colspan="4" align="center">
		 <asp:Label ID="Label1" Text=" Clocked In: " runat="server"></asp:Label>  <asp:Label ID="lblclockintime" runat="server"></asp:Label>  
	</td>
</tr>
				<tr>
	<td colspan="4" align="center">
		 <asp:Label ID="Label2" Text="Clocked Out: " runat="server"></asp:Label>   <asp:Label ID="lblclockouttime" runat="server"></asp:Label>  
	</td>
</tr>
		<tr>
			<td>
				 <asp:Button ID="btnclockin" OnClick="btnclockin_Click" runat="server" Text="First Shift Clock In" CssClass="wrap" Width="110" Height="100"   />
			</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>
				 <asp:Button ID="btnclockout" runat="server" OnClick="btnclockout_Click" Width="110" CssClass="wrap" Height="100"  Text="First Shift Clock Out" />
			</td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
	<td>
		 <asp:Button ID="Button1" runat="server" Text="Paid Time Off" Width="110" Height="100"   />
	</td>
			<td>&nbsp;&nbsp;&nbsp;</td>
	<td>
		 <asp:Button ID="Button3" runat="server" Width="110" Height="100" OnClick="Button3_Click"  Text="Review Time" />
	</td>
</tr>
				<tr>
			<td>&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
	<td>
		 <asp:Button ID="Button2" runat="server" Text="Authorized Early Clock In" CssClass="wrap" Width="110" Height="100"   />
	</td>
			<td>&nbsp;&nbsp;&nbsp;</td>
	<td>
		 <asp:Button ID="Button4" runat="server" Width="110" Height="100" CssClass="wrap"  Text="Authorized Late Clock Out" />
	</td>
</tr>
	</table>
       
	
	<br />
	
	 
       
    
	</center>
	
	
   
</asp:Content>
