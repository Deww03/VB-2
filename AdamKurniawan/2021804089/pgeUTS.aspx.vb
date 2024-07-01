Public Partial Class pgeUTS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnHitung_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHitung.Click
        Try

            Dim dblPinjaman As Double
            Dim dblBungaPinjaman As Double
            Dim dblBunga As Double
            Dim dblDurasi As Double
            Dim dblCicilan As Double
            Dim dblPinjamanBunga As Double

            If txtPinjaman.Text = "" Then
                MsgBox("Pinjaman Belum di isi")
            Else
                dblPinjaman = txtPinjaman.Text
            End If

            If txtDurasi.Text = "" Then
                MsgBox("Durasi Belum di isi")
            Else
                dblDurasi = txtDurasi.Text
            End If

            If optPinjaman.SelectedValue = "T" Then
                dblBungaPinjaman = 0.05
                txtBungaPinjaman.Text = 5
            ElseIf optPinjaman.SelectedValue = "B" Then
                dblBungaPinjaman = 0.08
                txtBungaPinjaman.Text = 8
            Else
                MsgBox("Jenis Pinjaman Belum Dipilih")
            End If

            dblBunga = dblPinjaman * dblBungaPinjaman
            txtBunga.Text = dblBunga

            dblPinjamanBunga = dblPinjaman + dblBunga
            txtPinjamanBunga.Text = dblPinjamanBunga

            dblCicilan = dblPinjaman + dblBunga / dblDurasi
            txtCicilan.Text = dblCicilan

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtNo.Text = String.Empty
        txtNama.Text = String.Empty
        txtPinjaman.Text = String.Empty
        txtBunga.Text = String.Empty
        txtBungaPinjaman.Text = String.Empty
        txtCicilan.Text = String.Empty
        txtDurasi.Text = String.Empty
        txtPinjamanBunga.Text = String.Empty
        optPinjaman.ClearSelection()
    End Sub
End Class