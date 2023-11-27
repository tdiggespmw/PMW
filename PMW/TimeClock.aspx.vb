Imports System.Data.SqlClient

Public Class TimeClock
    Inherits Page
    Dim strSQL

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        Dim dr As SqlDataReader

        strSQL = "SELECT * FROM TimeAttendanceT WHERE employeeid = '" + Session("employeeid").ToString() + "' AND dateworked = '" + DateTime.Today + "'"
        dr = SqlHelper.ExecuteReader(SqlHelper.SQLConnection, CommandType.Text, strSQL)

        dr.Read()

        If dr.HasRows Then


            lblclockintime.Text = Right(dr("intime").ToString(), 11)



            lblclockouttime.Text = Right(dr("outtime").ToString(), 11)

            Session("PunchID") = dr("PunchID")

        End If

    End Sub



    Protected Sub btnclockin_Click(sender As Object, e As EventArgs)
        strSQL = "INSERT INTO TimeAttendanceT (intime, employeeid, dateworked) VALUES ('" + DateTime.Now.ToString("HH:mm:00") + "'," + Session("employeeid").ToString + ",'" + DateTime.Now.ToString("MM/dd/yyyy") + "')"
        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)

        Response.Redirect("timeclock.aspx")

    End Sub

    Protected Sub btnclockout_Click(sender As Object, e As EventArgs)





        strSQL = "UPDATE TimeAttendanceT SET outtime ='" + DateTime.Now.ToString("HH:mm:00") + "' , employeeid=" + Session("employeeid").ToString + ", dateworked='" + DateTime.Now.ToString("MM/dd/yyyy") + "' WHERE PunchID=" + Session("PunchID").ToString()
        SqlHelper.ExecuteNonQuery(SqlHelper.SQLConnection, CommandType.Text, strSQL)

        Response.Redirect("timeclock.aspx")


    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs)
        Response.Redirect("contact.aspx")
    End Sub
End Class