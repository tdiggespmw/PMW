<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="WebForm2.aspx.vb" Inherits="PMW.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	 
    <title></title>
    <style type="text/css">
        .Initial
        {
            display: block;
            padding: 4px 18px 4px 18px;
            float: left;
            background: url("../Images/InitialImage.png") no-repeat right top;
            color: Black;
            font-weight: bold;
        }
        .Initial:hover
        {
            color: White;
            background: url("../Images/SelectedButton.png") no-repeat right top;
        }
        .Clicked
        {
            float: left;
            display: block;
            background: url("../Images/SelectedButton.png") no-repeat right top;
            padding: 4px 18px 4px 18px;
            color: Black;
            font-weight: bold;
            color: White;
        }
    
/* Red border */
hr.new1 {
  border-top: 1px solid black;
}

/* Dashed red border */
hr.new2 {
  border-top: 1px dashed red;
}

/* Dotted red border */
hr.new3 {
  border-top: 1px dotted red;
}

/* Thick red border */
hr.new4 {
  border: 1px solid red;
}

/* Large rounded green border */
hr.new5 {
  border: 10px solid green;
  border-radius: 5px;
}
</style>
    <table width="80%" border="0" align="center">
        <tr>
            <td>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>



                <asp:Button Text="Company" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
                    OnClick="Tab1_Click" />
                <asp:Button Text="Personal" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
                    OnClick="Tab2_Click" />
                <asp:Button Text="Employee" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
                    OnClick="Tab3_Click" />
                <asp:Button Text="Customer" BorderStyle="None" ID="Tab4" CssClass="Initial" runat="server"
                    OnClick="Tab4_Click" />
                 <asp:Button Text="Vendor" BorderStyle="None" ID="Tab5" CssClass="Initial" runat="server"
                    OnClick="Tab5_Click" />
                 <asp:Button Text="User" BorderStyle="None" ID="Tab6" CssClass="Initial" runat="server"
                    OnClick="Tab6_Click" />



<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  ///////////////////////////////////////////start main view////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

                <asp:MultiView ID="MainView" runat="server">




<!--  //////////////////////////////////////////////view 1/////////////////////////////////////////////////////////////////-->

                    <asp:View ID="View1" runat="server">
                        <table CellPadding="2" CellSpacing="2" border="1" style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <br />
 <!--  //////////////////////////////////////////////view 1/////////////////////////////////////////////////////////////////-->
  <!--  //////////////////////////////////////////////\\/////////////////////////////////////////////////////////////////-->
 <!--  //////////////////////////////////////////////\\/////////////////////////////////////////////////////////////////-->
  <!--  //////////////////////////////////////////////\\/////////////////////////////////////////////////////////////////-->

                                   
 <asp:Table ID="tblContent1" runat="server"  CellPadding="2" CellSpacing="2"   Width="100%" Height="151px" >
     
      <asp:TableRow>
               <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label44" runat="server" Text="Company  " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                     <asp:Button runat="server" ID="addnewcompany" Text="+" OnClick="addnewcompany_Click"   />&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="company" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="CompanyOnSelectedIndexchange" >
                  <asp:ListItem Text="--Select--" Value="0" ></asp:ListItem>
                 </asp:DropDownList>
                   
               </asp:TableCell>
            <asp:TableCell>
                  
                </asp:TableCell>
                <asp:TableCell>
                  <%--  <asp:Button runat="server" ID="editselectedcompany" Text="Edit Selected Company" OnClick="editselectedcompany_Click"   />--%>
                </asp:TableCell>
      </asp:TableRow>
     <asp:TableRow>
         <asp:TableCell>
             <br />
         </asp:TableCell>
     </asp:TableRow>
        <asp:TableRow>
     
       <asp:TableCell>

       </asp:TableCell>
        <asp:TableCell >
         <asp:CheckBox runat="server" Text=" Company"  AutoPostBack="true" ID="ismaincompany" OnCheckedChanged="ismaincompany_CheckedChanged" />
       </asp:tablecell> 
               
   
   
     
<asp:TableCell>
         <asp:CheckBox runat="server" Text=" Customer" AutoPostBack="true"  ID="iscustomer" OnCheckedChanged="iscustomer_CheckedChanged" />
             </asp:tablecell>
                       
       <asp:TableCell>
 <asp:CheckBox runat="server" Text=" Vendor" ID="isvendor" AutoPostBack="true" OnCheckedChanged="isvendor_CheckedChanged" />
     </asp:TableCell>
                
   
  </asp:TableRow>
      <asp:TableRow>
     <asp:TableCell>
                    
    <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
