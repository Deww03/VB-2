Public Partial Class pageMainMenu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Cek apakah sesi login ada
        If Session("LoggedIn") Is Nothing OrElse Not CType(Session("LoggedIn"), Boolean) Then
            ' Jika tidak ada, redirect ke halaman login
            Response.Redirect("pageLogin.aspx")
        End If
    End Sub

End Class