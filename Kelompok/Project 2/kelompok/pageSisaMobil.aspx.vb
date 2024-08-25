Imports System
Imports System.Data
Imports System.Data.OleDb
Partial Public Class pageSisaMobil
    Inherits System.Web.UI.Page
    Private strCon As String
    Private strSQL As String
    Private objDataTable As DataTable
    Private objReader As OleDbDataReader
    Private objAdapter As OleDbDataAdapter
    Private objDataset As DataSet
    Private myCon As OleDbConnection
    Private objCommand As OleDbCommand
    Private strKodeBarang As String
    Private arrBarang(2) As String
    Private dblQtyAdd As Double
    Private dblQtyIn As Double
    Private dblQtyAkhir As Double
    Private dblQtyOut As Double

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

    Private Sub ListGrid()
        Try
            myCon = New OleDbConnection(strCon)
            myCon.Open()

            strSQL = "SELECT B.QTY_ADD, B.QTY_IN, B.QTY_OUT, B.QTY_AKHIR, B.KD_MOBIL, A.NM_MOBIL, A.WARNA, A.KONDISI, A.HRG_SEWA FROM TBL_MOBIL A, TBL_STOCK B WHERE A.KD_MOBIL = B.KD_MOBIL ORDER BY B.KD_MOBIL ASC"
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

End Class