</asp:TableCell>
<asp:TableCell>
    <asp:TextBox ID="companyname" runat="server"></asp:TextBox>
     
     </asp:TableCell>
          <asp:TableCell>
    <asp:Button ID="btnsavecompany" runat="server"  Text="Save" OnClick="btnsavecompany_Click" />
    <asp:Button ID="btncancelcompany" runat="server" Text="Cancel" OnClick="btncancelcompany_Click"   />
</asp:TableCell>
 </asp:TableRow>

          <asp:TableRow>
              

     </asp:TableRow>
 
         

       

<asp:TableRow>
    <asp:TableCell ColumnSpan="6">
        <br /><hr class="new1">
    </asp:TableCell>
</asp:TableRow>

<asp:TableRow>
   <asp:TableCell HorizontalAlign="left">
                 <asp:Label CssClass="labels" ID="Label45" runat="server" Text="Branch  " ></asp:Label>
                  </asp:TableCell >

               <asp:TableCell >  
                    <asp:Button runat="server"  ID="addnewbranch" text="+" OnClick="addnewbranch_Click" />&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="branch" runat="server"  OnSelectedIndexChanged ="branch_SelectedIndexChanged"  >
                    
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                      
                </asp:TableCell >
                <asp:TableCell>
                
                </asp:TableCell>
                <asp:TableCell>
                  <%--  <asp:Button runat="server" ID="editselectedbranch" Text="Edit Selected Branch" OnClick="editselectedbranch_Click" />--%>
                </asp:TableCell>
</asp:TableRow>
           <asp:TableRow>
     <asp:TableCell>
                    
    <asp:Label ID="lblbranchname" runat="server" Text="Name"></asp:Label>
</asp:TableCell>
<asp:TableCell>
    <asp:TextBox ID="branchname" runat="server"></asp:TextBox>
     
     </asp:TableCell>
          <asp:TableCell>
    <asp:Button ID="btnsavebranch" runat="server"  Text="Save" OnClick="btnsavebranch_Click"   />
    <asp:Button ID="btncancelbranch" runat="server" Text="Cancel"  OnClick="btncancelbranch_Click"    />
</asp:TableCell>
 </asp:TableRow>
<asp:TableRow>
    <asp:TableCell  ColumnSpan="6">
        <br /><hr class="new1">
    </asp:TableCell>
</asp:TableRow>


<asp:TableRow>
     
    <asp:TableCell ColumnSpan="2">
      <b> Shipping Address</b>
    </asp:TableCell>
     
     <asp:TableCell   HorizontalAlign="left">
        <b>Billing Address</b>
    </asp:TableCell>


</asp:TableRow>
          <asp:TableRow>
               <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label1" runat="server" Text="Address Line 1" ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                <asp:TextBox ID="shipaddressline1" runat="server" > </asp:TextBox>
               </asp:TableCell>
           <asp:TableCell HorizontalAlign="left">
                 <asp:Label CssClass="labels" ID="Label2" runat="server" Text="Address Line 1  " ></asp:Label>
                  </asp:TableCell >

               <asp:TableCell >  
                <asp:TextBox ID="billaddressline" runat="server" > </asp:TextBox>
                </asp:TableCell >
      </asp:TableRow>

          <asp:TableRow>
                <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label6" runat="server" Text="Address Line 2  " ></asp:Label>
               </asp:TableCell >
               <asp:TableCell >
                <asp:TextBox ID="shipaddressline2" runat="server" > </asp:TextBox>
               </asp:TableCell>
               <asp:TableCell HorizontalAlign="left">
                 <asp:Label CssClass="labels" ID="Label3" runat="server" Text="Address Line 2  " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                <asp:TextBox ID="billaddressline2" runat="server" > </asp:TextBox>
               </asp:TableCell>
            </asp:TableRow>
        


              <asp:TableRow>
                <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label7" runat="server" Text="City  " ></asp:Label>
               </asp:TableCell >
               <asp:TableCell >
                <asp:TextBox ID="shipcity" runat="server" > </asp:TextBox>
               </asp:TableCell>
           

               <asp:TableCell HorizontalAlign="left">
                 <asp:Label CssClass="labels" ID="Label8" runat="server" Text="City  " ></asp:Label>
               </asp:TableCell >

               <asp:TableCell >
                <asp:TextBox ID="billcity" runat="server" > </asp:TextBox>
               </asp:TableCell>
            </asp:TableRow>



         <asp:TableRow>
           <asp:TableCell HorizontalAlign="left">
                                 
                <asp:Label CssClass="labels" ID="Label4" runat="server" Text="State  " ></asp:Label>
               </asp:TableCell >
              <asp:TableCell>
                 <asp:DropDownList ID="shipstate" runat="server" AutoPostBack="True"  >
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                  </asp:TableCell >
            
             <asp:TableCell HorizontalAlign="left">
                      <asp:Label CssClass="labels" ID="Label5" runat="server" Text="State  " ></asp:Label>
               </asp:TableCell>
              <asp:TableCell>
                 <asp:DropDownList ID="billstate" runat="server" AutoPostBack="True"  >
                  <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                  </asp:TableCell >

         </asp:TableRow>



