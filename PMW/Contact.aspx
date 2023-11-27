<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="PMW.Contact" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
 <%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=15.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="DevExpress.XtraReports.v21.2.Web.WebForms, Version=21.2.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
<!DOCTYPE html>

      
   
 
    <asp:GridView ID="GridView1" runat="server" EnableTheming="true" AutoGenerateColumns="False" DataKeyNames="PunchID" DataSourceID="SqlDataSource1" Height="342px">
        <Columns>
            <asp:BoundField DataField="InTime" HeaderText="InTime" SortExpression="InTime" />
            <asp:BoundField DataField="OutTime" HeaderText="OutTime" SortExpression="OutTime" />
            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            <asp:BoundField DataField="SickHours" HeaderText="SickHours" SortExpression="SickHours" />
            <asp:BoundField DataField="VacationHours" HeaderText="VacationHours" SortExpression="VacationHours" />
            <asp:BoundField DataField="HolidayHours" HeaderText="HolidayHours" SortExpression="HolidayHours" />
            <asp:BoundField DataField="LunchHours" HeaderText="LunchHours" SortExpression="LunchHours" />
            <asp:BoundField DataField="CorrectionHours" HeaderText="CorrectionHours" SortExpression="CorrectionHours" />
            <asp:BoundField DataField="DateWorked" HeaderText="DateWorked" SortExpression="DateWorked" />
            <asp:BoundField DataField="PunchID" HeaderText="PunchID" InsertVisible="False" ReadOnly="True" SortExpression="PunchID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pmwConnectionString %>" SelectCommand="SELECT [InTime], [OutTime], [EmployeeID], [SickHours], [VacationHours], [HolidayHours], [LunchHours], [CorrectionHours], [DateWorked], [PunchID] FROM [TimeAttendanceT] WHERE ([EmployeeID] = @EmployeeID) ORDER BY [DateWorked]">
        <SelectParameters>
            <asp:SessionParameter Name="EmployeeID" SessionField="employeeid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
      
   
 
</asp:Content>
