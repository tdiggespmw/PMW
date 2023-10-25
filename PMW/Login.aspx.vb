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
        Dim strUserName As String
        Dim strPassword As String
        Dim strSQL As String
        Dim customerContactID As Long = 0
        Dim employeeEmail As String = ""
        Dim userid
        Dim contactid As Long = 0
        Dim macid
        strUserName = txtUserName.Text
        strPassword = txtPassword.Text

        Session.Clear()
        Dim nics() As NetworkInterface = NetworkInterface.GetAllNetworkInterfaces()

        nics(1).ToString()


        ' Find User...
        'find contact
        'find macaddress



        strSQL = "SELECT userid FROM userT WHERE username = '" + strUserName + "' AND password = '" + strPassword + "'"
        contactid = SqlHelper.ExecuteScalar(SqlHelper.SQLConnection, CommandType.Text, strSQL)



        strSQL = "SELECT macaddress FROM deviceT WHERE contactid = " + contactid '+ " AND macaddress='" + nics(1).ToString + "'"
        macid = SqlHelper.ExecuteScalar(SqlHelper.SQLConnection, CommandType.Text, strSQL)




        If macid < 0 Then
            lblMessage.Text = "Invalid login information."
        Else
            Session("LoggedInUserID") = userid
            Session("validUser") = True
            Response.Redirect("webform2.aspx")
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