<asp:TableRow>
                     
                 <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label9" runat="server" Text="Zip  " ></asp:Label>
               </asp:TableCell >


               <asp:TableCell >
                <asp:TextBox ID="shipzip" runat="server" > </asp:TextBox>
               </asp:TableCell>
            

                    <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label10" runat="server" Text="Zip  " ></asp:Label>
               </asp:TableCell >


               <asp:TableCell >
                <asp:TextBox ID="billzip" runat="server" > </asp:TextBox>
               </asp:TableCell>

         </asp:TableRow>


     <asp:TableRow>
                     
                 <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label11" runat="server" Text="Country  " ></asp:Label>
               </asp:TableCell >


               <asp:TableCell >
                <asp:TextBox ID="shipcountry" runat="server" > </asp:TextBox>
               </asp:TableCell>
            

                    <asp:TableCell HorizontalAlign="left">
                <asp:Label CssClass="labels" ID="Label12" runat="server" Text="Country  " ></asp:Label>
               </asp:TableCell >


               <asp:TableCell >
                <asp:TextBox ID="billcountry" runat="server" > </asp:TextBox>
               </asp:TableCell>

         </asp:TableRow>














         <asp:TableRow>
             <asp:TableCell></asp:TableCell>
             <asp:TableCell>
                 <asp:Button runat="server" ID="continuebutton1" Text="Save" OnClick="continuebutton1_Click" />
             </asp:TableCell>
             <asp:TableCell></asp:TableCell>
         </asp:TableRow>
 </asp:Table>

                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <!--  //////////////////////////////////////////////////view 2///////////////////////////////////////////////////////////-->



                    <asp:View ID="View2" runat="server">
                        <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <asp:Table ID="Table2" runat="server" CellPadding="2" CellSpacing="2" Height="376px" Width="100%">
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label14" runat="server" Text="First Name  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label22" runat="server" Text="Middle Initial " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label23" runat="server" Text="Last Name  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox6" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label24" runat="server" Text="Mobile Phone  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox7" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label25" runat="server" Text="Office Phone  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox8" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label26" runat="server" Text="Extension  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox9" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label27" runat="server" Text="Home Phone  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox10" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label28" runat="server" Text="Personal Email  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox11" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
										<asp:TableRow>
											<asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label29" runat="server" Text="Work Email  " ></asp:Label>
                                           </asp:TableCell>
											<asp:TableCell>
                                             <asp:TextBox ID="TextBox12" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
										</asp:TableRow>
									</asp:Table>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>


<!--  ////////////////////////////////////////////////view 3/////////////////////////////////////////////////////////-->




                    <asp:View ID="View3" runat="server">
                        <table style="width: 100%;  border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <br />
                                    
                                    <asp:Table ID="Table1" runat="server"  CellPadding="2" CellSpacing="2"   Width="100%" Height="376px" >
                               <asp:TableRow>
     
                                    <asp:TableCell ColumnSpan="2">
                                      <b> Employee Address</b>
                                    </asp:TableCell>
     
                                     <asp:TableCell   HorizontalAlign="left">
                                        <b>Emergency Contact</b>
                                    </asp:TableCell>


                                </asp:TableRow>
                                  <asp:TableRow>

                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label13" runat="server" Text="Address  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="employeeaddress" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                       <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label30" runat="server" Text="First Name  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emerfirstname" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
                                        
                                  </asp:TableRow>
                                         <asp:TableRow>

                                              <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label31" runat="server" Text="Apart No. " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="employeeapartmentno" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label323" runat="server" Text="Middle Initial " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emermiddleinitial" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                             
                                        
                                  </asp:TableRow>
                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label15" runat="server" Text="City  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="employeecity" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                              <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label32" runat="server" Text="Last Name  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emerlastname" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
                                        
                                  </asp:TableRow>
                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label16" runat="server" Text=" State  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:DropDownList ID="employeestate" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                             <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label33" runat="server" Text=" Phone  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emerphone" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
                                        
                                  </asp:TableRow>
                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label17" runat="server" Text="Zip Code  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="employeezipcode" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                              <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label34" runat="server" Text="Email  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emeremail" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
                                        
                                  </asp:TableRow>
                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label18" runat="server" Text=" Country  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:DropDownList ID="employeecountry" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                             <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label35" runat="server" Text="Relationship  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="relationship" runat="server" ></asp:TextBox>
                                           </asp:TableCell>
                                        
                                  </asp:TableRow>

                                        <asp:TableRow>
     
    <asp:TableCell ColumnSpan="2">
      <b>Employment Terms</b>
    </asp:TableCell>
     
     <asp:TableCell   HorizontalAlign="left">
         
    </asp:TableCell>


