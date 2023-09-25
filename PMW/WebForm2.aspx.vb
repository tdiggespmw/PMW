Imports System
Imports System.Data.SqlClient
Imports System.Net
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.XtraPrinting.Export.Pdf


Public Class WebForm2
    Inherits System.Web.UI.Page

    Dim strSQL As String
    Dim ds As DataSet
    Dim dsc As DataSet



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Tab1.CssClass = "Clicked"
            MainView.ActiveViewIndex = 0

            'Tab2.Visible = False
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
        MainView.ActiveViewIndex = 1
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

            strSQL = "SELECT * FROM companyT where companyid=" + company.SelectedValue
            ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)

            With ds.Tables(0).Rows(0)
                iscustomer.Checked = .Item("iscustomer")
                isvendor.Checked = .Item("isvendor")
                ismaincompany.Checked = .Item("isprimary")
            End With

            With dsc.Tables(0).Rows(0)
                shipaddressline1.Text = .Item("shippingaddressline1").ToString()
                billaddressline.Text = .Item("billingaddressline1").ToString()
                shipaddressline2.Text = .Item("shippingaddressline2").ToString()
                billaddressline2.Text = .Item("billingaddressline2").ToString()
                shipcity.Text = .Item("shippingcity").ToString()
                billcity.Text = .Item("billingcity").ToString()
                ' shipstate.Text = .Item("shippingstate").ToString()
                'billstate.Text = .Item("billingstate").ToString()
                shipzip.Text = .Item("shippingzipcode").ToString()
                billzip.Text = .Item("billingzipcode").ToString()
                'shipcountry.Text = .Item("shippingcountry").ToString()
                'billcountry.Text = .Item("billingcountry").ToString()
            End With




        End If



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

        strSQL = "INSERT INTO companyT (companyname) VALUES ('" + companyname.Text + "')"
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

    End Sub
End Class