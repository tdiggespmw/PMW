<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="employees.aspx.vb" Inherits="PMW.employees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <br /><br />

	 <asp:Table ID="tblContent1" runat="server" BorderColor="1" Width="100%" Height="376px" >
     
      <asp:TableRow>
               <asp:TableCell HorizontalAlign="right">
                <asp:Label CssClass="labels" ID="Label44" runat="server" Text="Company : " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                 <asp:DropDownList ID="company" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="CompanyOnSelectedIndexchange" >
                  <asp:ListItem Text="--Select--" Value="0" ></asp:ListItem>
                 </asp:DropDownList>
               </asp:TableCell>
           <asp:TableCell HorizontalAlign="right">
                 <asp:Label CssClass="labels" ID="Label45" runat="server" Text="Branch : " ></asp:Label>
                  </asp:TableCell >

               <asp:TableCell >  
                 <asp:DropDownList ID="branch" runat="server"    >
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                </asp:TableCell >

      </asp:TableRow>

          <asp:TableRow>
               <asp:TableCell HorizontalAlign="right">
                <asp:Label CssClass="labels" ID="Label1" runat="server" Text="First Name : " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                <asp:TextBox ID="firstname" runat="server" > </asp:TextBox>
               </asp:TableCell>
           <asp:TableCell HorizontalAlign="right">
                 <asp:Label CssClass="labels" ID="Label2" runat="server" Text="Last Name : " ></asp:Label>
                  </asp:TableCell >

               <asp:TableCell >  
                <asp:TextBox ID="lastname" runat="server" > </asp:TextBox>
                </asp:TableCell >

      </asp:TableRow>

          <asp:TableRow>
                <asp:TableCell HorizontalAlign="right">
                <asp:Label CssClass="labels" ID="Label6" runat="server" Text="Address : " ></asp:Label>
               </asp:TableCell >
               <asp:TableCell >
                <asp:TextBox ID="TextBox3" runat="server" > </asp:TextBox>
               </asp:TableCell>
           

               <asp:TableCell HorizontalAlign="right">
                <asp:Label CssClass="labels" ID="Label3" runat="server" Text="City : " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                <asp:TextBox ID="TextBox1" runat="server" > </asp:TextBox>
               </asp:TableCell>
            </asp:TableRow>
         <asp:TableRow>

              
           <asp:TableCell HorizontalAlign="right">
                                 
                <asp:Label CssClass="labels" ID="Label4" runat="server" Text="State : " ></asp:Label>
               </asp:TableCell >
              <asp:TableCell>
                 <asp:DropDownList ID="state" runat="server" AutoPostBack="True"  >
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                  </asp:TableCell >
            

                    <asp:TableCell HorizontalAlign="right">
                <asp:Label CssClass="labels" ID="Label5" runat="server" Text="Zip : " ></asp:Label>
               </asp:TableCell >


               <asp:TableCell >
                <asp:TextBox ID="TextBox2" runat="server" > </asp:TextBox>
               </asp:TableCell>

         </asp:TableRow>
         <asp:TableRow>
             <asp:TableCell></asp:TableCell>
             <asp:TableCell>
                 <asp:Button runat="server" ID="btnsave" Text="Save" />
             </asp:TableCell>
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
 </asp:Table>

</asp:Content>
