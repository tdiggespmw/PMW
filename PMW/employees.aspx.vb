Public Class employees
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            Dim strSQL As String
            Dim ds As DataSet

            ' Load Companies...
            strSQL = "SELECT stateid, statename FROM stateT ORDER BY statename"
            ds = SQLHelper.ExecuteDataset(SQLHelper.SQLConnection, CommandType.Text, strSQL)
            If ds Is Nothing Then
            ElseIf ds.Tables.Count = 0 Then
            ElseIf ds.Tables(0).Rows.Count = 0 Then
            Else
                state.DataValueField = "stateid"
                state.DataTextField = "statename"
                state.DataSource = ds
                state.DataBind()
            End If

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
        End If

    End Sub

    Public Sub CompanyOnSelectedIndexchange(sender As Object, e As EventArgs)
        Dim strSQL As String
        Dim ds As DataSet

        branch.Items.Clear()
        'division.Items.Clear()

        strSQL = "SELECT branchid, branchname FROM branchT where companyid=" + company.SelectedValue
        ds = SqlHelper.ExecuteDataset(SqlHelper.SQLConnection, CommandType.Text, strSQL)
        If ds Is Nothing Then
        ElseIf ds.Tables.Count = 0 Then
        ElseIf ds.Tables(0).Rows.Count = 0 Then
        Else
            branch.DataValueField = "branchid"
            branch.DataTextField = "branchname"
            branch.DataSource = ds
            branch.DataBind()
        End If

        'Dim newItem2 As New ListItem
        'newItem2.Text = "--Select--"
        'newItem2.Value = "0"
        'branch.Items.Insert(0, newItem2)

        'division.Enabled = False

    End Sub


    Protected Sub BranchOnSelectedIndexchange(sender As Object, e As EventArgs)
        '    Dim strSQL As String
        '    Dim ds As DataSet

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

End Class