Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Imports System.Data.SqlClient
Imports System.Net.NetworkInformation

Public Class login
    Inherits System.Web.UI.Page

    ' Public Shared PermissionsEmployee As clsEmployee
    ' Public Shared PermissionsCustomerContact As clsCustomerContact

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





        Page.ClientTarget = "Uplevel"       ' Resolve IE 11 compatibility problem...




        ' Remember Me?
        If Not IsPostBack Then
            txtUserName.Focus()         ' Set focus to Username...

            If Request.Browser.Cookies Then
                If Request.Cookies("PUMPANDMOTORWORKSLOGIN") IsNot Nothing Then
                    Try
                        txtUserName.Text = Replace(Request.Cookies("PUMPANDMOTORWORKSLOGIN").Value, "UNAME=", "")
                    Catch
                    End Try
                End If
            End If
        End If
    End Sub

    Private Sub cmdLogin_Click(sender As Object, e As System.EventArgs) Handles cmdLogin.Click
        ' LOGIN PROCESS...
        Dim dr As SqlDataReader
        Dim dr2 As SqlDataReader
        Dim dr3 As SqlDataReader
        Dim strUserName As String
        Dim strPassword As String
        Dim strSQL As String


        Dim customerContactID As Long = 0
        Dim employeeEmail As String = ""

        Dim macid
        strUserName = txtUserName.Text
        strPassword = txtPassword.Text
        Dim isHuman As Boolean = captchaBox.Validate(txtCaptcha.Text)
        txtCaptcha.Text = Nothing


        If isHuman Then


            Session.Clear()
            Dim nics() As NetworkInterface = NetworkInterface.GetAllNetworkInterfaces()

            'nics(1).ToString()

            Response.Write(nics(1).Id.ToString())
            'Response.End()
            ' Find User...
            'find contact
            'find macaddress




            strSQL = "SELECT contactid,securityroleid,userid FROM userT WHERE username = '" + strUserName + "' AND password = '" + strPassword + "'"
            dr = SqlHelper.ExecuteReader(SqlHelper.SQLConnection, CommandType.Text, strSQL)

            dr.Read()
            If dr("contactid").ToString <= 0 Then
                lblMessage.Text = "Invalid Login." '"Your MAC Address:" + nics(1).Id.ToString + " is not activated in our system."
            Else

                strSQL = "SELECT employeeid FROM EmployeeinfoT WHERE contactid = " + dr("contactid").ToString()
                dr2 = SqlHelper.ExecuteReader(SqlHelper.SQLConnection, CommandType.Text, strSQL)

                dr2.Read()

                strSQL = "SELECT firstname,lastname,companyid FROM contactT WHERE contactid = " + dr("contactid").ToString()
                dr3 = SqlHelper.ExecuteReader(SqlHelper.SQLConnection, CommandType.Text, strSQL)

                dr3.Read()


                Session("LoggedInContactID") = dr("contactid")
                Session("LoggedInSecurityRoleID") = dr("securityroleid")
                Session("LoggedInUserID") = dr("userid")
                Session("LoggedInFullName") = dr3("firstname").ToString() + " " + dr3("lastname").ToString()
                Session("companyid") = dr3("companyid")
                Session("employeeid") = dr2("employeeid")
                Session("validUser") = True
                Response.Redirect("webform2.aspx")
            End If



            'macid = dr("macaddress").ToString()



        Else
                lblMessage.Text = "Your not human."
        End If

    End Sub


    Public Sub WriteCookie(ByVal strUsernameIn As String, ByVal strPasswordIn As String)
        If (Request.Browser.Cookies) Then
            If (Request.Cookies("PUMPANDMOTORWORKSLOGIN") Is Nothing) Then
                Response.Cookies("PUMPANDMOTORWORKSLOGIN").Expires = DateTime.Now.AddDays(30)
                Response.Cookies("PUMPANDMOTORWORKSLOGIN").Value = strUsernameIn
                ' Save Password???
            Else
                Response.Cookies("PUMPANDMOTORWORKSLOGIN").Expires = DateTime.Now.AddDays(30)
                Response.Cookies("PUMPANDMOTORWORKSLOGIN").Value = strUsernameIn
                ' Save Password???
            End If
        End If
    End Sub
    Private Sub cmdForgot_Click(sender As Object, e As System.EventArgs)
        Response.Redirect("Account/LoginForgot.aspx")
    End Sub




End Class