Partial Public Class _Default
    Inherits System.Web.UI.Page
    ' Adam Kurniawan
    ' 2021804089
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Public Sub hapus()
        txtNo.Text = String.Empty
        txtNama.Text = String.Empty
        txtDiscount.Text = String.Empty
        txtHarga.Text = String.Empty
        txtJumlah.Text = String.Empty
        txtPpn.Text = String.Empty
        txtTotal.Text = String.Empty
        optJurusan.ClearSelection()
        optBerangkat.ClearSelection()
    End Sub

    Private Sub btnHitung_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHitung.Click
        Try
           
            Dim dblHarga As Double
            Dim dblJumlah As Double
            Dim dblPpn As Double
            Dim dblDiscount As Double
            Dim dblTotal As Double

            If txtJumlah.Text = "" Then
                MsgBox("Jumlah Tiket Belum di isi")
            Else
                dblJumlah = txtJumlah.Text
            End If

            If optJurusan.SelectedValue = "J" And optBerangkat.SelectedValue = "P" Then
                txtHarga.Text = 320000
                dblHarga = txtHarga.Text
                dblPpn = 0.04 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "J" And optBerangkat.SelectedValue = "M" Then
                txtHarga.Text = 370000
                dblHarga = txtHarga.Text
                dblPpn = 0.05 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "J" Then
                MsgBox("Keberangkatan Belum Dipilih")
            ElseIf optJurusan.SelectedValue = "S" And optBerangkat.SelectedValue = "P" Then
                txtHarga.Text = 480000
                dblHarga = txtHarga.Text
                dblPpn = 0.04 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "S" And optBerangkat.SelectedValue = "M" Then
                txtHarga.Text = 540000
                dblHarga = txtHarga.Text
                dblPpn = 0.05 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "S" Then
                MsgBox("Keberangkatan Belum Dipilih")
            ElseIf optJurusan.SelectedValue = "M" And optBerangkat.SelectedValue = "P" Then
                txtHarga.Text = 560000
                dblHarga = txtHarga.Text
                dblPpn = 0.04 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "M" And optBerangkat.SelectedValue = "M" Then
                txtHarga.Text = 610000
                dblHarga = txtHarga.Text
                dblPpn = 0.04 * dblHarga * dblJumlah
                txtPpn.Text = dblPpn
            ElseIf optJurusan.SelectedValue = "M" Then
                MsgBox("Keberangkatan Belum Dipilih")
            Else
                MsgBox("Jurusan Belum Dipilih")
            End If

            If txtJumlah.Text > 5 Or optBerangkat.SelectedValue = "P" Then
                dblDiscount = 0.05 * dblHarga * dblJumlah
                txtDiscount.Text = dblDiscount
            Else
                txtDiscount.Text = "0"
                dblDiscount = 0
            End If

            dblTotal = dblHarga * dblJumlah + dblPpn - dblDiscount
            txtTotal.Text = dblTotal

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        Call hapus()
    End Sub
End Class