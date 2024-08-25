Public Partial Class pageLogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Try
            If txtUser.Text = "" Then
                ShowMessageBox("USER TIDAK BOLEH KOSONG")
            ElseIf txtPass.Text = "" Then
                ShowMessageBox("PASSWORD TIDAK BOLEH KOSONG")
            Else
                If txtUser.Text = "admin" And txtPass.Text = "admin" Then
                    Session("LoggedIn") = True
                    Response.Redirect("pageMainMenu.aspx")
                Else
                    ShowMessageBox("USER / PASSWORD TIDAK DIKENAL")
                End If
            End If
        Catch ex As Exception
            ShowMessageBox(ex.Message)
        End Try
    End Sub

    Private Sub ShowMessageBox(ByVal strMessage As String)
        Dim strScript As String = "<script language=JavaScript>"
        strScript += "alert(""" & strMessage & """);"
        strScript += "</script>"
        If (Not ClientScript.IsStartupScriptRegistered("MyMessage")) Then
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "MyMessage", strScript)
        End If
    End Sub


    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtPass.Text = ""
        txtUser.Text = ""
    End Sub
End Class