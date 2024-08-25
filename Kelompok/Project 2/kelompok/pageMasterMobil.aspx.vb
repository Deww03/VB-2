Imports System
Imports System.Data
Imports System.Data.OleDb

Partial Public Class pageMasterMobil
    Inherits System.Web.UI.Page
    Private strCon As String
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Cek apakah sesi login ada
        If Session("LoggedIn") Is Nothing OrElse Not CType(Session("LoggedIn"), Boolean) Then
            ' Jika tidak ada, redirect ke halaman login
            Response.Redirect("pageLogin.aspx")
        End If
        Try
            strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=D:\Project\ASP\kelompok\kelompok.mdb;"

            If Not IsPostBack Then
                Call ListGrid()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "INSERT INTO TBL_MOBIL (KD_MOBIL,NM_MOBIL,WARNA,KONDISI,HRG_SEWA) VALUES ('" & txtKodeMobil.Text & "','" & txtNamaMobil.Text & "','" & txtWarna.Text & "','" & txtKondisi.Text & "','" & txtHargaSewa.Text & "') "
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()

            MsgBox("DATA SUDAH DIISI")
            Call ListGrid()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub ListGrid()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT * FROM TBL_MOBIL ORDER BY KD_MOBIL ASC"
            objAdapter = New OleDbDataAdapter(strSQL, myCon)
            objDataset = New DataSet
            objAdapter.Fill(objDataset)
            grdList.DataSource = objDataset
            grdList.DataBind()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub


    Private Sub grdList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdList.SelectedIndexChanged
        Try
            txtKodeMobil.Text = grdList.SelectedRow.Cells(1).Text
            txtNamaMobil.Text = grdList.SelectedRow.Cells(2).Text
            txtWarna.Text = grdList.SelectedRow.Cells(3).Text
            txtKondisi.Text = grdList.SelectedRow.Cells(4).Text
            txtHargaSewa.Text = Format(CDbl(grdList.SelectedRow.Cells(5).Text), "#,##0.00")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "UPDATE TBL_MOBIL SET NM_MOBIL='" & txtNamaMobil.Text & "',WARNA='" & txtWarna.Text & "',KONDISI='" & txtKondisi.Text & "',HRG_SEWA=" & CDbl(txtHargaSewa.Text) & " WHERE KD_MOBIL='" & txtKodeMobil.Text & "' "
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()

            MsgBox("DATA SUDAH DI UPDATE")
            Call ListGrid()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "DELETE FROM TBL_MOBIL WHERE KD_MOBIL='" & txtKodeMobil.Text & "' "
            objCommand = New OleDbCommand(strSQL, myCon)
            objCommand.ExecuteNonQuery()

            MsgBox("DATA SUDAH DI DELETE")
            Call ListGrid()

            myCon.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class