</asp:TableRow>

                                        <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label19" runat="server" Text="Hire Date  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                             <asp:TextBox ID="emphiredate" runat="server" ></asp:TextBox>
                                           </asp:TableCell>

                                            <asp:TableCell>
                                                  <asp:CheckBox runat="server" Text="Employe is Active" ID="empisactive" />
                                            </asp:TableCell>



                                        </asp:TableRow>

                                          <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label20" runat="server" Text="Pay Schedule  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                            <asp:DropDownList ID="emppayschedule" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                            <asp:TableCell>
                                                  <asp:CheckBox runat="server" Text="Employe is a Manager" ID="empismanager" />
                                            </asp:TableCell>



                                        </asp:TableRow>

                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label21" runat="server" Text="Department  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                            <asp:DropDownList ID="empdepartment" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                            <asp:TableCell>
                                                  <asp:CheckBox runat="server" Text="Employe is a Salesman" ID="empissalesman" />
                                            </asp:TableCell>



                                        </asp:TableRow>

                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label36" runat="server" Text="Work Shift  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                            <asp:DropDownList ID="empsorkshift" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                            <asp:TableCell>
                                                  <asp:CheckBox runat="server" Text="Employe Works Full Time" ID="empworkfulltime" />
                                            </asp:TableCell>



                                        </asp:TableRow>

                                         <asp:TableRow>
                                           <asp:TableCell HorizontalAlign="left">
                                            <asp:Label CssClass="labels" ID="Label37" runat="server" Text="Hourly Rate  " ></asp:Label>
                                           </asp:TableCell >

                                           <asp:TableCell >
                                            <asp:DropDownList ID="emphourlyrate" runat="server" AutoPostBack="True"  >
                                              <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                           </asp:TableCell>

                                            <asp:TableCell>
                                                  <asp:CheckBox runat="server" Text="Allow Web Console Access" ID="empallowwebaccess" />
                                            </asp:TableCell>



                                        </asp:TableRow>

                                        </asp:Table>


                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>


<!--  /////////////////////////////////////////////////////////view4/////////////////////////////////////////////////////////-->


                      <asp:View ID="View4" runat="server">
                        <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <h3>
                                        test view 4 body
                                    </h3>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>

<!--  ////////////////////////////////////////////////////////view 5/////////////////////////////////////////////////////////-->

                      <asp:View ID="View5" runat="server">
                        <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <br />
                                    <br />
                                    <h3>
                                        test view 5 body
                                    </h3>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>

                    <!--  ////////////////////////////////////////////////////////view 6/////////////////////////////////////////////////////////-->

                     <asp:View ID="View6" runat="server">
                        <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                            <tr>
                                <td>
                                    <br />
                                          <asp:TableRow>

                                    <asp:TableCell HorizontalAlign="left">
                                  <asp:Label CssClass="labels" ID="Label38" runat="server" Text="Username: " ></asp:Label>
                                 </asp:TableCell >

                                 <asp:TableCell >
                                   <asp:TextBox ID="username" runat="server" ></asp:TextBox>
                                 </asp:TableCell>

                                 <asp:TableCell HorizontalAlign="left">
                                  <asp:Label CssClass="labels" ID="Label39" runat="server" Text="Password" ></asp:Label>
                                 </asp:TableCell >

                                 <asp:TableCell >
                                   <asp:TextBox ID="password" runat="server" ></asp:TextBox>
                                 </asp:TableCell>

           
      
</asp:TableRow>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:View>



<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  ////////////////////////////////////////////////////end multi view/////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
<!--  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

                </asp:MultiView>
				


            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" />
            </td>
        </tr>
    </table>



</asp:Content>
