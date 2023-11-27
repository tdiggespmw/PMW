<%@ Page Language="vb" MasterPageFile="~/login.master"  AutoEventWireup="true" CodeBehind="Login.aspx.vb" Inherits="PMW.Login"  %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
     <div class="lg-body">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Panel ID="PanelLogin" runat="server">
        <asp:UpdatePanel ID="UpdatePanelHome" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                       <div class="inner">  
                          
            		   <div id="lg-head">
                             <asp:Image ID="logo" runat="server" class="logo" ImageUrl="./images/logo.png" Width="100" />
                           <p>Management Console</p>
                            <p><asp:Label ID="lblNotes" runat="server" Text="Note to user" Visible="false"></asp:Label></span></p>
                       </div>
						   <div class="login">
						    <form id="lg-form">
								
									<li id="usr-field">
										
										<asp:TextBox ID="txtUserName" runat="server" CssClass="textbox" Placeholder="Email"></asp:TextBox>
										
									
                                    <li id="psw-field">
                                        
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" Placeholder="Password"></asp:TextBox><br />
                                     <li>                              <asp:textbox ID="txtCaptcha" CssClass="textbox" runat="server"></asp:textbox>
                                <botdetect:WebFormsCaptcha ID="captchaBox" runat="server"></botdetect:WebFormsCaptcha>
                                        
                                    </li><asp:Panel ID="Panel1" runat="server" DefaultButton="cmdLogin">
                                      <label class="container">
                                       <asp:CheckBox runat="server" ID="cbRememberMe"></asp:CheckBox>
                                        <span class="checkmark"></span>
                                          </label>
                                       <asp:Label ID="Label1" runat="server" Text="Remember Me" CssClass="checkmark-text"></asp:Label><br />
                                         <asp:Button ID="cmdLogin" runat="server" Text="Login" CssClass="submitButton" />
                                    
                               
                               </asp:Panel>
                                <asp:Label ID="lblMessage" runat="server" CssClass="labelsMessage" Font-Size="medium"></asp:Label>
								<br />
							    <p class="login_sub" style="text-align:center;">Can't login? <a href="mailto:support@pmwus.com" />Contact support</a></p>
                           
                                     </form>
                               
            </ContentTemplate>
        </asp:UpdatePanel>
        </asp:Panel>
	</div>	
</asp:Content>
