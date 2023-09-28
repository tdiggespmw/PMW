Imports System
Imports System.ComponentModel
Imports System.ComponentModel.Design.Serialization
Imports System.Data.SqlClient
Imports System.Net
Imports System.Reflection
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.ReportServer.ServiceModel.DataContracts
Imports DevExpress.XtraPrinting.Export.Pdf
Imports DevExpress.XtraSpellChecker.Parser


Public Class WebForm2
    Inherits System.Web.UI.Page

    Dim strSQL As String
    Dim ds As DataSet
    Dim dsc As DataSet



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Tab1.CssClass = "Clicked"
            MainView.ActiveViewIndex = 0

            Tab2.Visible = False
            Tab3.Visible = False
            Tab4.Visible = False
            Tab5.Visible = False
            Tab6.Visible = False

            lblname.Visible = False
            companyname.Visible = False
            btnsavecompany.Visible = False
            btncancelcompany.Visible = False

            lblbranchname.Visible = False
            branchname.Visible = False
            btnsavebranch.Visible = False
            btncancelbranch.Visible = False
            ' Load Companies...


            strSQL = "SELECT companyid, companyname FROM companyT ORDER BY companyname"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                company.DataValueField = "companyid"
                company.DataTextField = "companyname"
                company.DataSource = ds
                company.DataBind()
            End If
            Dim newItem2 As New ListItem
            newItem2.Text = "--Select--"
            newItem2.Value = "0"
            company.Items.Insert(0, newItem2)


            newItem2.Text = "--Select--"
            newItem2.Value = "0"
            branch.Items.Insert(0, newItem2)



            branch.Enabled = False




        End If

    End Sub


    Protected Sub Tab1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Tab1.CssClass = "Clicked"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        Tab5.CssClass = "Initial"
        Tab6.CssClass = "Initial"
        MainView.ActiveViewIndex = 0
    End Sub

    Protected Sub Tab2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Tab2.Click
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Clicked"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        Tab5.CssClass = "Initial"
        Tab6.CssClass = "Initial"
        MainView.ActiveViewIndex = 2
    End Sub

    Protected Sub Tab3_Click(ByVal sender As Object, ByVal e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Clicked"
        Tab4.CssClass = "Initial"
        Tab5.CssClass = "Initial"
        Tab6.CssClass = "Initial"
        MainView.ActiveViewIndex = 2
    End Sub

    Protected Sub Tab4_Click(ByVal sender As Object, ByVal e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Clicked"
        Tab5.CssClass = "Initial"
        Tab6.CssClass = "Initial"
        MainView.ActiveViewIndex = 3


    End Sub

    Protected Sub Tab5_Click(ByVal sender As Object, ByVal e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        Tab5.CssClass = "Clicked"
        Tab6.CssClass = "Initial"
        MainView.ActiveViewIndex = 4


    End Sub

    Protected Sub Tab6_Click(ByVal sender As Object, ByVal e As EventArgs)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Initial"
        Tab3.CssClass = "Initial"
        Tab4.CssClass = "Initial"
        Tab5.CssClass = "Initial"
        Tab6.CssClass = "Clicked"
        MainView.ActiveViewIndex = 5


    End Sub


    Public Sub CompanyOnSelectedIndexchange(sender As Object, e As EventArgs)


        ismaincompany.Checked = False
        iscustomer.Checked = False
        isvendor.Checked = False


        branch.Items.Clear()
        'division.Items.Clear()

        strSQL = "SELECT * FROM branchT where companyid=" + company.SelectedValue
        dsc = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If dsc Is Nothing Then
        ElseIf dsc.Tables.Count = 0 Then
        ElseIf dsc.Tables(0).Rows.Count = 0 Then
        Else
            branch.DataValueField = "branchid"
            branch.DataTextField = "branchname"
            branch.DataSource = dsc
            branch.DataBind()

        End If

        strSQL = "SELECT * FROM companyT where companyid=" + company.SelectedValue
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)

        With ds.Tables(0).Rows(0)
            iscustomer.Checked = .Item("iscustomer")
            isvendor.Checked = .Item("isvendor")
            ismaincompany.Checked = .Item("isprimary")
        End With

        With dsc.Tables(0).Rows(0)

            branchphone.Text = .Item("branchphone").ToString()
            branchmainemail.Text = .Item("primaryemail").ToString()
            branchacctemail.Text = .Item("billingemail").ToString()
            branchwebaddress.Text = .Item("website").ToString()
            branchfax.Text = .Item("faxnumber").ToString()


            shipaddressline1.Text = .Item("shippingaddressline1").ToString()
            billaddressline.Text = .Item("billingaddressline1").ToString()
            shipaddressline2.Text = .Item("shippingaddressline2").ToString()
            billaddressline2.Text = .Item("billingaddressline2").ToString()
            shipcity.Text = .Item("shippingcity").ToString()
            billcity.Text = .Item("billingcity").ToString()
            shipstate.SelectedValue = .Item("shippingstateid").ToString()

            billstate.SelectedValue = .Item("billingstateid").ToString()
            shipzip.Text = .Item("shippingzipcode").ToString()
            billzip.Text = .Item("billingzipcode").ToString()
            ddshipcountry.Text = .Item("shippingcountryid").ToString()
            ddbillcountry.Text = .Item("billingcountryid").ToString()
        End With


        'strSQL = "SELECT * FROM companyT where companyid=" + company.SelectedValue
        'ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)


        branch.Enabled = True


    End Sub


    Protected Sub BranchOnSelectedIndexchange(sender As Object, e As EventArgs)
        '     

        '    division.Items.Clear()
        '    division.Enabled = True

        '    strSQL = "SELECT divisionid, name FROM divisions where branchid=" + branch.SelectedValue
        '    ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        '    If ds Is Nothing Then
        '    ElseIf ds.Tables.Count = 0 Then
        '    ElseIf ds.Tables(0).Rows.Count = 0 Then
        '    Else
        '        division.DataValueField = "divisionid"
        '        division.DataTextField = "name"
        '        division.DataSource = ds
        '        division.DataBind()
        '    End If
    End Sub

    Protected Sub addnewbranch_Click(sender As Object, e As EventArgs)

        lblbranchname.Visible = True
        branchname.Visible = True
        btnsavebranch.Visible = True
        btncancelbranch.Visible = True

        ' branch.SelectedValue = 0

    End Sub

    Protected Sub editselectedbranch_Click(sender As Object, e As EventArgs)





    End Sub

    Protected Sub editselectedcompany_Click(sender As Object, e As EventArgs)
        companyname.Text = company.SelectedValue
    End Sub

    Protected Sub addnewcompany_Click(sender As Object, e As EventArgs)
        lblname.Visible = True
        companyname.Visible = True
        btnsavecompany.Visible = True
        btncancelcompany.Visible = True

        ismaincompany.Checked = False
        iscustomer.Checked = False
        isvendor.Checked = False

        company.SelectedValue = 0

    End Sub

    Protected Sub btnsavecompany_Click(sender As Object, e As EventArgs)

        strSQL = "INSERT INTO companyT (companyname,isprimary,iscustomer,isvendor) VALUES ('" + companyname.Text + "','" + ismaincompany.Checked.ToString() + "','" + iscustomer.Checked.ToString() + "','" + isvendor.Checked.ToString() + "')"
        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        lblname.Visible = False
        companyname.Visible = False
        btnsavecompany.Visible = False
        btncancelcompany.Visible = False

        ' Load Companies...
        strSQL = "SELECT companyid, companyname FROM companyT ORDER BY companyname"
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            company.DataValueField = "companyid"
            'company.Items.FindByText(companyname.Text.Trim).Selected = True
            company.DataTextField = "companyname"
            company.DataSource = ds
            company.DataBind()
        End If


        'strSQL = "UPDATE companyT  SET companyname='" + companyname.Text + "'"
        'SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)



    End Sub

    Protected Sub ismaincompany_CheckedChanged(sender As Object, e As EventArgs)
        If ismaincompany.Checked Then

            Tab3.Visible = True
        Else
            Tab3.Visible = False
        End If
    End Sub

    Protected Sub iscustomer_CheckedChanged(sender As Object, e As EventArgs)
        If iscustomer.Checked Then

            Tab4.Visible = True
        Else
            Tab4.Visible = False
        End If

    End Sub

    Protected Sub isvendor_CheckedChanged(sender As Object, e As EventArgs)
        If isvendor.Checked Then

            Tab5.Visible = True

        Else
            Tab5.Visible = False
        End If
    End Sub

    Protected Sub btncancelcompany_Click(sender As Object, e As EventArgs)
        lblname.Visible = False
        companyname.Visible = False
        btnsavecompany.Visible = False
        btncancelcompany.Visible = False
    End Sub

    Protected Sub btnsavebranch_Click(sender As Object, e As EventArgs)
        strSQL = "INSERT INTO branchT (branchname,companyid) VALUES ('" + branchname.Text + "'," + company.SelectedValue + ")"
        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        lblbranchname.Visible = False
        branchname.Visible = False
        btnsavebranch.Visible = False
        btncancelbranch.Visible = False
    End Sub

    Protected Sub btncancelbranch_Click(sender As Object, e As EventArgs)
        lblbranchname.Visible = False
        branchname.Visible = False
        btnsavebranch.Visible = False
        btncancelbranch.Visible = False
    End Sub

    Protected Sub branch_SelectedIndexChanged(sender As Object, e As EventArgs)





    End Sub



    Protected Sub continuebutton1_Click(sender As Object, e As EventArgs)

        strSQL = "UPDATE branchT SET "
        strSQL += "branchphone='" + branchphone.Text & "', "
        strSQL += "primaryemail='" + branchmainemail.Text & "', "
        strSQL += "billingemail='" + branchacctemail.Text & "', "
        strSQL += "website='" + branchwebaddress.Text & "', "
        strSQL += "faxnumber='" + branchfax.Text & "', "


        strSQL += "shippingaddressline1='" + shipaddressline1.Text & "', "
        strSQL += "billingaddressline1='" + billaddressline.Text & "', "
        strSQL += "shippingaddressline2='" + shipaddressline2.Text & "', "
        strSQL += "billingaddressline2='" + billaddressline2.Text & "', "
        strSQL += "shippingcity='" + shipcity.Text & "', "
        strSQL += "billingcity='" + billcity.Text & "', "
        strSQL += "shippingstateid=" + shipstate.Text & ", "
        strSQL += "billingstateid=" + billstate.Text & ", "
        strSQL += "shippingzipcode=" + shipzip.Text & ", "
        strSQL += "billingzipcode=" + billzip.Text & ", "
        strSQL += "shippingcountryid=" + ddshipcountry.Text & ", "
        strSQL += "billingcountryid=" + ddbillcountry.Text & ""


        strSQL += " WHERE branchid = " + branch.SelectedValue + ""
        'Response.Write("<font color=white>" & strSQL & " <br>")

        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        Tab1.CssClass = "Initial"
        Tab2.CssClass = "Clicked"
        Tab2.Visible = True
        MainView.ActiveViewIndex = 2


    End Sub

    Protected Sub shipstate_PreRender(sender As Object, e As EventArgs)
        If Not IsPostBack Then

            ' Load States...
            strSQL = "SELECT stateid, statename FROM stateT ORDER BY statename"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                shipstate.DataValueField = "stateid"
                shipstate.DataTextField = "statename"
                shipstate.DataSource = ds
                shipstate.DataBind()
            End If

        End If

    End Sub

    Protected Sub billstate_PreRender(sender As Object, e As EventArgs)
        If Not IsPostBack Then


            ' Load States...
            strSQL = "SELECT stateid, statename FROM stateT ORDER BY statename"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                billstate.DataValueField = "stateid"
                billstate.DataTextField = "statename"
                billstate.DataSource = ds
                billstate.DataBind()
            End If
        End If


    End Sub

    Protected Sub ddbillcountry_PreRender(sender As Object, e As EventArgs)

        If Not IsPostBack Then



            strSQL = "SELECT countryid, countryname FROM countryT ORDER BY countryname"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                ddbillcountry.DataValueField = "countryid"
                ddbillcountry.DataTextField = "countryname"
                ddbillcountry.DataSource = ds
                ddbillcountry.DataBind()
            End If

        End If


    End Sub

    Protected Sub ddshipcountry_PreRender(sender As Object, e As EventArgs)

        If Not IsPostBack Then


            strSQL = "SELECT countryid, countryname FROM countryT ORDER BY countryname"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                ddshipcountry.DataValueField = "countryid"
                ddshipcountry.DataTextField = "countryname"
                ddshipcountry.DataSource = ds
                ddshipcountry.DataBind()
            End If

        End If


    End Sub

    Protected Sub ddcontacts_SelectedIndexChanged(sender As Object, e As EventArgs)



        strSQL = "SELECT * FROM contactT INNER JOIN EmployeeInfoT ON ContactT.contactid=EmployeeinfoT.contactid INNER JOIN userT ON contactT.contactid=userT.contactid  where contactT.contactid=" + ddcontacts.SelectedValue
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)



        With ds.Tables(0).Rows(0)

            'prefix.Text = .Item("prefix").ToString()
            lastname.Text = .Item("lastname").ToString()
            middle.Text = .Item("middleinitial").ToString()
            firstname.Text = .Item("firstname").ToString()
            'suffix.Text = .Item("suffix").ToString()


            jobtitle.Text = .Item("jobtitle").ToString()
            mobilephone.Text = .Item("mobilephone").ToString()
            officephone.Text = .Item("officephone").ToString()
            homephone.Text = .Item("homephone").ToString()
            personalemail.Text = .Item("personalemail").ToString()
            workemail.Text = .Item("workemail").ToString()
            ext.Text = .Item("extension").ToString()

            username.Text = .Item("username").ToString()
            password.Text = .Item("password").ToString()
            dduserrole.SelectedValue = .Item("securityroleid")

            employeeaddress.Text = .Item("Address").ToString()
            employeeapartmentno.Text = .Item("apartmentnumber").ToString()
            employeecity.Text = .Item("city").ToString()
            employeestate.SelectedValue = .Item("stateid")
            employeezipcode.Text = .Item("zipcode").ToString()
            'employeecountry.SelectedValue = .Item("countryid")
            emerlastname.Text = .Item("emergencycontactlastname").ToString()
            emermiddleinitial.Text = .Item("emergencycontactmiddleinitial").ToString()
            emerfirstname.Text = .Item("emergencycontactfirstname").ToString()
            emerrelationship.Text = .Item("emergencycontactrelationship").ToString()
            emerphone.Text = .Item("emergencycontactphonenumber").ToString()
            emeremail.Text = .Item("emergencycontactemailaddress").ToString()

            emphiredate.Text = .Item("hiredate").ToString()






            'username.Text = .Item("username").ToString()
            ' password.Text = .Item("password").ToString()
            'dduserrole.SelectedValue = .Item("userroleid").ToString()


            'ddshipcountry.Text = .Item("shippingcountryid").ToString()
            'ddbillcountry.Text = .Item("billingcountryid").ToString()
        End With

        Session("ddcontacts") = ddcontacts.SelectedValue

    End Sub

    Protected Sub ddcontacts_PreRender(sender As Object, e As EventArgs)
        strSQL = "SELECT contactid,lastname + ', ' + firstname AS Fullname  FROM contactT ORDER BY lastname"
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            ddcontacts.DataValueField = "contactid"
            ddcontacts.DataTextField = "fullname"
            ddcontacts.DataSource = ds
            ddcontacts.DataBind()
        End If
        ddcontacts.SelectedValue = Session("ddcontacts")
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs)
        strSQL = "INSERT INTO contactT (firstname,middleinitial,lastname,mobilephone,officephone,homephone,isvendor) VALUES ('" + companyname.Text + "','" + ismaincompany.Checked.ToString() + "','" + iscustomer.Checked.ToString() + "','" + isvendor.Checked.ToString() +
        "')"
        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)
    End Sub

    Protected Sub dduserrole_PreRender(sender As Object, e As EventArgs)
        strSQL = "SELECT securityroleid,securityrolename    FROM securityroleT ORDER BY securityrolename"
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            dduserrole.DataValueField = "securityroleid"
            dduserrole.DataTextField = "securityrolename"
            dduserrole.DataSource = ds
            dduserrole.DataBind()
        End If
    End Sub

    Protected Sub employeestate_PreRender(sender As Object, e As EventArgs)



        ' Load States...
        strSQL = "SELECT stateid, statename FROM stateT ORDER BY statename"
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                employeestate.DataValueField = "stateid"
                employeestate.DataTextField = "statename"
                employeestate.DataSource = ds
                employeestate.DataBind()
            End If

    End Sub

    Protected Sub employeecountry_SelectedIndexChanged(sender As Object, e As EventArgs)
        strSQL = "SELECT countryid, countryname FROM countryT ORDER BY countryname"
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            ddshipcountry.DataValueField = "countryid"
            ddshipcountry.DataTextField = "countryname"
            ddshipcountry.DataSource = ds
            ddshipcountry.DataBind()
        End If
    End Sub
End Class