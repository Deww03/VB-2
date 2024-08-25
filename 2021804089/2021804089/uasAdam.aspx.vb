Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class _Default
    Inherits System.Web.UI.Page
    Private strCon As String
    Private myCon As OleDbConnection
    Private strSQL As String
    Private objCommand As OleDbCommand
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=D:\Kuliah\VB2\AdamKurniawan\INVENTORY\INVENTORY.mdb;"

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub btnHitung_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnHitung.Click
        Try
            Dim dblPPn As Double
            Dim dblHasilPPn As Double
            Dim dblJual As Double
            Dim dblTotal As Double

            If txtJual.Text = "" Then
                MsgBox("Harga Jual Belum di isi")
            Else
                dblJual = txtJual.Text
            End If

            If optJenis.SelectedValue = "D" Then
                dblPPn = 0.12
                txtPPn.Text = 12
            ElseIf optJenis.SelectedValue = "E" Then
                dblPPn = 0.17
                txtPPn.Text = 17
            Else
                dblPPn = 0
                txtPPn.Text = 0
            End If

            dblHasilPPn = dblJual * dblPPn

            dblTotal = dblJual + dblHasilPPn
            txtTotal.Text = dblTotal

        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
    End Sub

    Private Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtNo.Text = String.Empty
        txtNama.Text = String.Empty
        txtPemilik.Text = String.Empty
        txtRangka.Text = String.Empty
        txtWarna.Text = String.Empty
        txtTahun.Text = String.Empty
        txtPPn.Text = String.Empty
        txtJual.Text = String.Empty
        txtTotal.Text = String.Empty
        optJenis.ClearSelection()
    End Sub

    Private Sub btnSimpan_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSimpan.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "INSERT INTO TBLPENJUALAN (No,Pemilik,Nama,NoRangka,Warna,Jenis,Tahun,HargaJual,PPn,TotalHarga) VALUES ('" & txtNo.Text & "','" & txtPemilik.Text & "','" & txtNama.Text & "','" & txtRangka.Text & "','" & txtWarna.Text & "','" & txtJenis.Text & "','"  )"
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()

            MsgBox("DATA SUDAH DISIMPAN")

            myCon.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class