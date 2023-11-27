Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("validUser") Is Nothing Or Session("validUser") = False Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class